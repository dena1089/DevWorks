public class TestAccnt{
	public static List<Account> GetAccnt(String AccName)
	{
		system.debug('test1');
		return [select id from Account where name =:AccName];
	}
}