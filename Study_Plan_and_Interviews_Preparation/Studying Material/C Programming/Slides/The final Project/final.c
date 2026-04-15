#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "STD_TYPES.h"
#include "MACROS.h"
#include "USER_TYPES.h"
#include "PROTOTYPES.h"

//Patients' linked list header
patient *patientHead = NULL;
//Reservations' linked list header
reservation *reservationHead = NULL;

/*Array to determine available and reserved slots, 1 if available and 0 if reserved. First
index is ignored (for readability, so that slot 1 has index 1) and last index is for the
NULL terminator */
u8 reservedSlots [SLOTS_SIZE] = {'\0',AVAIABLE, AVAIABLE, AVAIABLE, AVAIABLE, AVAIABLE,'\0'}; 

int main (void)
{
	u8 mode;
	printClinicHeader();
	mode = chooseMode (); //whether admin or user mode
	
	while (mode != CLOSE) //As long as it is not chosen to close the program
	{
		switch (mode)
		{
			case ADMIN:
				adminMode(&patientHead, &reservationHead);
				break;
			case USER:
				userMode(patientHead, reservationHead);
				break;
		}
		mode = chooseMode();
	}
	
	//Before exiting, free all dynamically allocated memory
	freeMemory (&patientHead, &reservationHead);
	return EXIT_SUCCESS;
}

//Heads need to be passed by reference in order to free their locations
void freeMemory (patient **patientHead, reservation **reservationHead)
{
	while (*patientHead != NULL)
	{
		patient *temp = *patientHead;
		*patientHead = (*patientHead) -> next;
		free (temp);
	}
	
	while (*reservationHead != NULL)
	{
		reservation *temp = *reservationHead;
		*reservationHead = (*reservationHead) -> next;
		free (temp);
	}
}

void printClinicHeader(void)
{
	printf ("\n%25c", ' ');
	printStars ();
	printf (" CLINIC MANAGEMENT SYSTEM ");
	printStars ();
	printf ("\n");
}

void printStars (void)
{
	for (u8 counter = 1; counter <= 20; counter++)
	{
		printf ("*");
	}
}

u8 chooseMode(void)
{
	u8 choice;
	printModeList();
	scanf ("%d", &choice);
	
	//Check if the admin has entered an invalid choice
	while (choice < 1 || choice > 3)
	{
		printf ("Invalid choice!\n\n");
		printModeList();
		scanf ("%d", &choice);
	}
	
	printf ("\n");
	return choice;
}

void printModeList (void)
{
	printf ("1. Admin Mode.\n");
	printf ("2. User Mode.\n");
	printf ("3. Close Program.\n");
	printf ("Choose <1-3>: ");
}

/*Admin can modify both patient's information and reservations details, so heads
should be passed by reference for further modifications. Pointers that point to
each head should not point to any other data, so they are declared as const.
However, heads itself can point to other data, so they shouldn't be const (for 
example: patient *const *const patientHead is not allowed) */
void adminMode(patient **const patientHead, reservation **const reservationHead)
{
	u16 enteredPassword = getPassword();
	//Check if the user has entered the correct password
	if ( enteredPassword == SYSTEM_PASSWORD )
	{
		loginAdmin(); //If so, login to the system
	}
	else //Otherwise, free the dynamically allocated memory and exit the program
	{
		printf ("Password was entered incorrectly 3 times! Program terminated.");
		freeMemory (patientHead, reservationHead);
		exit (0);
	}
}

/*User cannot either change patients' information or reservations' details, so data
should be passed as const. */
void userMode(const patient *tempPatientHead, const reservation *tempReservationHead)
{
	u8 feature = chooseUserFeature();
	
	while (feature != EXIT_USER)
	{
		switch (feature)
		{
			case VIEW_RECORD:
			viewRecord(tempPatientHead);
			break;
			case VIEW_RESERVATION:
			printReservations(tempReservationHead);
			break;
		}
		feature = chooseUserFeature();
	}
}

