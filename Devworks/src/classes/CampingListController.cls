public class CampingListController {
	@AuraEnabled
    public static List<Camping_Item__c> getItems()
    {
        List<Camping_Item__c> cmpitmlst = [SELECT NAME,PRICE__C, QUANTITY__C,PACKED__C FROM CAMPING_ITEM__C LIMIT 10];
        return cmpitmlst;
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c campingitem)
    {
        upsert campingitem;
        return campingitem;
    }
}