@IsTest
public class AccountProcessorTest {
	 @IsTest
  	private static void testAccountProcessor() {
        List<Id> ids = new List<Id> ();
        Account acc = new Account();
        acc.Name = 'test';
       Contact cont = new Contact();
        cont.FirstName = 'test';
        cont.LastName = 'Test';
        insert acc;
        cont.AccountId = acc.Id;
        insert cont;
        ids.add(acc.Id);
        Test.startTest();
        AccountProcessor.countContacts(ids);
        Test.stopTest();
    }
}