public class TesCon{
	public static list<contact> GetContact()
	{	
		system.debug('Test3');
		return [select id,Name from contact Limit 10];
	}
}
