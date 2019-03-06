public with sharing class SP_AccessRightsCtrl {

    public boolean displayPopup { get; set; }
    public String termsInfo;

    public void closePopup() {
        displayPopup = false;
    }

    public void showPopup() {
        displayPopup = true;
    }

    public String getTermsInfo() {
        if (String.isBlank(this.termsInfo)) {
            StaticResource sr = [select Body from StaticResource where Name = 'TermsTextStaticResource'];
            this.termsInfo = EncodingUtil.base64Encode(sr.Body);
            System.debug('resource ' + termsInfo);
        }
        return this.termsInfo;
    }
}