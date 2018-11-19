/**
*      @author       : Piyush Rathor(Deloitte)
*      @date         : 30/09/2015
       @description  : Trigger to update customer role fields from Vin
       Modification Log:
        ------------------------------------------------------------------------------------------
            Developer               User story            Date                Description
        ------------------------------------------------------------------------------------------
          Piyush Rathor                                   30/09/2015         Trigger to update customer role fields from Vin
          Piyush Rathor                                   10/01/2016         Trigger to prevent insertion/updation of customer role
                                                                             if active HFS customer role is present
*/  
trigger H_customerRoleTrigger on Customer_Role__c(before insert, before update){
    if(trigger.isUpdate || trigger.isInsert){
        if(trigger.isBefore){
            H_customerRoleTriggerHelper.updateFieldValue(trigger.new,trigger.oldMap);
            H_customerRoleTriggerHelper.addHFSError(trigger.new,trigger.oldMap);
            set<string>setCustRoleId = H_customerRoleTriggerHelper.checkCassError(trigger.new);
            if(!setCustRoleId.isEmpty()){
                for(Customer_Role__c custRole : trigger.new){
                    if(setCustRoleId.contains(custRole.Id) && !UserInfo.getLastName().startswith('API -')){
                        if(!test.isRunningTest())
                            custRole.addError(System.label.Vehicle_Ownership_Error_Message);
                    }
                }
            }
        }
    }
    
}