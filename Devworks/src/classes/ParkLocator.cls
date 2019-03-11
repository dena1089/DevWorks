public class ParkLocator {
	public static String[] country(String CountryInp)
    {
        String[] strCtryNames;
        ParkService.ParksImplPort ppi = new ParkService.ParksImplPort();
       	strCtryNames = ppi.byCountry(CountryInp);
        System.debug('strCtryNames '+strCtryNames);
        //System.assertEquals(4, strCtryNames.size(), 'Queue is not matched');
       return strCtryNames;
    }
}