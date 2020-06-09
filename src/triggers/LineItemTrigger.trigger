trigger LineItemTrigger on Line_Item__c (after delete, after insert, after undelete, 
after update, before delete, before insert, before update) {
	
	// on new records
	if (Trigger.isAfter && Trigger.isInsert) {
    	LineItemTriggerHandler.handle2(Trigger.new);
	}
	
	// on updated records
	if (Trigger.isAfter && Trigger.isUpdate) {
    	LineItemTriggerHandler.handle2(Trigger.new);
	}
	
	// on deleted records
	if (Trigger.isAfter && Trigger.isDelete) {
    	LineItemTriggerHandler.handle2(Trigger.old);
	}
	
	// on restored records
	if (Trigger.isAfter && Trigger.isUnDelete) {
    	LineItemTriggerHandler.handle2(Trigger.new);
	}	

}