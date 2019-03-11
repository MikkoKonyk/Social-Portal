public with sharing class SP_AccessRightsCtrl {

    public boolean displayPopup { get; set; }
    public String test { get; set; }
	public String popup { get {
		if (String.isBlank(this.popup)) {
		this.popup = [SELECT Body FROM StaticResource WHERE Name =: (this.test == 'terms') ? 'Terms' : 'Policy'].Body.toString();
	}
        return this.popup;
	}
	set; }
	
    public void closePopup() {
        displayPopup = false;
    }

    public void showPopup() {
        displayPopup = true;
    }
}