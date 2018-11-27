public class SP_HeaderCtrl  {
    //TODO: use code formatting, types must be defined with capital letter, add spaces like { get; set; }
public string userPhoto {get;set;}

	public SP_HeaderCtrl() {
         //TODO: why do you use alias here? Do not copy&paste code. if you do this then format it at least. Use "this" keyword if you reference variable inside class instance
         User user = [SELECT user.SmallPhotoUrl FROM User user WHERE user.id=:Userinfo.getUserid()];
         userPhoto = user.SmallPhotoUrl;
     }
}