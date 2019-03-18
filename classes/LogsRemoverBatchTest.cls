@isTest
private class LogsRemoverBatchTest {

   @TestSetup
    private static void setupTestData() {
        List<Log__c> testLogs = new List<Log__c>();
        for (Integer i = 0; i < 200; i++) {
            testLogs.add(new Log__c(Company_Name__c = 'Error log ' + i, Error_Message__c = 'Error', Summary__c = 'LOGIN', Type__c = (i == 199) ? 'SUCCESS' : 'ERROR'));
        }
        insert testLogs;
    }

    @isTest
    private static void testLogsRemoverBatch() {
        Test.startTest();
        Database.executeBatch(new LogsRemoverBatch(), 200);
        Test.stopTest();

        System.assertEquals(1, Database.countQuery('SELECT COUNT() FROM Log__c'));
    }
}