u8 chooseUserFeature(void)
{
	u8 choice;
	printUserList();
	scanf ("%d", &choice);
	
	//Check if the user has entered an invalid choice
	while (choice < 1 || choice > 3)
	{
		printf ("Invalid choice!\n\n");
		printUserList();
		scanf ("%d", &choice);
	}
	
	printf ("\n");
	return choice;
}

void printUserList(void)
{
	printf ("\n1. View a patient's record.\n");
	printf ("2. View today's reservations.\n");
	printf ("3. Exit user mode.\n");
	printf ("Choose <1-3>: ");
}

void viewRecord(const patient *tempPatientHead)
{
	u32 id;
	printf ("Enter the patient's ID you would like to view his record: ");
	scanf ("%d", &id);
	s8 recordIndex = idExist (id, tempPatientHead);
	if (recordIndex == NOT_EXIST)
	{
		printf ("The ID entered does not exist!\n");
	}
	else
	{
		//Find the target patient and let tempPatientHead points to it
		for (s8 counter = 0; counter < recordIndex; counter++)
		{
			tempPatientHead = tempPatientHead -> next;
		}
		
		printInformation(tempPatientHead);	
	}
}

void printInformation(const patient *const p)
{
	printDashes();
	printf ("%6sPATIENT RECORD\n", " ");
	printDashes();
	printf ("%-6s%4s|%4s%s\n", "Name", " ", " ", p -> name);
	printf ("%-6s%4s|%4s%d\n", "Age", " ", " ", p -> age);
	printf ("%-6s%4s|%4s%c\n", "Gender", " ", " ", p -> gender);
	printf ("%-6s%4s|%4s%d\n\n", "ID", " ", " ", p -> id);
}

void printDashes (void)
{
	for (u8 i = 1; i <= 30; i++)
		{
			printf ("-");
		}
		
		printf ("\n");
}

void printReservations (const reservation *tempReservationHead)
{
	if (tempReservationHead == NULL)
	{
		printf ("No reservations were made yet.\n");
	}
	else
	{
		printDashes();
		printf ("%5sTODAY'S RESERVATIONS\n", " ");
		printDashes();
		printf ("%6sTime%6s|%5sID\n", " ", " ", " ");
		printDashes();
		
		//As long as there are reservations
		while (tempReservationHead != NULL)
		{
			switch (tempReservationHead -> time) //Based on the time reserved, print it
			{
				case FIRST_SLOT:
					printf ("%-16s", "2 PM to 2:30 PM");
					break;
				case SECOND_SLOT:
					printf ("%-16s", "2:30 PM to 3 PM");
					break;
				case THIRD_SLOT:
					printf ("%-16s", "3 PM to 3:30 PM");
					break;
				case FOURTH_SLOT:
					printf ("%-16s", "4 PM to 4:30 PM");
					break;
				case FIFTH_SLOT:
					printf ("%-16s", "4:30 PM to 5 PM");
					break;
			}
			
			printf ("|%5s%d\n", " ", tempReservationHead -> id); //print the patient's ID
			tempReservationHead = tempReservationHead -> next; //Go to next reservation
		}
	}
}

u16 getPassword (void)
{
	u16 enteredPassword;
	u8 trials = 1;
	printf ("Enter password: ");
	scanf ("%hu", &enteredPassword);
	
	/* If the entered password is incorrect and the admin has not entered
	an incorrect password for 3 times */
	while (enteredPassword != SYSTEM_PASSWORD && trials < 3)
	{
		printf ("Wrong password! Please enter the password again: ");
		scanf ("%hu", &enteredPassword);
		trials++;
	}
	
	return enteredPassword;
}

void loginAdmin(void)
{
	u8 feature = chooseAdminFeature();
	while (feature != EXIT_ADMIN)
	{
		switch (feature)
		{
			case ADD:
				addRecord(&patientHead);
				break;
			case EDIT:
				editRecord(patientHead);
				break;
			case RESERVE:
				reserveSlot(patientHead, &reservationHead, reservedSlots, SLOTS_SIZE);
				break;
			case CANCEL:
				cancelReservation(&reservationHead, reservedSlots);
		}
		feature = chooseAdminFeature();
	}
}

