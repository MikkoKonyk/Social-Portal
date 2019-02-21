global with sharing class SP_LoginCtrl {
    global String email { get; set; }
    global String password { get; set; }

    global PageReference login() {
        String startUrl  = System.currentPageReference().getParameters().get('startURL');
        PageReference toHomePage = Site.login(email, password, startUrl);
        if (null == toHomePage) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'You added incorrect data!'));
            return null;
        }
        return toHomePage;
    }

    global SP_LoginCtrl() {
    }
}