@IsTest
public class LeadProcessorTest {
	 @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
    
        for (Integer i=0;i<10;i++) {
         leads.add(new lead(firstname='first', 
                lastname='last',company='Company'));   
        }
        insert leads;
    }
    static testmethod void test() {        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca, 200);
        Test.stopTest();
    }
}