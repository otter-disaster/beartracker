// Trigger for listening to Cloud_News events.
trigger OrderEventTrigger on Order_Event__e (after insert) {
    // List to hold all tasks to be created.
    List<Task> tasks = new List<Task>();
    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            // Create Task to dispatch new team.
            Task t = new Task();
            t.Priority = 'Medium';
            t.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            t.OwnerId = event.CreatedById;
            tasks.add(t);
        }
   }
    // Insert all tasks corresponding to events received.
    insert tasks;
}