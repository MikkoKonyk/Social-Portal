/**
 * Created by ADemchuk on 31.10.2018.
 */

public class ContactCtrlExt {
    private ApexPages.StandardController stdCtrl;
    private Contact contact;

    public ContactCtrlExt(ApexPages.StandardController stdCtrl) {
        contact = (Contact) stdCtrl.getRecord();
        this.stdCtrl = stdCtrl;
    }

    public PageReference save() {
        return stdCtrl.save();
    }

    public PageReference cancel() {
        if (contact.Id != null) {
            return new PageReference('/' + contact.Id);
        }
        if (contact.Id == null) {
            PageReference pageRef = new PageReference('/003/o');
            pageRef.setRedirect(true);
            return pageRef;
        }
        return null;
    }
}