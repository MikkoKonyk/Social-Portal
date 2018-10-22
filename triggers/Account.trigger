trigger Account on Account (before insert, before update) {
    for (Account acc : Trigger.new) {
        if (String.isBlank(acc.VAT__c)) {
            acc.addError(Label.VAT_Required);
        }
        if (acc.VAT__c.length() != 10 || !acc.VAT__c.left(2).isAllUpperCase() || acc.VAT__c.left(2).isNumeric()) {
            acc.addError(Label.VAT_Required1);
        }
        if (String.isNotBlank(acc.VAT__c) && !acc.VAT__c.rightPad(8).isNumeric()) {
            acc.addError(Label.VAT_Required2);
        }
    }
}