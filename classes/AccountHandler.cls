/**
 * Created by ADemchuk on 22.10.2018.
 */
public with sharing class AccountHandler {

    public static void handleTrigger(List<Account> accounts, System.TriggerOperation triggerOperation) {
        switch on triggerOperation {
            when BEFORE_INSERT, BEFORE_UPDATE {
                validateVAT(accounts);
                System.debug('accounts1>>>' + accounts);
            }
            when else {

            }
        }
    }
    public static void validateVAT(List<Account> accounts) {
        for (Account acc : accounts) {
            if (String.isBlank(acc.VAT__c)) {
                acc.addError(Label.VAT_Required);
            }
            if (acc.VAT__c.length() != 10 || !acc.VAT__c.left(2).isAllUpperCase() || acc.VAT__c.left(2).isNumeric()) {
                acc.addError(Label.VAT_Required1);
            }
            if (String.isNotBlank(acc.VAT__c) && !acc.VAT__c.right(8).isNumeric()) {
                acc.addError(Label.VAT_Required2);
            }
        }
    }
}