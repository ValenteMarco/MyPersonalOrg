public class AddPrimaryContact implements Queueable { 
   private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }
    public void execute(QueueableContext context) {
        Set<Id> accIds = new  Set<Id>();
          accIds.add(contact.AccountId);
        List<Account> accounts = new List<Account>();
        accounts = [Select Id From Account Where BillingState  =: state];
        List<Contact> contUpdates = new List<Contact> ();
        for(Account a: accounts){
            Contact c = new Contact();
            c = contact.clone(false,false,false,false);
            c.AccountId = a.Id;
            contUpdates.add(c);
        }
        insert contUpdates;
    }
}