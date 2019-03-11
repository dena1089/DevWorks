@isTest
public class TestVerifyDate {
	@isTest static void CheckDates()
    {
        Date sInp1 = Date.newInstance(2010, 07, 15);
        Date sInp2 = Date.newInstance(2010, 08, 10);
        Date sDate1 = Date.newInstance(2010, 08, 10);
        Date sDate = VerifyDate.CheckDates(sInp1, sInp2);
        System.debug('Run#1 sInp1 '+sInp1+' sInp2 '+sInp2+' sDate '+sDate+' sDate1 '+sDate1);
        System.assertEquals(sDate1, sDate, 'Change the input');
        sInp1 = Date.newInstance(2010, 07, 15);
        sInp2 = Date.newInstance(2010, 08, 17);
        sDate1 = Date.newInstance(2010, 07, 31);
        sDate = VerifyDate.CheckDates(sInp1, sInp2);
        System.debug('Run#2 sInp1 '+sInp1+' sInp2 '+sInp2+' sDate '+sDate+' sDate1 '+sDate1);
        System.assertEquals(sDate1, sDate, 'Change the input');
    }
}