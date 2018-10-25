@isTest
private class AccountHandlerTest {

<<<<<<< HEAD
    @isTest static void testIfVATIsNull() {
=======
    @isTest static void testIfVATIsNull () {
>>>>>>> feat/new_task
        Account acc = new Account();
        acc.Name    = 'Sony';
        acc.VAT__c  = NULL;
        insert acc;    
    }

<<<<<<< HEAD
    @isTest static void testVATFirstTwoSymbols() {
=======
    @isTest static void testVATFirstTwoSymbols () {
>>>>>>> feat/new_task
        Account acc = new Account();
        acc.Name    = 'LG';
        acc.VAT__c  = 'qq34567891';
        insert acc;    
    }

<<<<<<< HEAD
    @isTest static void testVATLastEightSymbols() {
=======
    @isTest static void testVATLastEightSymbols () {
>>>>>>> feat/new_task
        Account acc = new Account();
        acc.Name    = 'Samsung';
        acc.VAT__c  = 'WWW2345678';
        insert acc;    
    }
}