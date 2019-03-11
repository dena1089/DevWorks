public class NewCaseListController {
    private string stat = 'New';
public list<Case> getNewCases()
{
    list<Case> lst = Database.query('SELECT ID, CASENUMBER FROM CASE WHERE STATUS= :stat') ;
    return lst;
}
}