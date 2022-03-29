Create table Customer (
CustNo int not null,
Email varchar(100) NOT NULL,
Password char(16) NOT NULL,
FirstName varchar(30) NOT NULL,
LastName varchar(30) not null,
Gender char(1) not null,
Dob date not null,
timesLogged int,
city varchar(30) not null,
street varchar(30) not null,
houseNo varchar(3) not null,

CONSTRAINT PK_customer PRIMARY KEY (CustNo),
CONSTRAINT UNIQ_email UNIQUE (Email),
CONSTRAINT CHK_Password CHECK (LEN(Password) BETWEEN 8 and 16)
);

Create table FinalOrder (
OrderNo int not null,
CustNo int not null,
OrderDate date not null,

CONSTRAINT PK_purchase PRIMARY KEY (OrderNo),
CONSTRAINT FK_pur_cust FOREIGN KEY (CustNo) REFERENCES Customer (CustNo)
)


Create table Tour (
TourID int not null,
TourName varchar(100) not null,
MaxGroupSize int not null,
Duration char(10) not null,
Theme varchar(50) not null,
TimesViewed int,

CONSTRAINT PK_Tour PRIMARY KEY (TourID)
);

Create table Ticket(
TicketID int not null,
GroupType char(3) not null, -- this can be Adult(A), Child(C), Fully Booked (FB) or Group(G). Group size can be 4, 6, 8, 10.
TourID int not null,
PricePerTicket money not null,

CONSTRAINT PK_Ticket PRIMARY KEY (TicketID),
CONSTRAINT FK_Ticket_tour FOREIGN KEY(TourID) REFERENCES Tour (TourID),
CONSTRAINT CHK_GroupType CHECK(GroupType='A' OR GroupType='C' OR GroupType='G4' OR GroupType='G6' OR GroupType='G8' OR GroupType='G10' OR GroupType='FB')
);

Create table Location(
LocID int not null,
LocName char(100) not null,
Description varchar(100) not null,

CONSTRAINT PK_Location PRIMARY KEY (LocID) 
);

Create table Tour_loc(
TourID int not null,
LocID int not null,
position int not null,

CONSTRAINT PK_Tour_loc PRIMARY KEY(TourID, LocID),
CONSTRAINT FK_Tour_loc_Location FOREIGN KEY (LocID) REFERENCES Location(LocID),
CONSTRAINT FK_Tour_loc_Tour FOREIGN KEY (TourID) REFERENCES Tour(TourID)
);

Create table Suborder (
OrderNo int not null,
TicketID int not null,
Quantity int not null,
TourDate date not null,


CONSTRAINT PK_suborder PRIMARY KEY (OrderNo, TicketID),
CONSTRAINT FK_sub_purchase FOREIGN KEY (OrderNo) REFERENCES FinalOrder (OrderNo),
CONSTRAINT FK_sub_tour FOREIGN KEY (OrderNo) REFERENCES Ticket (TicketID)
)

Create table Satisfaction (
CustNo int not null,
TourID int not null,
Rating int not null, -- it has to be between 1 and 5

CONSTRAINT PK_satisfaction PRIMARY KEY (CustNo, TourID),
CONSTRAINT FK_cust_satisf FOREIGN KEY (CustNo) REFERENCES Customer (CustNo),
CONSTRAINT FK_tour_satisf FOREIGN KEY (TourID) REFERENCES Tour (TourID)
)

--customer

