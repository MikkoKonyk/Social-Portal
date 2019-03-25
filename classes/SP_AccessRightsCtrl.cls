public with sharing class SP_AccessRightsCtrl {

    public Boolean displayPopup { get; set; }
	public String popup			{ get; set; }
    public String content {
        get {
            if (String.isBlank(this.content)) {
                this.content = SELECT Body FROM StaticResource WHERE Name =: 'Terms';
				return content; 
            } else {
				return [SELECT Body FROM StaticResource WHERE Name =: (this.popup == 'policy') ? 'Policy' : 'Terms'].Body.toString();
        }
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