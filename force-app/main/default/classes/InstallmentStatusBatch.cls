global class InstallmentStatusBatch implements Database.Batchable<SObject> {
  global Database.QueryLocator start(Database.BatchableContext bc) {
    return Database.getQueryLocator(
      [
        SELECT Id, Epay_No__c, Giro_No__c, Due_Date__c
        FROM Installment__c
        WHERE Status__c = '미납'
      ]
    );
  }

  global void execute(
    Database.BatchableContext bc,
    List<Installment__c> records
  ) {
    for (Installment__c inst : records) {
      Map<String, String> params = new Map<String, String>{
        'ptco_code' => '951012345',
        'cls_code' => '90',
        'giro_no' => inst.Giro_No__c,
        'epay_no' => inst.Epay_No__c,
        'pay_yymm_seq' => '202008',
        'noti_issu_type' => '0',
        'etc_type_code' => '00'
      };
      HttpResponse res = GiroBillingService.checkPaymentStatus(params);
      if (res.getStatusCode() == 200 && res.getBody().contains('pay_amt')) {
        inst.Status__c = '정상';
      }
    }
    update records;
  }

  global void finish(Database.BatchableContext bc) {
  }
}
