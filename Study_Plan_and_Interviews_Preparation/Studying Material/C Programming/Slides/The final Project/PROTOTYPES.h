#ifndef _PROTOTYPES_H
#define _PROTOTYPES_H

void freeMemory (patient **patientHead, reservation **reservationHead);
void printClinicHeader(void);
void printStars (void);
u8 chooseMode(void);
void printModeList (void);
void adminMode(patient **patientHead, reservation **reservationHead);
void userMode(const patient *tempPatientHead, const reservation *tempReservationHead);
void viewRecord(const patient *tempPatientHead);
void printInformation (const patient *const p);
void printReservations (const reservation *tempReservationHead);
u8 chooseUserFeature(void);
void printUserList(void);
u16 getPassword (void);
void loginAdmin(void);
u8 chooseAdminFeature(void);
void printAdminList(void);
void addRecord(patient **const patientHead);
void editRecord(patient *tempPatientHead);
void reserveSlot(patient *tempPatientHead, reservation **const reservationHead, u8 *const slots, const u8 size);
u8 availableSlots (const u8 *const slots, const u8 size);
void printAvailableSlots (const u8 *const slots, const u8 size);
u8 chooseSlot (const u8 *const slots);
u32 chooseId (const patient *tempPatientHead);
void addReservationToList (reservation *new, reservation **reservationHead);
void printDashes (void);
void cancelReservation(reservation **reservationHead, u8 *const slots);
void getInformation (patient *const p, const patient *tempPatientHead);
u8 validCharacter (const s8 c);
void getName (patient *const p);
void processName (patient *const p);
void validateName (patient *const p);
void getAge (patient *const p);
void getGender (patient *const p);
u8 validGender (const s8 gender);
void getId (patient *const p, const patient *tempPatientHead);
s8 idExist (const u32 enteredId, const patient *tempPatientHead);
u8 chooseEditFeature (void);
void printEditList (void);

#endif



