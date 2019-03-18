public with sharing class AttachmentCtrl {

    public final Integer MAX_FILE_SIZE = 100000;

    public String recordId     { get; set; }
    public transient Blob body { get; set; }
    public Integer fileSize    { get; set; }
    public String fileName     { get; set; }
    public String contentType  { get; set; }

    public PageReference upload() {
        if (String.isBlank(fileName)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please select a file to Contact'));
            return null;
        }
        if (fileSize > MAX_FILE_SIZE) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'File size must not be bigger than 1 Mb'));
            return null;
        }
        Savepoint sp = Database.setSavepoint();
        try {
            insert new Attachment(Name = fileName, Body = this.body, ParentId = this.recordId, ContentType = this.contentType);
        } catch(Exception e) {
            Database.rollback(sp);
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, e.getMessage()));
            return null;
        }
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'File was added'));
        return null;
    }
}