#ifndef _USER_TYPES_H
#define USER_TYPES_H

typedef struct patient_t patient;

struct patient_t
{
	s8 name [NAME_MAX];
	patient *next;
	u32 id;
	s8 age;
	s8 gender;
};

typedef struct reservation_t reservation;

struct reservation_t
{
	reservation *next;
	u32 id;
	s8 time;
};

enum modeList
{
	ADMIN = 1,
	USER,
	CLOSE
};

enum adminList
{
	ADD = 1,
	EDIT,
	RESERVE,
	CANCEL,
	EXIT_ADMIN
};

enum userList
{
	VIEW_RECORD = 1,
	VIEW_RESERVATION,
	EXIT_USER
};

enum editList
{
	NAME = 1,
	AGE,
	GENDER,
	EXIT_EDITING,
};

enum reservationSlots
{
	FIRST_SLOT = 1,
	SECOND_SLOT,
	THIRD_SLOT,
	FOURTH_SLOT,
	FIFTH_SLOT
};

#endif