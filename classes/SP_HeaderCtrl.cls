public class SP_HeaderCtrl  {
public string userPhoto {get;set;}
    
	public SP_HeaderCtrl() {
         User user = [SELECT user.SmallPhotoUrl FROM User user WHERE user.id=:Userinfo.getUserid()];
         userPhoto = user.SmallPhotoUrl;
     }
}