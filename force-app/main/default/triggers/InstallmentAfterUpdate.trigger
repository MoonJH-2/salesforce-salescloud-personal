trigger InstallmentAfterUpdate on Installment__c(after update) {
  Set<Id> orderIds = new Set<Id>();
  for (Installment__c inst : Trigger.new) {
    if (inst.Order__c != null) {
      orderIds.add(inst.Order__c);
    }
  }

  List<Order> ordersToUpdate = new List<Order>();

  for (Id orderId : orderIds) {
    List<Installment__c> related = [
      SELECT Status__c
      FROM Installment__c
      WHERE Order__c = :orderId
    ];

    Boolean allPaid = true;
    for (Installment__c i : related) {
      if (i.Status__c != '정상') {
        allPaid = false;
        break;
      }
    }

    if (allPaid) {
      ordersToUpdate.add(new Order(Id = orderId, Status = 'Closed'));
    }
  }

  if (!ordersToUpdate.isEmpty()) {
    update ordersToUpdate;
  }
}