INSERT INTO Customer VALUES (1, 'a.jonson@example.com', 'ajonson123', 'Aaron', 'Jonson', 'm', '1991-01-01', 1, 'Maastricht', 'Tilystraat', '32');
INSERT INTO Customer VALUES (2, 'w.smith@something.net', 'wsmith123', 'Will', 'Smith', 'm', '2003-02-23', 1, 'Utrecht', 'Boothstraat', '2');
INSERT INTO Customer VALUES (3, 'e.watson@something.net','ewatson123', 'Emma', 'Watson', 'f', '1994-11-04', 1, 'Amsterdam', 'Lichterstraat', '23');
INSERT INTO Customer VALUES (4, 'g.shaw@something.net', 'gshaw123', 'George', 'Shaw', 'm', '2000-07-15', 1, 'Eindhoven', 'Boschdijk', '25');
INSERT INTO Customer VALUES (5, 'r.ginger@example.com', 'rginger123','Rudy','Ginger','f','1987-12-06', 1, 'Eindhoven', 's Gravesandestraat', '5');
INSERT INTO Customer VALUES (6, 'e.cartman@example.com', 'ecartman123', 'Eric', 'Cartman', 'm', '1999-02-02',1,'Amsterdam','Botterstraat','3');
INSERT INTO Customer VALUES (7, 'w.testaburger@example.com','wtestaburger123', 'Wendy', 'Testaburger', 'f','2002-05-23', 1,'Amsterdam', 'Treilerhof','17');
INSERT INTO Customer VALUES (8, 'k.broflovsky@something.net','kbroflovsky123','Kyle', 'Broflovsky', 'm', '1997-12-24', 1, 'Amsterdam','Azaleastraat', '10');
INSERT INTO Customer VALUES (9, 's.march@something.net', 'smarch123', 'Stan', 'March', 'm', '2000-02-29', 1, 'Amsterdam', 'Floraweg','3');
INSERT INTO Customer VALUES (10, 'k.mccormick@something.net','kmccormick123','Kenny','McCormick','m', '1998-04-21', 1, 'Eindhoven', 'Moriaenstraat', '16');
INSERT INTO Customer VALUES (11, 'jbriggs@example.com', 'jbriggs123', 'Jaqui', 'Briggs', 'f', '1989-03-05', 1, 'Roermond', 'Bredeweg', '7');
INSERT INTO Customer VALUES (12, 'ccage@something.net', 'ccage123', 'Cassie', 'Cage', 'f', '1971-10-08', 1, 'Roermond', 'Kapellerhof', '26');
INSERT INTO Customer VALUES (13, 'hhasashi@example.com', 'hhasashi123', 'Hanzo', 'Hasashi', 'm', '1988-06-05', 1, 'Utrecht', 'Agaatlaan', '13');
INSERT INTO Customer VALUES (14, 'lkang@something.net', 'lkang123', 'Liu', 'Kang', 'm', '2000-08-06', 1, 'Utrecht', 'Slotlaan', ' 17');
INSERT INTO Customer VALUES (15, 'fbaggins@example.com', 'fbaggins123', 'Frodo', 'Baggins', 'm', '1996-10-22', 1, 'Amsterdam', 'Kerkstraat', '11');
INSERT INTO Customer VALUES (16, 'kwojtyla@something.net', 'kwojtyla123', 'Karol', 'Wojtyla', 'm', '1997-03-21', 1, 'Eindhoven', 'Boschdijk', '31');
INSERT INTO Customer VALUES (17, 'sblade@example.com', 'sblade123', 'Sonya', 'Blade', 'f', '2000-12-31', 1, 'Hague', 'Oranjelaan', '7c');
INSERT INTO Customer VALUES (18, 'jbezos@something.net', 'jbezos123', 'Jeff', 'Bezos', 'm', '1982-02-05', 1, 'Hague', 'Konigslaan', '9a');
INSERT INTO Customer VALUES (19, 'mcurie@example.com', 'mcurie123', 'Marie', 'Curie', 'f', '1989-03-30', 1, 'Maastricht','Linksweg', '8');
INSERT INTO Customer VALUES (20, 'nportman@example.com', 'nportman123', 'Natalie', 'Portman', 'f', '1979-04-17', 1, 'Maastricht', 'Linksweg', '10');
INSERT INTO Customer VALUES (21, 'epiath@example.com', 'epiath123', 'Edith', 'Piath', 'f', '2003-07-03', 1, 'Tilburg', 'Broerestraat','5A');
INSERT INTO Customer VALUES (22, 'jlemon@something.net', 'jlemon123', 'John', 'Lemon', 'm', '1997-08-30', 1, 'Tilburg', 'Houtstraat', '7');
INSERT INTO Customer VALUES (23, 'lorgana@soemthing.net', 'lorgana123', 'Leia', 'Organa', 'f', '1987-06-12', 1, 'Tilburg', 'Houtstraat', '19B');
INSERT INTO Customer VALUES (24, 'pamidala@example.com', 'pamidala123', 'Padme', 'Amidala', 'f', '1976-08-14', 1, 'Tiblurg', 'Houtstraat', '19B');
INSERT INTO Customer VALUES (25, 'hsolo@something.net', 'hsolo123', 'Han', 'Solo', 'm', '1985-03-17', 1, 'Eindhoven', 'Oranjelaan','3');
INSERT INTO Customer VALUES (26, 'askywalker@example.com', 'askywalker123', 'Anakin', 'Skywalker', 'm','1997-12-24', 1, 'Utrecht', 'Linksweg', '29');
INSERT INTO Customer VALUES (27, 'lkywalker@example.com', 'lskywalker123', 'Luke', 'Skywalker', 'm', '2000-09-27', 1, 'Veldhoven', 'Werkerlaan', '17');
INSERT INTO Customer VALUES (28, 'spalpatine@exapmle.com', 'spalpatine123', 'Sheev', 'Palpatine', 'm', '1964-08-19', 1, 'Hague', 'Werkerweg', '27C');
INSERT INTO Customer VALUES (29, 'mlarson@something.net','mlarson123', 'Martin', 'Larson', 'm', '2000-11-30', 1, 'Hague', 'Edamstraat', '13');
INSERT INTO Customer VALUES (30, 'astock@example.com', 'astock123', 'Anna', 'Stock', 'f', '2002-11-11', 1, 'Hague', 'Leyweg', '31A');
INSERT INTO Customer VALUES (31, 'rgrint@example.com', 'rgrint123', 'Rupert', 'Grint', 'm', '1997-01-23', 1, 'Veldhoven', 'Oranjestraat', '7');
INSERT INTO Customer VALUES (32, 'hwright@something.net', 'hwright123', 'Henry', 'Wright', 'm', '1998-09-18', 1, 'Hague', 'Goudaweg', '10');
INSERT INTO Customer VALUES (33, 'hclark@example.com', 'hclark123', 'Harry', 'Clark', 'm', '2002-08-08', 1, 'Helmond', 'Treilerhof', '17');
INSERT INTO Customer VALUES (34, 'pjason@example.com', 'pjason123', 'Paul', 'Jason', 'm', '1999-07-12', 1, 'Utrecht', 'Werkerlaan', '47');
INSERT INTO Customer VALUES (35, 'nsmith@something.net', 'nsmmith123', 'Nicolas', 'Smith', 'm', '1979-02-25', 1, 'Helmond', 'Botterstraat', '13');
INSERT INTO Customer VALUES (36, 'cjones@example.com', 'cjones123', 'Camille', 'Jones', 'm', ' 1986-05-10', 1, 'Helmond', 'Edamstraat', '9');
INSERT INTO Customer VALUES (37, 'rwilliams@something.net', 'rwilliams123', 'Rebecca', 'Williams','f', '1973-09-27', 1, 'Helmond', 'Edamstraat', '9');
INSERT INTO Customer VALUES (38, 'mtaylor@soemthing.net', 'mtaylor123', 'Michael', 'Taylor', 'm', '2003-10-31', 1, 'Helmond', 'Oranjelaan', '13');
INSERT INTO Customer VALUES (39, 'mdavies@something.net', 'mdavies123', 'Marina', 'Davies', 'f', '1997-12-17', 1, 'Eindhoven', 'Bsochdjik', '259');
INSERT INTO Customer VALUES (40, 'cevans@something.net', 'cevans123', 'Christopher', 'Evans', 'm', '1998-02-08', 1, 'Amsterdam', 'Goudalaan', '23');
INSERT INTO Customer VALUES (41, 'lthomas@something.net', 'lthomas123','Lucy', 'Thomas', 'f', '1997-07-07', 1, 'Amsterdam', 'Edamstraat', '6'); 
INSERT INTO Customer VALUES (42, 'gjohnson@something.net', 'gjohnson123', 'Gregory', 'Johnson', 'm', '1995-09-14', 1, 'Utrecht', 'Linksweg', '10');
INSERT INTO Customer VALUES (43, 'rroberts@something.net', 'rroberts123', 'Rosie', 'Roberts', 'f', '2002-01-18', 1, 'Utrecht', 'Rechtslaan', '24');
INSERT INTO Customer VALUES (44, 'swalker@something.net', 'swalker123', 'Steven', 'Walker', 'o', '1993-06-13', 1, 'Helmond', 'Linksweg', '11');
INSERT INTO Customer VALUES (45, 'arobinson@example.com', 'arobinson123', 'Alice', 'Robinson', 'f', '1999-08-19', 1, 'Eindhoven', 'Oranjelaan', '29');
INSERT INTO Customer VALUES (46, 'vthompson@example.com', 'vthompson123', 'Victor', 'Thompson', 'm', '2005-03-14', 1, 'Eindhoven', 'Kennedylaan', '21');
INSERT INTO Customer VALUES (47, 'hwhite@example.com', 'hwhite123', 'Helen', 'White', 'f', '1964-01-01', 1, 'Amsterdam', 'Kennedylaan', '1');
INSERT INTO Customer VALUES (48, 'ahughes@example.com', 'ahughes123', 'Alexander', 'Hughes', 'm', '2001-07-10', 1, 'Veldhoven', 'Rechtsweg', '78');
INSERT INTO Customer VALUES (49, 'aedwards@something.net', 'aedwards123', 'Ann', 'Edwards', 'f', '1995-08-09', 1, 'Amsterdam', 'Kaasstraat', '24');
INSERT INTO Customer VALUES (50, 'mgreen@example.com', 'mgreen123', 'Martin', 'Green', 'm', '1985-04-10', 1, 'Amsterdam', 'Kaasstraat', '26');
INSERT INTO Customer VALUES (51, 'dlevit@example.com', 'dlevit123', 'Danielle', 'Levit', 'f', '1995-08-19', 1, 'Amsterdam', 'Goudalaan', '46');
INSERT INTO Customer VALUES (52, 'iwood@something.net', 'iwood123', 'Isabel', 'Wood', 'f', '1975-06-27', 1, 'Utrecht', 'Goudalaan', '13');
INSERT INTO Customer VALUES (53, 'sharris@something.net', 'sharris123', 'Simon', 'Harris', 'o', '1996-06-06', 1, 'Helmond', 'Linksweg', '24');
INSERT INTO Customer VALUES (54, 'cmartin@something.net', 'cmartin123', 'Charles', 'Martin', 'm', '1985-05-05', 2, 'Veldhoven', 'Kaaslaan', '44');
INSERT INTO Customer VALUES (55, 'vjackson@exapmle.com', 'vjackson123', 'Victoria', 'Jackson', 'f', '1996-12-13', 1, 'Eindhoven', 'Goudastraat', '10');
INSERT INTO Customer VALUES (56, 'oclarke@soemthing.com', 'oclarke123', 'Olivier', 'Clarke', 'm', '1999-08-11', 1, 'Amsterdam', 'Kennedylaan', '32');
INSERT INTO Customer VALUES (57, 'xlee@example.com', 'xlee1234', 'Xavier', 'Lee', 'm', '1998-04-26', 1, 'Eindhoven' , 'Kennedylaan', '13');
INSERT INTO Customer VALUES (58, 'rjensen@something.net', 'rjensen123', 'Robert', 'Jensen', 'm', '2002-08-03', 1, 'Eindhoven', 'Kennedylaan', '13');
INSERT INTO Customer VALUES (59, 'jfoley@soemthing.net', 'jfoley123', 'John', 'Foley', 'm', '1997-01-31', 1, 'Utrecht', 'Oranjelaan', '23');
INSERT INTO Customer VALUES (60, 'jwood@something.net', 'jwood123', 'Julia', 'Wood', 'f', '1996-05-25', 1, 'Utrecht', 'Kerkstraat', '41');
INSERT INTO Customer VALUES (61, 'lleslie@exapmle.com', 'lleslie123', 'Lily', 'Leslie', 'f', '1998-04-04', 1, 'Utrecht', 'Werkerweg', '21');
INSERT INTO Customer VALUES (62, 'rharington@something.net', 'rharington123', 'Raymond', 'Harington', 'm', '1986-05-10', 1, 'Amsterdam', 'Kerkstraat', '9');
INSERT INTO Customer VALUES (63, 'gschmidt@something.net', 'gschmidt123', 'George', 'Schmidt', 'm', '2005-07-26', 1, 'Maastricht', 'Werkerweg', '3');
INSERT INTO Customer VALUES (64, 'mstewart@example.com', 'mstewart123', 'Monica', 'Stewart', 'f', '1950-11-24', 1, 'Maastricht', 'Limburgstraat', '23');
INSERT INTO Customer VALUES (65, 'jlucas@something.net', 'jlucas123', 'Janice', 'Lucas', 'f', '1998-03-13', 1, 'Eindhoven', 'Limbeekstraat', '12');
INSERT INTO Customer VALUES (66, 'pgalagher@something.net', 'pgalager123', 'Phoebe', 'Galagher', 'f', '1994-03-12', 1, 'Roermond', 'Veldstraat', '13');
INSERT INTO Customer VALUES (67, 'jpollock@example.com', 'jpollock123', 'Joey', 'Pollock', 'm', '1988-08-17', 1, 'Roermond', 'Steegstraat', '21');
INSERT INTO Customer VALUES (68, 'cyoung@example.com', 'cyoung123', 'Chandler', 'Young', 'm', '2002-07-16', 1, 'Eindhoven', 's Gravesandestraat', '17');
INSERT INTO Customer VALUES (69, 'rsmith@something.net', 'rsmith123', 'Ross', 'Smith', 'm', '1995-11-09', 1, 'Veldhoven', 'Noordstraat', '3');
INSERT INTO Customer VALUES (70, 'rcross@soemthing.net', 'rcross123', 'Rachel', 'Cross', 'f', '1942-10-03', 1, 'Tilburg', 'Werkerweg', '13');
--tour
INSERT INTO Tour VALUES (1, 'Church Tour', 15, '4h', 'Architecture', 17);
INSERT INTO Tour VALUES (2, 'Church Tour with Cheese', 15, '6h', 'Food and Architecture', 30);
INSERT INTO Tour VALUES (3, 'Church Tour with Beer', 15, '6h', 'Food and Architecture', 28);
INSERT INTO Tour VALUES (4, 'Church Tour with Cheese and Beer', 15, '8h', 'Food and Architecture', 60);
INSERT INTO Tour VALUES (5, 'Cheese Tasting', 15, '4h', 'Food', 40);
INSERT INTO Tour VALUES (6, 'Beer Tasting', 15, '4h', 'Food', 37);

