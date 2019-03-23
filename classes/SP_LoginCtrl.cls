public with sharing class SP_LoginCtrl {
    public String email    { get; set; }
    public String password { get; set; }
    private static final String EMAIL_PATTERN = '([a-zA-Z0-9_\\-\\.]+)@((\\[a-z]{1,3}\\.[a-z]{1,3}\\.[a-z]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})';

    public SP_LoginCtrl() {
    }

    public PageReference login() {
//        if (!Pattern.matches(EMAIL_PATTERN, this.email)) {
//            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, String.format('Email is not valid. Please use correct format: {0}'
//                                                                                    , new String[] { 'example@example.com' })));
//            return null;
//        }
        List<User> users = [SELECT Id FROM User WHERE Email = :this.email];
        if (users.isEmpty()) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, String.format('There is no active user in the system with email: {0}'
                                                                                    , new String[] { this.email })));
            return null;
        }
        PageReference toHomePage = Site.login(email, password, null);
        if (null == toHomePage) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Cannot log you in.'));
            return null;
        } 
        return toHomePage;
    }
}