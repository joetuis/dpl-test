/**
*      @author       : Piyush Rathor(Deloitte)
*      @date         : 01/10/2015
       @description  : Trigger to update Primary Address to Contact
        Modification Log:
        ------------------------------------------------------------------------------------------
            Developer               User story            Date                Description
        ------------------------------------------------------------------------------------------
          Piyush Rathor                                   01/10/2015         Trigger to update Primary Address to Contact
          Piyush Rathor                                   27/10/2015         Trigger to check multiple Primary Address and Deletion changes
          Piyush Rathor                                   18/12/2015         Trigger to update firstname and lastname on address
*/          
trigger H_addresstrigger on Address__c(before update,before insert,after insert, after update,after delete){
  if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate)){
        H_addresstriggerHelper.updatePrimaryAddress(trigger.new,trigger.oldmap);
  }
  if(trigger.isAfter && trigger.isDelete){
      H_addresstriggerHelper.clearPrimaryAddress(trigger.oldmap);
  }
  /*
  if(trigger.isBefore && (trigger.isUpdate || trigger.isInsert)){
      H_addresstriggerHelper.UpdateName(trigger.new,trigger.oldmap); 
  }*/
}