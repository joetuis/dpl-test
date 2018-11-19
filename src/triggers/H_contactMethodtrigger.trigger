/**
*      @author       : Piyush Rathor(Deloitte)
*      @date         : 01/10/2015
       @description  : Trigger to update Primary Address to Contact
        Modification Log:
        ------------------------------------------------------------------------------------------
            Developer               User story            Date                Description
        ------------------------------------------------------------------------------------------
          Piyush Rathor                                   01/10/2015         Trigger to update Primary Email to Contact
          Piyush Rathor                                   18/12/2015         Trigger to update name on contact method
*/   
trigger H_contactMethodtrigger on ContactMethod__c(before insert,before update,after insert, after update,after delete){
  if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
         H_contactMethodtriggerHelper.updateContactMethodInvalidEmail(trigger.new);
         //H_contactMethodtriggerHelper.UpdateName(trigger.new,trigger.oldmap);
  }
  if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate)){
        H_contactMethodtriggerHelper.updatePrimaryInfo(trigger.new,trigger.oldmap);
        
  }
  if(trigger.isAfter && trigger.isDelete){
      H_contactMethodtriggerHelper.clearPrimaryDetails(trigger.oldmap);
  }
}