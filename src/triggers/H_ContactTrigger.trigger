/**
*      @author       : Piyush Rathor(Deloitte)
*      @date         : 20/12/2015
       @description  : Trigger to update name on contact method and address
        Modification Log:
        ------------------------------------------------------------------------------------------
            Developer               User story            Date                Description
        ------------------------------------------------------------------------------------------
          Piyush Rathor                                   20/12/2015         Trigger to update name on contact method and address
          Piyush Rathor                                   05/01/2016         Trigger to update Postal code to custom postal code field
*/  
trigger H_ContactTrigger on Contact (after update,before insert,before update) {
    if(trigger.isBefore && (trigger.isUpdate || trigger.isInsert)){
        H_contactTriggerHelper.postalCodeUpdate(trigger.new);
    }
}