u8 chooseAdminFeature(void)
{
	u8 choice;
	printAdminList();
	scanf ("%d", &choice);
	
	while (choice < 1 || choice > 5)
	{
		printf ("Invalid choice!\n\n");
		printAdminList();
		scanf ("%d", &choice);
	}
	
	printf ("\n");
	return choice;
}

void printAdminList(void)
{
	printf ("\n1. Add a new record.\n");
	printf ("2. Edit an existing record.\n");
	printf ("3. Reserve an appointment.\n");
	printf ("4. Cancel a reservation.\n");
	printf ("5. Exit admin mode.\n");
	printf ("Choose <1-5>: ");
}

/*Patient's head should be passed by reference because it might
need to be changed if the list is empty (adding record for the
first time) */
void addRecord(patient **const patientHead)
{
	//Allocate a memory dynamically for a patient
	patient *new = (patient *) malloc ( sizeof (patient) );
	getInformation (new, *patientHead);
	new -> next = NULL;
	
	//If the list is empty
	if (*patientHead == NULL)
	{
		*patientHead = new;
	}
	else
	{
		patient *temp = *patientHead;
		//Loop until you point to the last node
		while ( temp -> next != NULL)
		{
			temp = temp -> next;
		}
	
		temp -> next = new;
	}
}

void getInformation (patient *const p, const patient *tempPatientHead)
{
	getName (p);
	getAge (p);
	getGender (p);
	getId (p, tempPatientHead);
}

void getName (patient *const p)
{
	printf ("Enter the patient's name (40 characters max): ");	
	processName (p);
	validateName (p);
	
	//Loop over the array of characters to check that the entered name is valid
	for (s8 character = 0; p -> name [character] != '\0'; character++)
	{
		if (!validCharacter( p -> name[character] ) )
		{
			printf ("Invalid name! names can only contain letters and spaces.\n");
			printf ("Please enter another name: ");
			processName (p);
			validateName (p);
			//Since an invalid character was detected, start checking from the beginning again
			character = -1;
		}
	}
}

u8 validCharacter (const s8 c)
{
	return (c >= 'a' && c <= 'z') ||
	(c >= 'A' && c <= 'Z') ||
	(c == ' ');
}

void processName (patient *const p)
{
	fgets (p -> name, NAME_MAX, stdin);
	//Replace the newline character retained (if found) with a null terminator
	if ( p -> name [strlen (p -> name) - 1] == '\n' )
	{
		p -> name [strlen (p -> name) - 1] = '\0';
	}
	
	//If array is filled, clear buffer if anything is left
	if ( strlen (p -> name) == 	NAME_MAX - 1)
	{
		while ( getchar() != '\n' );
	}	
}

void validateName (patient *const p)
{
	//If the first character became the null terminator or it is SPACE, then the name is empty
	while (p -> name [0] == '\0' || p -> name [0] == ' ')
	{
		printf ("No empty or first-spaced name is allowed! Please enter a valid name: ");
		processName (p);
	}
}

void getAge (patient *const p)
{
	printf ("Enter the patient's age: ");
	scanf ("%d", &(p -> age));
	
	while (p -> age < 0)
	{
		printf ("Invalid input! Please enter a realistic age: ");
		scanf ("%d", &(p -> age));
	}
}

void getGender (patient *const p)
{
	printf ("Enter the patient's gender <M/F>: ");
	scanf ("%c", &(p -> gender));
	
	while (!validGender(p -> gender))
	{
		printf ("Invalid input!\nPlease enter <M/F>: ");
		scanf ("%c", &(p -> gender));
	}
	
	if (p -> gender == 'm')
	{
		p -> gender = 'M';
	}
	else if (p -> gender == 'f')
	{
		p -> gender = 'F';
	}
}

