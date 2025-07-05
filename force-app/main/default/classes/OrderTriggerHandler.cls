public class OrderTriggerHandler {
  public static void createPaymentSchedules(
    List<Order> newOrders,
    Map<Id, Order> oldMap
  ) {
    List<Payment_Status__c> paymentsToInsert = new List<Payment_Status__c>();
    for (Order o : newOrders) {
      // '계약 진행 중' 상태로 처음 변경되었고, 납부 방식과 총액이 있을 때만 실행
      if (
        o.Status == '계약 진행 중' &&
        oldMap.get(o.Id).Status != '계약 진행 중' &&
        o.Payment_Method__c != null &&
        o.TotalAmount != null &&
        o.TotalAmount > 0
      ) {
        Integer divisor;
        Integer monthIncrement;

        switch on o.Payment_Method__c {
          when '년별' {
            divisor = 1;
            monthIncrement = 12;
          }
          when '반기별' {
            divisor = 2;
            monthIncrement = 6;
          }
          when '분기별' {
            divisor = 4;
            monthIncrement = 3;
          }
          when '월별' {
            divisor = 12;
            monthIncrement = 1;
          }
          when else {
            divisor = 0;
            monthIncrement = 0;
          }
        }

        if (divisor > 0) {
          Decimal installmentAmount = o.TotalAmount.divide(
            divisor,
            2,
            RoundingMode.HALF_UP
          );
          Date startDate = o.EffectiveDate; // 주문 시작일을 기준으로 계산

          for (Integer i = 0; i < divisor; i++) {
            Payment_Status__c ps = new Payment_Status__c();
            ps.Order__c = o.Id;
            ps.Name = o.OrderNumber + ' - ' + (i + 1) + '회차';
            ps.Payment_Amount__c = installmentAmount;
            // 각 회차의 납부 기일 계산
            ps.Payment_Due_Date__c = startDate.addMonths(
                monthIncrement * (i + 1)
              )
              .toStartOfMonth()
              .addDays(-1); // 다음 납부 주기 월의 말일
            ps.Status__c = '미납';
            paymentsToInsert.add(ps);
          }
        }
      }
    }

    if (!paymentsToInsert.isEmpty()) {
      insert paymentsToInsert;
    }
  }
}