--location
INSERT INTO Location VALUES (1, 'Munsterkerk', 'Church');
INSERT INTO Location VALUES (2, 'St. Christoffelkathedraal', 'Church');
INSERT INTO Location VALUES (3, 'Kapel in t Zand', 'Church');
INSERT INTO Location VALUES (4, 'Caroluskapel', 'Church');
INSERT INTO Location VALUES (5, 'Nizet', 'Cheese shop');
INSERT INTO Location VALUES (6, 'BeerRestautant', 'Beer shop');

--ticket
INSERT INTO Ticket VALUES (1, 'A', '1', 15);
INSERT INTO Ticket VALUES (2, 'C', '1', 7);
INSERT INTO Ticket VALUES (3, 'G4', '1', 50);
INSERT INTO Ticket VALUES (4, 'G6', '1', 70);
INSERT INTO Ticket VALUES (5, 'G8', '1', 90);
INSERT INTO Ticket VALUES (6, 'FB', '1', 110);

INSERT INTO Ticket VALUES (7, 'A', '2', 18);
INSERT INTO Ticket VALUES (8, 'C', '2', 9);
INSERT INTO Ticket VALUES (9, 'G4', '2', 60);
INSERT INTO Ticket VALUES (10, 'G6', '2', 80);
INSERT INTO Ticket VALUES (11, 'G8', '2', 95);
INSERT INTO Ticket VALUES (12, 'FB', '2', 100);