u8 validGender (const s8 gender)
{
	if (gender == 'M' || gender == 'F' || gender == 'm' || gender == 'f')
	{
		return VALID;
	}
	else
	{
		return INVALID;
	}
}

void getId (patient *const p, const patient *tempPatientHead)
{
	printf ("Enter the patient's ID: ");
	scanf ("%d", &(p -> id) );
	//If the list is not empty, then check that the entered ID does not exist before
	if (tempPatientHead != NULL)
	{
		while ( idExist(p -> id, tempPatientHead) != NOT_EXIST )
		{
			printf ("ID already exists! Please enter another ID: ");
			scanf ("%d",&(p -> id) );
		}
	}
	printf ("Record added successfully!\n");
}

//The function returns the patient's index (in the linked list) if found and -1 if not
s8 idExist (const u32 enteredId, const patient *tempPatientHead)
{
	u8 index = 0;
	
	while (tempPatientHead != NULL)
	{
		if (enteredId == tempPatientHead -> id)
		{
			//If it exists, return the patient's index in the list
			return index;
		}
		
		tempPatientHead = tempPatientHead -> next;
		index++;
	}
	
	//If it does not exist, return -1 as its index (which tells that it does not exist)
	return NOT_EXIST;
}

void editRecord(patient *tempPatientHead)
{
	u32 id;
	s8 recordIndex;
	u8 choice;
	printf ("Enter the patient's ID you would like to edit his information: ");
	scanf ("%d", &id);
	recordIndex = idExist (id, tempPatientHead);
	if (recordIndex == NOT_EXIST)
	{
		printf ("The ID entered does not exist!\n");
	}
	else
	{
		//Find the target patient and let tempPatientHead points to it
		for (s8 counter = 0; counter < recordIndex; counter++)
		{
			tempPatientHead = tempPatientHead -> next;
		}	
		choice = chooseEditFeature();
		
		while (choice != EXIT_EDITING)
		{	
			switch (choice)
			{
				case NAME:
					getName (tempPatientHead);
					break;
				case AGE:
					getAge (tempPatientHead);
					break;
				case GENDER:
					getGender (tempPatientHead);
					break;
			}
			choice = chooseEditFeature();
		}
	}
}

u8 chooseEditFeature (void)
{
	u8 choice;
	printEditList();
	scanf ("%d", &choice);
		
	while (choice < 1 || choice > 4)
	{
		printf ("Invalid choice.\n\n");
		printEditList();
		scanf ("%d", &choice);
	}
	
	printf ("\n");
	return choice;
}

void printEditList (void)
{
	printf ("1. Edit Name.\n");
	printf ("2. Edit Age.\n");
	printf ("3. Edit Gender.\n");
	printf ("4. Return to admin list.\n");
	printf ("Choose <1-4>: ");
}

void reserveSlot(patient *tempPatientHead, reservation **const reservationHead, u8 *const slots, const u8 size)
{
	u8 choice;
	u32 reservingId;
	if ( availableSlots(slots, size) )
	{
		printAvailableSlots (slots, size);
		choice = chooseSlot (slots);
		slots [choice] = RESERVED;
		reservingId = chooseId(tempPatientHead);
		//Allocate a dynamic memory for a new reservation
		reservation *new = (reservation *) malloc ( sizeof (reservation) );
		new -> id = reservingId; //Store the reserving patient's ID
		new -> time = choice; //Store the chosen time slot 
		addReservationToList(new, reservationHead);
		printf ("Slot %d reserved successfully!\n", choice);
	}
	else
	{
		printf ("Sorry, no available slots!\n");
	}
}

u8 availableSlots (const u8 *const slots, const u8 size)
{
	//Check if there is any available slot
	for (u8 counter = 1; counter < size - 1; counter++)
	{
		if (slots [counter] == AVAIABLE)
		{
			return AVAIABLE;
		}
	}
	
	return RESERVED;
}

