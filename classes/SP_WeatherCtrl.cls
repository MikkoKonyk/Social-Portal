public class SP_WeatherCtrl {
	public String city { get; set; }
	public String code { get; set; }

	public SP_WeatherCtrl(ApexPages.StandardController stdCtrl) {
		Account account = (Account) stdCtrl.getRecord();
		account = [SELECT Id, ShippingCity FROM Account WHERE Id = :account.Id];
		this.city = account.ShippingCity;
	}
}