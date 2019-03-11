public class BusScheduleCache {

    private Cache.OrgPartition part;
    public BusScheduleCache()
    {
        Cache.OrgPartition lpart = new Cache.OrgPartition('local.BusSchedule');
        if(lpart != null)
        {
        	this.part = lpart;
        }
    }
   public void putSchedule(String busLine, Time[] schedule)
    {
        if(part != null)
        {
            part.put(busLine,Schedule);
        }
    }
    public Time[] getSchedule(String busLine)
    {
        Time[] retTime = new Time[]{};
        if(part != null)
        {
            retTime = (Time[])part.get(busLine);
            if(retTime == null)
            {
                retTime.add(Time.newInstance(8,0,0,0));
            	retTime.add(Time.newInstance(17,0,0,0));
            }
        }
        return retTime;
    }	
}