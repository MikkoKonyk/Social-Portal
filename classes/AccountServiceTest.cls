@isTest
private class AccountServiceTest {
    @isTest static void testIfVATIsNull () {
        Account acc = new Account();
        acc.Name = 'Sony'; 
        acc.VAT__c = NULL;
        insert acc;    
    }
    @isTest static void testVATFirstTwoSymbols () {
        Account acc = new Account();
        acc.Name = 'LG'; 
        acc.VAT__c = 'qq34567891';
        insert acc;    
    }
    @isTest static void testVATLastEightSymbols () {
        Account acc = new Account();
        acc.Name = 'Samsung'; 
        acc.VAT__c = 'WWW2345678';
        insert acc;    
    }
}