@isTest
private class AttachmentCtrlTest {

    @TestSetup
    static void setupData() {
        insert new Contact(FirstName = 'James', LastName = 'Born');
    }

    @isTest
    static void uploadSuccess() {
        List<Contact> cons = [SELECT Id FROM Contact WHERE FirstName = 'James'];

        AttachmentCtrl ctrl = new AttachmentCtrl();
        Boolean isFileSaved = false;

        Test.startTest();
        ctrl.body        = Blob.valueOf('Test');
        ctrl.fileSize    = 1000;
        ctrl.contentType = 'jpg';
        ctrl.fileName    = 'Test1';
        ctrl.recordId    = cons[0].Id;
        ctrl.upload();
        Test.stopTest();
        for (ApexPages.Message m : ApexPages.getMessages()) {
            if (m.getDetail().contains('File was added')) {
                isFileSaved = true;
            }
        }
        System.assertEquals(true, isFileSaved);
        System.assertNotEquals(null, [SELECT COUNT(Id) FROM Attachment WHERE ParentId = :cons[0].Id].size());
    }

    @isTest
    static void fileNameEmpty() {
        List<Contact> cons = [SELECT Id FROM Contact WHERE FirstName = 'James'];

        AttachmentCtrl ctrl = new AttachmentCtrl();
        Boolean isEmptyName = false;
        Test.startTest();
        ctrl.body        = Blob.valueOf('Test');
        ctrl.fileSize    = 1000;
        ctrl.contentType = 'jpg';
        ctrl.recordId    = cons[0].Id;
        ctrl.fileName    = null;
        ctrl.upload();
        Test.stopTest();
        for (ApexPages.Message m : ApexPages.getMessages()) {
            if (m.getDetail().contains('Please select a file to Contact')) {
                isEmptyName = true;
            }
        }
        System.assert(isEmptyName);
    }

    @isTest
    static void wrongFileSize() {
        List<Contact> cons = [SELECT Id FROM Contact WHERE FirstName = 'James'];

        AttachmentCtrl ctrl = new AttachmentCtrl();
        Boolean isWrongSize = false;
        Test.startTest();
        ctrl.body        = Blob.valueOf('Test');
        ctrl.fileSize    = 1000000;
        ctrl.contentType = 'jpg';
        ctrl.fileName    = 'Test';
        ctrl.recordId    = cons[0].Id;
        ctrl.upload();
        Test.stopTest();
        for (ApexPages.Message m : ApexPages.getMessages()) {
            if (m.getDetail().contains('File size must not be bigger than 1 Mb')) {
                isWrongSize = true;
            }
        }
        System.assert(isWrongSize);
    }

    @isTest
    static void errorOnSave() {
        Boolean isError = false;

        AttachmentCtrl ctrl = new AttachmentCtrl();
        ctrl.body           = Blob.valueOf('Test');
        ctrl.fileSize       = 1000;
        ctrl.contentType    = 'jpg';
        ctrl.fileName       = 'Test1';
        ctrl.upload();

        for (ApexPages.Message m : ApexPages.getMessages()) {
            if (!String.isEmpty(m.getDetail())) {
                isError = true;
            }
        }
        System.assertEquals(true, isError);
    }
}