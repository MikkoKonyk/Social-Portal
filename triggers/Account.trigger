trigger Account on Account (before insert, before update) {
    for (Account acc : Trigger.new) {
        if(String.isBlank(acc.VAT__c) || acc.VAT__c.length() != 10 || !acc.VAT__c.left(2).isAllUpperCase()) {
            acc.addError('Your VAT type is incorrect!');
            if(String.isBlank(acc.VAT__c)) {
            acc.addError('Obligatory field! VAT is incorrect, right pattern: XX000000000');
            }
        }

    }
}