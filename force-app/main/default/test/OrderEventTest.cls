@isTest
public class OrderEventTest {
    @isTest static void testOrderEvent() {
        // Create test event instance
        Order_Event__e orderEvent = new Order_Event__e(
            Has_Shipped__c = true,
            Order_Number__c = '245'
        );
        Test.startTest();
        // Call method to publish events
        Database.SaveResult sr = EventBus.publish(orderEvent);
        Test.stopTest();
        // Perform validation here
        // Verify that the publish was successful
        System.assertEquals(true, sr.isSuccess());
        // Check that the case that the trigger created is present.
        List<Task> tasks = [SELECT Id FROM Task];
        // Validate that this case was found.
        // There is only one test case in test context.
        System.assertEquals(1, tasks.size());
    }
}