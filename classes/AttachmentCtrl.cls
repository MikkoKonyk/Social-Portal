/**
 * Created by ADemchuk on 06.11.2018.
 */

public with sharing class AttachmentCtrl {
    public String recordId { get; set; }
    public transient Blob body { get; set; }
    public Integer fileSize { get; set; }
    public String fileName { get; set; }
    public String contentType { get; set; }

    public PageReference upload() {
        System.debug(fileSize);
        if (String.isBlank(fileName)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please select a file to Contact'));
            return null;
        }
        if (fileSize > 1024) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'File size must not be bigger than 1 Mb'));
            return null;
        }
        Attachment att = new Attachment(Name = fileName, Body = this.body, ParentId = this.recordId, ContentType = this.contentType);
        insert att;
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'File was added'));
        return null;
    }
}