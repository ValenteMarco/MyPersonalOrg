public with sharing class NewCaseListController {
    public   List<Case> getNewCases(){
    	return [Select Id,CaseNumber From Case where status = 'New'];
    }
}