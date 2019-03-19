public with sharing class EmployeesController {

    @AuraEnabled
    public static List<Account> getAccountsBySearchTerm(String term) {
        String searchTerm = '%' + String.escapeSingleQuotes(term) + '%';
        return [SELECT Id, Name FROM Account WHERE Name LIKE :searchTerm];
    }

}