INSERT INTO Ticket VALUES (13, 'A', '3', 18);
INSERT INTO Ticket VALUES (14, 'C', '3', 5);
INSERT INTO Ticket VALUES (15, 'G4', '3', 58);
INSERT INTO Ticket VALUES (16, 'G6', '3', 75);
INSERT INTO Ticket VALUES (17, 'G8', '3', 100);
INSERT INTO Ticket VALUES (18, 'FB', '3', 115);

INSERT INTO Ticket VALUES (19, 'A', '4', 20);
INSERT INTO Ticket VALUES (20, 'C', '4', 10);
INSERT INTO Ticket VALUES (21, 'G4', '4', 40);
INSERT INTO Ticket VALUES (22, 'G6', '4', 65);
INSERT INTO Ticket VALUES (23, 'G6', '4', 95);
INSERT INTO Ticket VALUES (24, 'FB', '4', 110);

INSERT INTO Ticket VALUES (25, 'A', '5', 18);
INSERT INTO Ticket VALUES (26, 'G4', '5', 45);
INSERT INTO Ticket VALUES (27, 'G6', '5', 60);
INSERT INTO Ticket VALUES (28, 'G8', '5', 85); 
INSERT INTO Ticket VALUES (29, 'FB', '5', 95);

INSERT INTO Ticket VALUES (30, 'A', '6', 26);
INSERT INTO Ticket VALUES (31, 'C', '6', 9);
INSERT INTO Ticket VALUES (32, 'G4', '6', 65);
INSERT INTO Ticket VALUES (33, 'G6', '6', 85);
INSERT INTO Ticket VALUES (34, 'G8', '6', 110);
INSERT INTO Ticket VALUES (35, 'FB', '6', 120);

