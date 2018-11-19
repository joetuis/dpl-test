/**
*      @author       : Merisha Shim (Deloitte)
*      @date         : 03/04/2016
*      @description  : Trigger to insert sharing rules on the claim to the users within the same 
*             			account of the owner.
*       Modification Log:
*       ------------------------------------------------------------------------------------------
*            Developer               User story            Date                Description
*       ------------------------------------------------------------------------------------------
*          Merisha (Deloitte)                           03/04/2016             Original Version
*/
trigger H_ClaimTrigger on Claim__c (after insert) {
	if(trigger.isInsert && trigger.isAfter) {
		H_ClaimHelper.addClaimSharingRuleToAllContactsOnAccount(trigger.newMap);
	}
}