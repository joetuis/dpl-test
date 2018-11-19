/**
 * Author: Marcus Ericsson - mericsson@salesforce.com
 */
trigger DisableFeedCommentDeletes on FeedComment (before delete) 
{
    if (!DisableChatterDeleteDelegate.allowDelete()) {
        for(FeedComment f : Trigger.old){
            f.addError(System.label.DisableFeedCommentDeletes); 
        }
    }
}