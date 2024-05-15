export class PatientLedgerEntry{
    constructor(
        public no: string,
        public patientId : string,
        public entryType: string,
        public postingDate: string){ }

    public get date() {
        return new Date(this.postingDate);
    }
}