--satisfaction
INSERT INTO Satisfaction VALUES (1, 1, 4);
INSERT INTO Satisfaction VALUES (3, 1, 5);
INSERT INTO Satisfaction VALUES (2, 1, 3);
INSERT INTO Satisfaction VALUES (4, 4, 4);
INSERT INTO Satisfaction VALUES (7, 3, 4);
INSERT INTO Satisfaction VALUES (21, 6, 3);
INSERT INTO Satisfaction VALUES (13, 1, 1);
INSERT INTO Satisfaction VALUES (16, 3, 2);
INSERT INTO Satisfaction VALUES (21, 2, 5);
INSERT INTO Satisfaction VALUES (65, 2, 4);
INSERT INTO Satisfaction VALUES (56, 3, 3);
INSERT INTO Satisfaction VALUES (48, 4, 1);
INSERT INTO Satisfaction VALUES (20, 5, 2);
INSERT INTO Satisfaction VALUES (18, 6, 5);
INSERT INTO Satisfaction VALUES (17, 2, 2);
INSERT INTO Satisfaction VALUES (50, 4, 3);
INSERT INTO Satisfaction VALUES (5, 5, 1);
INSERT INTO Satisfaction VALUES (48, 6, 2);
INSERT INTO Satisfaction VALUES (18, 1, 3);
INSERT INTO Satisfaction VALUES (70, 5, 5);

