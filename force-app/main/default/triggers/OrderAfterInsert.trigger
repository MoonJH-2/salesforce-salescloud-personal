trigger OrderAfterInsert on Order(after insert) {
  List<Installment__c> installmentsToInsert = new List<Installment__c>();

  for (Order o : Trigger.new) {
    if (
      o.Payment_Term__c ==
      'Quarterly' && // ✔ 필드 존재 확인됨
      o.TotalAmount != null &&
      o.EffectiveDate != null // ✔ OrderDate → EffectiveDate (표준필드 기준)
    ) {
      Decimal installment = o.TotalAmount / 4;
      Date startDate = o.EffectiveDate;

      for (Integer i = 0; i < 4; i++) {
        installmentsToInsert.add(
          new Installment__c(
            Order__c = o.Id,
            Installment_Amount__c = installment,
            Due_Date__c = startDate.addMonths(i * 3),
            Status__c = '미납'
          )
        );
      }
    }
  }

  if (!installmentsToInsert.isEmpty()) {
    insert installmentsToInsert;
  }
}
