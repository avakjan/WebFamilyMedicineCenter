import { MedicineCenterLocation } from "./medicineCenterLocation";

export class MedicineCenter{
    constructor(
        public systemId = '', 
        public no = '', 
        public name ='', 
        public description ='',
        public contactPhone = '', 
        public medicineCenterLocationCode = '',
        public medicineCenterLocation = new MedicineCenterLocation()) { }
}