--order
INSERT INTO FinalOrder VALUES (1, 1, '2021-03-07');
INSERT INTO FinalOrder VALUES (2, 3, '2021-03-21');
INSERT INTO FinalOrder VALUES (3, 5, '2021-03-27');
INSERT INTO FinalOrder VALUES (4, 4, '2021-03-31');
INSERT INTO FinalOrder VALUES (5, 28, '2021-03-31');
INSERT INTO FinalOrder VALUES (6, 17, '2021-03-31');
INSERT INTO FinalOrder VALUES (7, 50, '2021-03-31');
INSERT INTO FinalOrder VALUES (8, 65, '2021-04-05');
INSERT INTO FinalOrder VALUES (9, 21, '2021-04-07');
INSERT INTO FinalOrder VALUES (10, 56, '2021-04-10');
INSERT INTO FinalOrder VALUES (11, 18, '2021-04-11');
INSERT INTO FinalOrder VALUES (12, 21, '2021-04-12');
INSERT INTO FinalOrder VALUES (13, 48, '2021-04-13');
INSERT INTO FinalOrder VALUES (14, 3, '2021-04-20');
INSERT INTO FinalOrder VALUES (15, 2, '2021-04-26');
INSERT INTO FinalOrder VALUES (16, 18, '2021-04-26');
INSERT INTO FinalOrder VALUES (17, 20, '2021-07-27');
INSERT INTO FinalOrder VALUES (18, 70, '2021-04-30');

