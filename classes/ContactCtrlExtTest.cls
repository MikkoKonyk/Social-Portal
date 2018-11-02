@isTest
private class ContactCtrlExtTest {

    @isTest static void testSaveCancelButton() {
        Contact contact = new Contact (FirstName = 'Tom', LastName = 'Smith');
        ContactCtrlExt controller = new ContactCtrlExt(new ApexPages.StandardController(contact));
        controller.save();
        controller.cancel();
    }

}