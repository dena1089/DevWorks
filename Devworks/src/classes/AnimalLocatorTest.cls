@isTest
private class AnimalLocatorTest {
	@isTest static void testAnimalGetCallout() {
        String Resp;
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        Resp = AnimalLocator.getAnimalNameById(1);
        System.debug('Resp '+Resp);
        System.assertEquals('Tiger', Resp, 'The array should only contain 3 items.');
    }
}