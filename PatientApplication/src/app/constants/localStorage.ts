export class LocalStorage {
    public static readonly username = 'username';
    public static readonly expiration = 'expiration';

    public static clearPatientStorage(): void {
        const properties : string[] = [ LocalStorage.username, LocalStorage.expiration];
        properties.forEach((prop) => {
            localStorage.removeItem((LocalStorage as any)[prop]);
        });
    }
}