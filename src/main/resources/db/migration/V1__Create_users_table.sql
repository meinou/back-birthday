create table USERS (
    ID SERIAL,
    USERNAME varchar(100) NOT NULL UNIQUE,
    FIRST_NAME varchar(100),
    LAST_NAME varchar(100),
    EMAIL varchar(100),
    ABOUT_ME varchar(500),
    PASSWORD varchar(100),
    TIME_ADDED TIMESTAMP default CURRENT_TIMESTAMP,
    CONSTRAINT PK_USERS PRIMARY KEY (ID)
);

create table BIRTHDAYS (
    ID SERIAL,
    CREATOR integer,
    TITLE varchar(100),
    DESCRIPTION varchar(500),
    TOTAL_GIVEN integer default 0,
    ENDING TIMESTAMP default CURRENT_TIMESTAMP,
    TIME_ADDED TIMESTAMP default CURRENT_TIMESTAMP,
    CONSTRAINT PK_BIRTHDAYS PRIMARY KEY (ID),
    CONSTRAINT CREATOR FOREIGN KEY(CREATOR)
        REFERENCES USERS (ID)
        ON UPDATE RESTRICT ON DELETE CASCADE
);

create table DONATORS (
    ID SERIAL,
    USER_ID integer,
    BIRTHDAY_ID integer,
    CONSTRAINT USER_ID FOREIGN KEY (USER_ID)
        REFERENCES USERS (ID)
        ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT BIRTHDAY_ID FOREIGN KEY (BIRTHDAY_ID)
        REFERENCES BIRTHDAYS (ID)
        ON UPDATE RESTRICT ON DELETE CASCADE
);

create table GIFTS (
    ID SERIAL,
    TITLE varchar(100),
    DESCRIPTION varchar(500),
    BIRTHDAY_ID integer,
    AMOUNT integer,
    CONSTRAINT BIRTHDAY_ID FOREIGN KEY(BIRTHDAY_ID)
        REFERENCES BIRTHDAYS (ID)
        ON UPDATE RESTRICT ON DELETE CASCADE,
    CONSTRAINT PK_GIFTS PRIMARY KEY (ID)
);