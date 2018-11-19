/**
*      @author       : Merisha Shim (Deloitte)
*      @date         : 3/1/2016
*      @description  : Trigger to insert an entitlement record to the VIN based on the ACM Entitlement Settings
*       				   custom settings. 
*       Modification Log:
*       ------------------------------------------------------------------------------------------
*            Developer               User story            Date                Description
*       ------------------------------------------------------------------------------------------
*          Merisha (Deloitte)                           2/29/2016             Original Version
*/
trigger H_VINTrigger on VIN__c (after insert) {
	if(trigger.isAfter && trigger.isInsert) {
		
		H_VINTriggerHelper.insertACMENtitlementBasedOnCustomSettings(trigger.new);
		
	}
}