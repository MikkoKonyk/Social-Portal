trigger Account on Account (before insert, before update) {
    for (Account acc : Trigger.new) {
        if (String.isBlank(acc.VAT__c) || acc.VAT__c.length() != 10 || !acc.VAT__c.left(2).isAllUpperCase() || acc.VAT__c.left(2).isNumeric()) {
            acc.addError('VAT is incorrect, right pattern: XX000000000. 2 first symbols must be capitals (ISO-2 code of EU country of your company).');
            if (String.isBlank(acc.VAT__c)) {
                acc.addError('VAT is required');

            }
        }
    }
}
