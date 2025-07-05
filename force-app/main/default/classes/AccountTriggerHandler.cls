/**
 * @description       : 
 * @author            : Hyowon Hong
 * @last modified on  : 07-03-2025
 * @last modified by  : Hyowon Hong
**/
public with sharing class AccountTriggerHandler extends TriggerHandler {
    /** 
     * 현재 핸들러 이름 반환 
     * isFirstRun() 및 바이패스 기능(bypass, clearBypass)이 각 핸들러를 고유하게 식별하기 위해 필요
    **/
    protected override String getHandlerName() {
        return 'AccountTriggerHandler';
    }

    protected override void beforeInsert(List<SObject> news) {
        System.debug('Account Trigger Before Insert Start');

        for (Account acc : (List<Account>) news) {
            
        }

        System.debug('Account Trigger Before Insert Finish');
    }

    protected override void afterInsert(List<SObject> news, Map<Id, SObject> newMap) {
        System.debug('Account Trigger After Insert Start');

        for (Account acc : (List<Account>) news) {
            
        }

        System.debug('Account Trigger After Insert Finish');
    }

    protected override void beforeUpdate(List<SObject> news, List<SObject> olds, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {
        System.debug('Account Trigger Before Update Start');

        for (Account acc : (List<Account>) news) {
            Account oldAcc = (Account) oldMap.get(acc.Id);
   
        }

        System.debug('Account Trigger Before Update Finish');
    }

    protected override void afterUpdate(List<SObject> news, List<SObject> olds, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {
        System.debug('Account Trigger After Update Start');

        for (Account acc : (List<Account>) news) {
            Account oldAcc = (Account)oldMap.get(acc.Id);
            
        }

        System.debug('Account Trigger After Update Finish');
    }
}