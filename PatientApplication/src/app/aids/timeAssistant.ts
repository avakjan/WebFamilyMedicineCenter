export class TimeAssistant{
    
    static addHours(date: Date, hours : number) {
        const hoursToAdd = hours * 60 * 60 * 1000;
        date.setTime(date.getTime() + hoursToAdd);
        return date;
      }

    static isTimeExpired(dateTimeString: string): boolean {
    const targetDate = new Date(dateTimeString);
    const currentDate = new Date();
    return currentDate >= targetDate;
    } 
}