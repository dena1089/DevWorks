public class TestClass
{
	public static void HelloWorld()
	{
		system.debug('HelloWorld');
	}
	public static void TestWorld()
	{
		List<Account> lstAccount = [select id from account limit 5];
		system.debug('lstAccount '+lstAccount);
		
	}
}