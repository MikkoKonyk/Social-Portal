public class UserCtrlPhoto  {
	
	public string userPhoto {get;set;}
    
	public UserCtrlPhoto() {
         User user = [SELECT user.SmallPhotoUrl FROM User user WHERE user.id=:Userinfo.getUserid()];
         userPhoto = user.SmallPhotoUrl;
     }
}