void printAvailableSlots (const u8 *const slots, const u8 size)
{
	printDashes();
	printf ("%4s%s\n", " ", "Available Slots");
	printDashes();
	printf ("Slot%6s|%9sTime\n", " ", " ");
	
	for (u8 counter = 1; counter < size - 1; counter++)
	{
		if (slots [counter] == AVAIABLE)
		{
			printf ("%3d%7s|\t", counter, " ");
			switch (counter)
			{
				case FIRST_SLOT:
					printf ("2 PM to 2:30 PM\n");
					break;
				case SECOND_SLOT:
					printf ("2:30 PM to 3 PM\n");
					break;
				case THIRD_SLOT:
					printf ("3 PM to 3:30 PM\n");
					break;
				case FOURTH_SLOT:
					printf ("4 PM to 4:30 PM\n");
					break;
				case FIFTH_SLOT:
					printf ("4:30 PM to 5 PM\n");
					break;
			}
		}
	}
	
	printf ("\n");
}

u8 chooseSlot (const u8 *const slots)
{
	u8 choice;
	printf ("Enter a slot number to reserve: ");
	scanf ("%d", &choice);
	
	while (choice < FIRST_SLOT || choice > FIFTH_SLOT)
	{
		printf ("Invalid choice! Please choose a valid slot: ");
		scanf ("%d", &choice);
	}
	
	while (slots [choice] == RESERVED)
	{
		printf ("This slot is already reserved! Please choose another slot: ");
		scanf ("%d", &choice);
	}
	
	return choice;
}

u32 chooseId (const patient *tempPatientHead)
{
	u32 reservingId;
	printf ("Enter the patient's ID: ");
	scanf ("%d", &reservingId);
	
	while ( idExist(reservingId, tempPatientHead) == NOT_EXIST )
	{
		printf ("ID entered does not exist! Please enter another ID: ");
		scanf ("%d", &reservingId);
	}
	
	return reservingId;	
}

void addReservationToList (reservation *new, reservation **reservationHead)
{
	new -> next = NULL;
	if (*reservationHead == NULL)
	{
		*reservationHead = new;
	}
	else
	{
		reservation *tempReservationHead = *reservationHead;
		
		//Loop until you point to the last node
		while ( tempReservationHead -> next != NULL)
		{
			tempReservationHead = tempReservationHead -> next;
		}

		tempReservationHead -> next = new;
	}
}

void cancelReservation(reservation **reservationHead, u8 *const slots)
{
	if (*reservationHead == NULL)
	{
		printf ("There are no reservations yet!\n");
		return;
	}
	else
	{
		u32 id;
		u8 index = 0;
		reservation *temp = *reservationHead;
		printf ("Enter the patient's ID you would like to cancel his reservation: ");
		scanf ("%d", &id);

		while (temp != NULL)
		{
			//If the entered ID was found in the list
			if (id == temp -> id)
			{
				slots [temp -> time] = AVAIABLE; //Set the slot as available
				//If it was the first reservation
				if (index == 0)
				{
					//Let the reservation head point to the next reservation
					reservation *tempHead = *reservationHead;
					*reservationHead = (*reservationHead) -> next;
					free (tempHead);
				}
				else
				{
					reservation *previousNode = *reservationHead;
					reservation *targetNode = *reservationHead;
		
					//Let previousNode point to the element just before the target
					for (u8 counter = 1; counter <= index - 1; counter++)
					{
						previousNode = previousNode -> next;
					}
		
					//Let targetNode point to the target to be deleted.
					for (u8 counter = 1; counter <= index; counter++)
					{
						targetNode = targetNode -> next;
					}
		
					previousNode -> next = targetNode -> next;
					free (targetNode);
				}
				printf ("Reservation was cancelled successfully.\n");
				return;
			}
			
			temp = temp -> next;
			index++;
		}
		
		printf ("The entered ID does not have a reservation.\n");
	}
}