@IsTest
public class AddPrimaryContactTest {
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        // add a parent account
        accounts.add(new Account(name='Parent'));
        // add 100 child accounts
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i,BillingState ='NY'
            ));
        }
                for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i,BillingState ='CA'
            ));
        }
        insert accounts;
        Contact c = new Contact();
        c.AccountId = accounts[0].Id;
        c.FirstName = 'test';
        c.LastName = 'test';
        insert c;
    }
    
	 @IsTest
  	private static void testAddPrimaryContact() {
        List<Account> accounts = new List<Account>([select id, name from account where name like 'Test Account%']);
        Contact c = new Contact();
        c = [Select Id,AccountId,LastName,FirstName From Contact LIMIT 1];
        List<Id> ids = new List<Id>();
        for(Account a: accounts){ 
            ids.add(a.Id);
        }
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(c, 'NY');
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(updater);
        Test.stopTest();        
    }
}