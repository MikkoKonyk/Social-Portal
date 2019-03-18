public with sharing class SP_ChangePasswordCtrl {
        public String oldPassword {get; set;}
        public String newPassword {get; set;}
        public String confirmPassword {get; set;}

        public PageReference changePassword() {
                if (oldPassword == null) {
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'You did not add old password!'));
                        return null;
                } else {
                        return Site.changePassword(newPassword, confirmPassword, oldPassword);
                }
        }

        public SP_ChangePasswordCtrl() {
        }
}