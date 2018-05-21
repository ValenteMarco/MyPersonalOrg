public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds){
        List<Account> accounts = new List<Account>([Select Id,Number_of_Contacts__c,
                                                    (Select ID From Contacts Where AccountId in : accountIds) 
                                                    from Account Where Id in : accountIds]);
        for(Account a : accounts){
            Integer count= 0;
            if(a.contacts != null){
				count = a.contacts.size();                
            }
            a.Number_of_Contacts__c = count;
        } 
        update accounts;
      
    }
}