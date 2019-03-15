global class LogsRemoverBatch implements Database.Batchable<sObject> {
	
	private List<Log__c> listRecords;

    public LogsRemoverBatch() {}
 
    global Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator('SELECT Id FROM Log__c');
    }

    global void execute(Database.BatchableContext context, List<Log__c> scope) {
        List<Log__c> logsToDelete = new List<Log__c>();
            for (Log__c log : scope) {
                if (log.Type__c=='ERROR' && log.User__c==NULL) {
                    logsToDelete.add(log);
            }
        }
		listRecords = logsToDelete;
		Database.DeleteResult[] drList =  Database.delete(logsToDelete, false);     
    }
    
    global void finish(Database.BatchableContext context) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'demalviv@gmail.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject('LogsRemoverBatch results');
		mail.setHtmlBody(createBody(listRecords));
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }

	private static String createBody(final List<Log__c> logsToDelete) {
        String body = '<html>';
        body += '<head>';
        body += '<style>';
        body += 'table {font-family: arial, sans-serif;border-collapse: collapse;width: 100%;}';
        body += 'td, th {border: 1px solid #dddddd;text-align: left;padding: 8px;}';
        body += 'tr:nth-child(even) {background-color: #dddddd;}';
        body += '</style>';
        body += '</head>';

        body += '<body>';
        body += '<p>The following ' + logsToDelete.size() + ' records are deleted from your Log:</p></br>';
        body += '<h2>Logs</h2>';
        body += '<table><tr>';
        body += '<th>' + 'Log Name' + '</th>';
        body += '<th>' + 'Company Name' + '</th>';
        body += '<th>' + 'ContactID' + '</th>';
        body += '<th>' + 'Email' + '</th>';
        body += '<th>' + 'Error Message' + '</th>';
		body += '<th>' + 'Status Code' + '</th>';
		body += '<th>' + 'Summary' + '</th>';
		body += '<th>' + 'Type' + '</th>';
		body += '<th>' + 'User' + '</th>';
        body += '</tr>';

        for (Log__c log : logsToDelete) {
            body += '<tr>';
            body += '<td>' + log.Name + '</td>';
            body += '<td>' + log.Company_Name__c + '</td>';
            body += '<td>' + log.ContactID__c + '</td>';
            body += '<td>' + log.Email__c + '</td>';
            body += '<td>' + log.Error_Message__c + '</td>';
			body += '<td>' + log.Status_Code__c + '</td>';
			body += '<td>' + log.Summary__c + '</td>';
			body += '<td>' + log.Type__c + '</td>';
			body += '<td>' + log.User__c + '</td>';
            body += '</tr>';
        }
        body += '</table>';
        body += '</body>';
        body += '</html>';

        return body;
    }
}