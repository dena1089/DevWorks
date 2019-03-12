public class TesCon{
	public static list<contact> GetContact()
	{	
		return [select id,Name from contact Limit 10];
	}
}