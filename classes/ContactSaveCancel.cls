/**
 * Created by ADemchuk on 31.10.2018.
 */

public with sharing class ContactSaveCancel {
    public static void cancel() {
        return ;
    }
    public static void save() {
        Contact contact = new Contact();
        insert contact;
    }
}