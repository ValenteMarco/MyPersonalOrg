@istest
public class DailyLeadProcessorTest {

     public static String CRON_EXP = '0 0 0 15 3 ? 2022';
     @IsTest
  	private static void testDailyLeadProcessor() {
        List<Lead> leads = new List<Lead>();
        for (Integer i=0; i<200; i++) {
            Lead l = new Lead(
                FirstName = 'test',
                lastName = 'test',
                Company = 'test'
            );
            leads.add(l);
        }
        insert leads;
        Test.startTest();
        	DailyLeadProcessor m = new DailyLeadProcessor();
            String jobId = System.schedule('DailyLeadProcessor',CRON_EXP, m);	
                List<Lead> lt2 = [SELECT Id 
            FROM Lead 
            WHERE LeadSource != ''];
        System.assertEquals(0, lt2.size(), 'Lead exist before job has run');
         Test.stopTest();
        	List<Lead> lt =  new List<Lead>([SELECT Id 
            FROM Lead 
            WHERE LeadSource != '']);
                               
            System.assertEquals(leads.size(), 
            lt.size(), 
            'Lead were not created');
       
    }
}