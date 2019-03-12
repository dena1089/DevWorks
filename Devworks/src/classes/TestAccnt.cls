public class TestAccnt{
	public static List<Account> GetAccnt(String AccName)
	{
		system.debug('Test');
		return [select id from Account where name =:AccName];
	}
}
