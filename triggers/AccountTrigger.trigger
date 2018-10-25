trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
<<<<<<< HEAD
    AccountHandler.handleTrigger(Trigger.new, Trigger.operationType);
=======

//            AccountHandler.handleTrigger(Trigger.new, Trigger.operationType);

>>>>>>> feat/new_task
}