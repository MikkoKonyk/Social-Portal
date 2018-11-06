/**
 * Created by ADemchuk on 06.11.2018.
 */

public with sharing class AttachmentCtrl {
    public Attachment att { get; set; }
    public String recordId { get; set; }

    public PageReference upload() {
        if (String.isBlank(att.Name)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please select a file to Contact'));
            return null;
        }
        if (att.BodyLength > 1024) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'File size must not be bigger than 1 Mb'));
            return null;
        }
        att.ParentId = recordId;
        insert att;
        return null;
    }
}