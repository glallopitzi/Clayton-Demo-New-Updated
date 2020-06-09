public with sharing class LineItemTriggerHandler {
		
	

	public static void handle(List<Line_Item__c> items) {
		
		// collect related orders
		Set<Id> orderIds = new Set<Id>();
		for (Line_Item__c i : items) {
			orderIds.add(i.Order__c);
		}

		String p = 'yeah';		
		
		List<Order__c> orders1 = [SELECT Product_Category_2__c,Product_Category_Units_2__c FROM Order__c];

		List<Order__c> orders2 = [SELECT Purchased__c,Product_Category_1__c,Product_Category_2__c,Product_Category_Units_2__c FROM Order__c];

		// load required data: 1) related orders 2) force reload all line items for those orders
		List<Order__c> orders = [SELECT Purchased__c,Product_Category_1__c,Product_Category_Units_1__c,Product_Category_2__c,Product_Category_Units_2__c FROM Order__c WHERE Id in :orderIds];
		List<Line_Item__c> lineItems = [SELECT Order__c, Amount__c, Lot__r.Product_Category__c, Units__c FROM Line_Item__c WHERE Order__c in :orderIds];
		
		// execute business logic & persist
		updatePurchasedAmount(orders, lineItems);
		updateCategories(orders, lineItems);

		try {
			upsert orders;
		} catch(exception e){
		
		}


		try {
			update orders;
		} catch(exception e){
		
		}
		
	}


	global public void globalEmptyMethod(){
		String p = 'yeah';

	}

	
	
}
