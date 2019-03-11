@isTest
private class ParkLocatorTest {
	@isTest static void ParkTest()
    {
        String[] CtryNames;
        String[] CtryOut = new String[]{'Germany','India','Japan','United States'};
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        CtryNames = ParkLocator.country('India');
        System.assertEquals(CtryOut, CtryNames, 'Output is not matching');
    }
}