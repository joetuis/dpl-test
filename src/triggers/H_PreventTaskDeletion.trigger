/**
*      @author       : Shilpa Menghani(Deloitte)
*      @date         : 11/13/2015
       @description  : Trigger to prevent call records from deletion
       Modification Log:
        ------------------------------------------------------------------------------------------
            Developer               User story            Date                Description
        ------------------------------------------------------------------------------------------
          Shilpa Menghani                                11/13/2015         Trigger to prevent call records from deletion
*/
trigger H_PreventTaskDeletion on Task (before delete) {
    
    //Get current user profile name
    string userProfile ='';
    list<profile>lstUserProfile = [select id,name from profile where id =: userInfo.getProfileId()];
    if(!lstUserProfile.isEmpty()){
        userProfile = lstUserProfile[0].name;
    }
   // If not API user
    if(userProfile != null && userProfile != '' && (!userProfile.startsWithIgnoreCase('API -'))){
        for(Task t: Trigger.old){
          if(t.WhatId != null && t.WhatId.getSObjectType() == Case.getSobjectType()){
                  t.addError(System.label.DisableTaskDeletion);
          }
             
        }
    }
}