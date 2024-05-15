export class UpcomingVisit {
    constructor(
    public systemId ='', 
    public no = '', 
    public description ='', 
    public familyCenterName ='', 
    public isOnline = false, 
    public medicalEmployeeName = '', 
    public meetingLink = '', 
    public date = new Date(), 
    public type = ''){ }
}