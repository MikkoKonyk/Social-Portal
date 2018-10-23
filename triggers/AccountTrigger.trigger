trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after delete, after undelete) {

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            AccountService.validateVAT(Trigger.new);
        }
        if (Trigger.isUpdate) {
            AccountService.validateVAT(Trigger.new);
        }
    }
}