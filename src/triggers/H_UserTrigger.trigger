/**
*      @author       : Shilpa Menghani(Deloitte)
*      @date         : 11/04/2015
       @description  : Trigger to populates the Federation Id 
        Modification Log:
        ------------------------------------------------------------------------------------------
            Developer               User story            Date                Description
        ------------------------------------------------------------------------------------------
           Shilpa (Deloitte)                           11/04/2015           Original Version
*/
trigger H_UserTrigger on User (before insert,before update) {
  if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        H_UserTriggerHelper.populateFederationId(trigger.new,trigger.oldMap);
    }
}