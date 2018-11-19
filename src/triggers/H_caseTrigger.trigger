/**
*      @author       : Piyush Rathor(Deloitte)
*      @date         : 10/09/2015
       @description  : Update related account when related contact is updated on case
        Modification Log:
        ------------------------------------------------------------------------------------------
            Developer               User story            Date                Description
        ------------------------------------------------------------------------------------------
           Piyush (Deloitte)                           09/09/2015           Original Version
           Piyush (Deloitte)                           09/11/2015           Latest expected close date Changes
*/
trigger H_caseTrigger on Case (before insert,before update) {
    if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        H_caseTriggerHelper.updateRelatedAccount(trigger.new,trigger.oldmap);
        H_caseTriggerHelper.populateVin(trigger.new,trigger.oldmap);
        H_caseTriggerHelper.updateLatestDate(trigger.new,trigger.oldmap);
    }
}