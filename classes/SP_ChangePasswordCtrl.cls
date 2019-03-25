public with sharing class SP_ChangePasswordCtrl {
    public String oldPassword     { get; set; }
    public String newPassword     { get; set; }
    public String confirmPassword { get; set; }

    public SP_ChangePasswordCtrl() {
    }

    public PageReference changePassword() {
        if (!validateInputs()) {
            return null;
        }
        List<User> currentUser = [SELECT Id, Username, FirstName, LastName, Email FROM User WHERE Id = :UserInfo.getUserId()];
        try {
            Site.validatePassword(currentUser[0], this.newPassword, this.confirmPassword);
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
            return null;
        }
        return Site.changePassword(newPassword, confirmPassword, oldPassword);
    }

    private Boolean validateInputs() {
        if (String.isBlank(this.oldPassword) && !Site.isPasswordExpired()) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please enter old password'));
            return false;
        }
        if (String.isBlank(this.newPassword)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please enter new password'));
            return false;
        }
        if (String.isBlank(this.confirmPassword)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please confirm new password'));
            return false;
        }
        if (this.newPassword != this.confirmPassword) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'New password does not match confirm'));
            return false;
        }
        return true;
    }

}