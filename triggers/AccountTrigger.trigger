trigger AccountTrigger on Account (before insert, before update) {

    AccountService.validateVAT(Trigger.new);

}