@isTest
private class ParkLocatorTest {
    @isTest static void test1() {              
        Test.setMock(WebServiceMock.class, new ParkServiceMock()); 
        String[] result = ParkLocator.Country('Italia'); 
     } 
}