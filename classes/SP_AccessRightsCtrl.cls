public with sharing class SP_AccessRightsCtrl {

    public Boolean displayPopup { get; set; }
	public String popup			{ get; set; }
    public String content		{
        get {
			return [SELECT Body FROM StaticResource WHERE Name =: (this.popup == 'terms') ? 'terms' : 'policy'].Body.toString();
		}
        set;
    }

    public void closePopup() {
        displayPopup = false;
    }

    public void showPopup() {
        displayPopup = true;
    }
}