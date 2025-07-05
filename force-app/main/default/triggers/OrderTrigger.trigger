trigger OrderTrigger on Order(after update) {
  if (Trigger.isAfter && Trigger.isUpdate) {
    OrderTriggerHandler.createPaymentSchedules(Trigger.new, Trigger.oldMap);
  }
}
