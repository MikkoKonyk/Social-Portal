public class SP_HeaderCtrl  {
    public String userPhoto { get; set; }

	public SP_HeaderCtrl() {
         User user = [SELECT SmallPhotoUrl FROM User WHERE Id =: UserInfo.getUserId()];
         this.userPhoto = user.SmallPhotoUrl;
     }
}