--suborder
INSERT INTO Suborder VALUES (1, 1, 2, '2021-05-03');
INSERT INTO Suborder VALUES (1, 2, 2, '2021-05-03');
INSERT INTO Suborder VALUES (2, 3, 1, '2021-05-03');
INSERT INTO Suborder VALUES (3, 1, 3, '2021-05-03');
INSERT INTO Suborder VALUES (4, 21, 1, '2021-06-07'); 
INSERT INTO Suborder VALUES (5, 35, 1, '2021-06-10');
INSERT INTO Suborder VALUES (6, 7, 2, '2021-05-11');
INSERT INTO Suborder VALUES (6, 8, 4, '2021-05-11');
INSERT INTO Suborder VALUES (7, 13, 3, '2021-05-14');
INSERT INTO Suborder VALUES (8, 1, 1, '2021-05-17');
INSERT INTO Suborder VALUES (8, 7, 1, '2021-05-25');
INSERT INTO Suborder VALUES (9, 30, 2, '2021-05-15');
INSERT INTO Suborder VALUES (10, 28, 1, '2021-06-13');
INSERT INTO Suborder VALUES (11, 30, 2, '2021-05-15');
INSERT INTO Suborder VALUES (11, 31, 1, '2021-05-15');
INSERT INTO Suborder VALUES (12, 6, 1, '2021-07-07');
INSERT INTO Suborder VALUES (13, 7, 2, '2021-05-11');
INSERT INTO Suborder VALUES (14, 25, 1, '2021-06-13'); 
INSERT INTO Suborder VALUES (15, 27, 2, '2021-06-20');
INSERT INTO Suborder VALUES (16, 3, 3, '2021-06-30');
INSERT INTO Suborder VALUES (17, 1, 2, '2021-06-30');
INSERT INTO Suborder VALUES (17, 2, 1, '2021-06-30');
INSERT INTO Suborder VALUES (18, 29, 1, '2021-07-31');



--tour_loc
INSERT INTO Tour_loc VALUES (1, 1, 1)
INSERT INTO Tour_loc VALUES (1, 2, 2)
INSERT INTO Tour_loc VALUES (1, 3, 3)
INSERT INTO Tour_loc VALUES (1, 4, 4)
INSERT INTO Tour_loc VALUES (2, 1, 1)
INSERT INTO Tour_loc VALUES (2, 2, 2)
INSERT INTO Tour_loc VALUES (2, 4, 3)
INSERT INTO Tour_loc VALUES (2, 5, 4)
INSERT INTO Tour_loc VALUES (3, 1, 1)
INSERT INTO Tour_loc VALUES (3, 3, 2)
INSERT INTO Tour_loc VALUES (3, 4, 3)
INSERT INTO Tour_loc VALUES (3, 6, 4)
INSERT INTO Tour_loc VALUES (4, 1, 1)
INSERT INTO Tour_loc VALUES (4, 2, 2)
INSERT INTO Tour_loc VALUES (4, 5, 3)
INSERT INTO Tour_loc VALUES (4, 6, 4)
INSERT INTO Tour_loc VALUES (5, 5, 1)
INSERT INTO Tour_loc VALUES (6, 6, 1)
