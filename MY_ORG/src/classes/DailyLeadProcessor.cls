global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id,LeadSource
            FROM Lead 
            WHERE LeadSource = ''];
        // Create a task for each opportunity in the list
        for(Lead l : leads){
            l.LeadSource = 'Dreamforce';
        }
        update leads;
    }
    
}