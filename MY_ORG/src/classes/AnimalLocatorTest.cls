@isTest
private class AnimalLocatorTest {
  @isTest static void test1() {
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
    String expectedValue = AnimalLocator.getAnimalNameById(1);
  }
}