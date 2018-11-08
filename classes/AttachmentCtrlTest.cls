@isTest

private class AttachmentCtrlTest {
    @isTest static void testUpload() {
        Contact contact = new Contact(FirstName = 'James', LastName = 'Born');
        insert contact;
        Attachment att = new Attachment();
        att.Name = 'Test Attachment';
        Blob bodyBlob = Blob.valueOf('Test Attachment Body');
        att.Body = bodyBlob;
        att.ParentId = contact.Id;

        Test.startTest();
        AttachmentCtrl ctrl = new AttachmentCtrl();
        ctrl.body = bodyBlob;
        ctrl.fileSize = 1000;
        ctrl.contentType = 'jpg';
        ctrl.fileName = 'Test Attachment1';
        ctrl.upload();

        Test.stopTest();

        Test.startTest();

        List <ApexPages.Message> msg = ApexPages.getMessages();
        Boolean a = false;
        AttachmentCtrl ctrl1 = new AttachmentCtrl();
        ctrl1.body = bodyBlob;
        ctrl1.fileSize = 10000;
        ctrl1.contentType = 'jpg';
        ctrl1.fileName = null;
        ctrl1.upload();

        for (ApexPages.Message message : msg) {
            if (ctrl1.fileName == null) {
                if (message.getDetail().contains('Please select a file to Contact'))
                    a = true;
                System.assertEquals(a, ApexPages.hasMessages());
            }
        }

        Test.stopTest();

        Test.startTest();
        List <ApexPages.Message> msg1 = ApexPages.getMessages();
        Boolean b = false;
        AttachmentCtrl ctrl2 = new AttachmentCtrl();
        ctrl2.body = bodyBlob;
        ctrl2.fileSize = 1000000000;
        ctrl2.contentType = 'jpg';
        ctrl2.fileName = 'Test Attachment2';
        ctrl2.upload();

        for (ApexPages.Message message : msg1) {
            if (ctrl2.fileSize > ctrl2.MAX_FILE_SIZE) {
                if (message.getDetail().contains('File size must not be bigger than 1 Mb'))
                    b = true;
                System.assertEquals(b, ApexPages.hasMessages());
            }
        }

        Test.stopTest();

        Test.startTest();
        Contact con = new Contact(FirstName = 'James', LastName = 'Born');
        List <ApexPages.Message> msg2 = ApexPages.getMessages();
        Boolean c = false;
        AttachmentCtrl ctrl3 = new AttachmentCtrl();
        ctrl3.body = bodyBlob;
        ctrl3.fileSize = 1000;
        ctrl3.contentType = 'jpg';
        ctrl3.fileName = 'Test Attachment3';
        ctrl3.recordId = con.Id;
        ctrl3.upload();

        for (ApexPages.Message message : msg2) {
            if (String.isNotBlank(ctrl3.recordId)) {
                if (message.getDetail().contains('File was added'))
                    c = true;
                System.assertEquals(c, ApexPages.hasMessages());
            }
        }

        Test.stopTest();
    }
}