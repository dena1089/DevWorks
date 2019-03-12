public class TestAccnt{
	public static List<Account> GetAccnt(String AccName)
	{
		return [select id from Account where name =:AccName];
	}
}