/*	Bryant Barron
	Final Comp 440 
	*/
	
create table location(
	location_id int identity(1,1) not null,
	loc_name varchar(25) not null,
	country varchar(50) not null,
	primary key (location_id asc)
);

create table track(
	track_id int identity(1,1) not null,
	name varchar(25),
	primary key clustered (track_id asc),
);


create table attendees(
	attendees_id int identity(1,1) not null,
	first_name varchar(16) not null,
	last_name varchar(16),
	email varchar(50), 
	primary key clustered (attendees_id asc)
);

create table address(
	address_id int identity(1,1) not null,
	address varchar(50),
	city varchar(50),
	zip varchar(10),
	state varchar(50),
	primary key clustered (address_id asc)
);

create table a_address(
	a_address_id int identity(1,1) not null,
	address_id int not null,
	attendees_id int not null,
	primary key clustered (a_address_id asc),
	foreign key (address_id) references address (address_id),
	foreign key (attendees_id) references attendees (attendees_id)
);

create table loc_address(
	loc_add_id int identity(1,1) not null,
	location_id int not null,
	address_id int not null,
	primary key clustered (loc_add_id asc), 
	foreign key (location_id) references location (location_id),
	foreign key (address_id) references address (address_id)
);

create table presenter(
	presenter_id int identity(1,1) not null,
	attendees_id int null,
	name varchar(255),
	primary key clustered (presenter_id asc),
	foreign key (attendees_id) references attendees (attendees_id)
);

create table event(
	event_id int identity(1,1) not null,
	date date not null,
	event_name varchar(max) not null,
	location_id int not null,
	primary key clustered (event_id asc),
	foreign key (location_id) references location (location_id),
);

create table class(
	class_id int identity(1,1) not null, 
	title text not null, 
	difficulty varchar(25) not null,
	primary key clustered (class_id asc), 
);

create table class_track(
	class_track_id int identity(1,1) not null,
	track_id int not null,
	location_id int not null,
	class_id int not null,
	primary key clustered (class_track_id asc),
	foreign key (track_id) references track (track_id),
	foreign key (location_id) references location (location_id),
	foreign key (class_id) references class (class_id)
);


create table class_duration(
	cd_id int identity(1,1) not null,
	class_id int not null,
	duration int not null,
	primary key clustered (cd_id asc),
	foreign key (class_id) references class (class_id)
);

create table vendor(
	vendor_id int identity(1,1) not null,
	table_number int not null check(table_number between 1 and 10),
	attendees_id int null,
	primary key clustered (vendor_id asc),
	foreign key (attendees_id) references attendees (attendees_id)
);

create table gift(
	gift_id int identity(1,1) not null,
	vendor_id int not null,
	gift_name varchar(16) not null,
	gift_description text null,
	primary key clustered (gift_id asc),
	foreign key (vendor_id) references vendor (vendor_id)
);

create table raffle(
	raffle_id int identity(1,1) not null,
	event_id int not null,
	gift_id int not null,
	attendees_id int not null,
	primary key clustered (raffle_id asc),
	foreign key (event_id) references event (event_id),
	foreign key (gift_id) references gift (gift_id),
	foreign key (attendees_id) references attendees (attendees_id)
);

create table room(
	room_id int identity(1,1) not null,
	size int not null,
	location_id int not null,
	primary key clustered (room_id asc),
	foreign key (location_id) references location (location_id)
);

create table organizer(
	organizer_id int identity(1,1) not null,
	attendees_id int not null,
	AR_id int not null,
	primary key clustered (organizer_id asc),
	foreign key (attendees_id) references attendees (attendees_id),
);

create table role(
	role_id int identity(1,1) not null,
	role_description varchar(255),
	primary key clustered (role_id asc)
);

create table attendee_role(
	AR_id int identity(1,1) not null,
	attendees_id int not null,
	role_id int not null,
	primary key clustered (AR_id asc),
	foreign key (attendees_id) references attendees (attendees_id),
	foreign key (role_id) references role (role_id)
);

create table scheduling(
	schedule_id int identity(1,1) not null,
	cd_id int not null,
	AR_id int not null,
	location_id int not null,
	primary key clustered (schedule_id asc),
	foreign key (cd_id) references class_duration (cd_id),
	foreign key (AR_id) references attendee_role (AR_id),
	foreign key (location_id) references location (location_id)
);


Insert into attendees (first_name,last_name, email) VALUES ('Amanda','Long','ALong@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Christian','Shan','CShan@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Troy','Sara','TSara@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Kaitlyn','Baker','KBaker@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Suzanne','Ma','SMa@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Anna','Jones','AJones@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Carlos','Baker','CBaker@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Tanya','Munoz','TMunoz@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Tabitha','Gill','TGill@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Alexis','Lee','ALee@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Erick','Suri','ESuri@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Marcus','Evans','MEvans@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Marcus','Clark','MClark@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Gilbert','Xu','GXu@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Paula','Rubio','PRubio@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Julian','Isla','JIsla@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Jesse','Scott','JScott@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Naomi','Sanz','NSanz@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Isabella','Lee','ILee@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Dawn','Yuan','DYuan@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Olivia','Blue','OBlue@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Emmanuel','Lopez','ELopez@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Nathan','Yang','NYang@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Gabrielle','Wood','GWood@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Katrina','Anand','KAnand@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Anthony','Jones','AJones@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Natalie','Reed','NReed@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Dakota','Ross','DRoss@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Shawn','Goel','SGoel@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Nicole','Diaz','NDiaz@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Wyatt','Davis','WDavis@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Christy','Huang','CHuang@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Sydney','Evans','SEvans@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Katherine','Baker','KBaker@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Edward','Wood','EWood@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Johnny','Rai','JRai@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Emily','Moore','EMoore@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Randy','Yang','RYang@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Roy','Ruiz','RRuiz@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Marshall','Sun','MSun@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Gabriella','Perez','GPerez@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Erika','Gill','EGill@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Kathryn','Shen','KShen@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Sharon','Yuan','SYuan@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Victoria','Lee','VLee@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Brenda','Arun','BArun@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Alex','Scott','AScott@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Yolanda','Luo','YLuo@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Martin','Vance','MVance@gmail.com');
Insert into attendees (first_name,last_name, email) VALUES ('Jeremy','Roberts','JRoberts@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Amanda','Ramirez','ARamirez@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Jada','Nelson','JNelson@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Hunter','Wright','HWright@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Sierra','Wright','SWright@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Sarah','Simmons','SSimmons@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Mandar','Samant','MSamant@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Isaiah','Rogers','IRogers@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Ian','Foster','IFoster@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Ben','Miller','BMiller@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Sarah','Barnes','SBarnes@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Casey','Martin','CMartin@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Victoria','Murphy','VMurphy@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Sydney','Rogers','SRogers@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Marvin','Hernandez','MHernandez@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Carlos','Carter','CCarter@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Rebekah','Garcia','RGarcia@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Haley','Henderson','HHenderson@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Jacob','Taylor','JTaylor@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Seth','Martin','SMartin@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Larry','Suarez','LSuarez@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Garrett','Vargas','GVargas@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Abby','Martinez','AMartinez@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Justin','Thomas','JThomas@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Evelyn','Martinez','EMartinez@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Pamela','Chapman','PChapman@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Kayla','Griffin','KGriffin@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Jill','Navarro','JNavarro@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Nathan','Walker','NWalker@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Tabitha','Moreno','TMoreno@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Mason','Sanchez','MSanchez@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Natasha','Navarro','NNavarro@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Kevin','Russell','KRussell@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Katelyn','Rivera','KRivera@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Alfredo','Ortega','AOrtega@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Andrea','Campbell','ACampbell@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Jeremy','Peterson','JPeterson@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Arianna','Ramirez','ARamirez@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Mario','Sharma','MSharma@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Adam','Collins','ACollins@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Taylor','Martin','TMartin@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Gabriel','Collins','GCollins@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Randall','Martin','RMartin@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Samantha','Jenkins','SJenkins@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Justin','Simmons','JSimmons@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Ethan','Winston','EWinston@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Hunter','Roberts','HRoberts@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Nathaniel','Murphy','NMurphy@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Charles','Wilson','CWilson@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Carrie','Alvarez','CAlvarez@yahoo.com');
Insert into attendees (first_name,last_name, email) VALUES ('Paige','Alexander','PAlexander@yahoo.com');

Insert into address (address,city, zip,state) VALUES ('10 Napa Ct.','Lebanon','2450','Oregon');
Insert into address (address,city, zip,state) VALUES ('1000 Bidweld Street','Haney','98371','British Columbia');
Insert into address (address,city, zip,state) VALUES ('1002 N. Spoonwood Court','Hervey Bay','PB12','Queensland');
Insert into address (address,city, zip,state) VALUES ('1003 Matterhorn Ct','Lebanon','21201','Oregon');
Insert into address (address,city, zip,state) VALUES ('1005 Matterhorn Ct.','Cambridge','94704','England');
Insert into address (address,city, zip,state) VALUES ('1005 Matterhorn Ct.','Mill Valley','V7L 4J4','California');
Insert into address (address,city, zip,state) VALUES ('1005 Tanager Court','Corvallis','98312','Oregon');
Insert into address (address,city, zip,state) VALUES ('1005 Tanager Court','Milsons Point','GA10','New South Wales');
Insert into address (address,city, zip,state) VALUES ('1006 Deercreek Ln','Bellflower','V9','California');
Insert into address (address,city, zip,state) VALUES ('1006 Deercreek Ln','Torrance','94704','California');
Insert into address (address,city, zip,state) VALUES ('101 Adobe Dr','Coffs Harbour','98168','New South Wales');
Insert into address (address,city, zip,state) VALUES ('101 Adobe Dr','Puyallup','SW8 4BG','Washington');
Insert into address (address,city, zip,state) VALUES ('101, avenue de la Gare','Peterborough','90401','England');
Insert into address (address,city, zip,state) VALUES ('1010 Maple','Baltimore','98312','Maryland');
Insert into address (address,city, zip,state) VALUES ('1011 Yolanda Circle','Berkeley','2036','California');
Insert into address (address,city, zip,state) VALUES ('1011 Yolanda Circle','N. Vancouver','95062','British Columbia');
Insert into address (address,city, zip,state) VALUES ('1013 Holiday Hills Dr.','Bremerton','97355','Washington');
Insert into address (address,city, zip,state) VALUES ('1013 Holiday Hills Dr.','Gateshead','94014','England');
Insert into address (address,city, zip,state) VALUES ('1015 Lynwood Drive','Metchosin','LE18','British Columbia');
Insert into address (address,city, zip,state) VALUES ('1019 Carletto Drive','Berkeley','98033','California');
Insert into address (address,city, zip,state) VALUES ('1019 Mt. Davidson Court','Burien','97045','Washington');
Insert into address (address,city, zip,state) VALUES ('1019 Mt. Davidson Court','London','91910','England');
Insert into address (address,city, zip,state) VALUES ('102 Vista Place','Santa Monica','97045','California');
Insert into address (address,city, zip,state) VALUES ('1020 Book Road','Bremerton','AS23','Washington');
Insert into address (address,city, zip,state) VALUES ('1020 Carletto Drive','Matraville','91791','New South Wales');
Insert into address (address,city, zip,state) VALUES ('1020 Carletto Drive','Santa Cruz','2777','California');
Insert into address (address,city, zip,state) VALUES ('1023 Hawkins Street','Lebanon','97205','Oregon');
Insert into address (address,city, zip,state) VALUES ('1024 Walnut Blvd.','Colma','2264','California');
Insert into address (address,city, zip,state) VALUES ('1025 Holly Oak Drive','Leeds','W1X3SE','England');
Insert into address (address,city, zip,state) VALUES ('1025 R St.','Kirkland','45202','Washington');
Insert into address (address,city, zip,state) VALUES ('1025 Yosemite Dr.','Oregon City','90505','Oregon');
Insert into address (address,city, zip,state) VALUES ('1028 Green View Court','Chula Vista','4810','California');
Insert into address (address,city, zip,state) VALUES ('1028 Green View Court','Oregon City','2055','Oregon');
Insert into address (address,city, zip,state) VALUES ('1037 Hayes Court','Stoke-on-Trent','4655','England');
Insert into address (address,city, zip,state) VALUES ('1039 Adelaide St.','West Covina','99362','California');
Insert into address (address,city, zip,state) VALUES ('104 Hilltop Dr.','Springwood','2500','New South Wales');
Insert into address (address,city, zip,state) VALUES ('104 Kaski Ln.','Portland','2444','Oregon');
Insert into address (address,city, zip,state) VALUES ('1040 Greenbush Drive','Silverwater','98225','New South Wales');
Insert into address (address,city, zip,state) VALUES ('1040 Northridge Road','London','W10 6BL','England');
Insert into address (address,city, zip,state) VALUES ('1044 San Carlos','Cincinnati','98104','Ohio');
Insert into address (address,city, zip,state) VALUES ('1045 Lolita Drive','Torrance','90012','California');
Insert into address (address,city, zip,state) VALUES ('1045 Lolita Drive','Townsville','98201','Queensland');
Insert into address (address,city, zip,state) VALUES ('1047 Las Quebradas Lane','North Sydney','94704','New South Wales');
Insert into address (address,city, zip,state) VALUES ('1048 Burwood Way','Hervey Bay','94014','Queensland');
Insert into address (address,city, zip,state) VALUES ('1048 Las Quebradas Lane','Walla Walla','V3A 4R2','Washington');
Insert into address (address,city, zip,state) VALUES ('1048 Las Quebradas Lane','Wollongong','SW6 SBY','New South Wales');
Insert into address (address,city, zip,state) VALUES ('105 Clark Creek Lane','Port Macquarie','92020','New South Wales');
Insert into address (address,city, zip,state) VALUES ('105 Woodruff Ln.','Bellingham','91502','Washington');
Insert into address (address,city, zip,state) VALUES ('1050 Creed Ave','London','98052','England');
Insert into address (address,city, zip,state) VALUES ('081, boulevard du Montparnasse','Seattle','98225','Washington');
Insert into address (address,city, zip,state) VALUES ('1 Smiling Tree Court','Los Angeles','2444','California');
Insert into address (address,city, zip,state) VALUES ('100, rue des Rosiers','Everett','98901','Washington');
Insert into address (address,city, zip,state) VALUES ('1002 N. Spoonwood Court','Berkeley','91502','California');
Insert into address (address,city, zip,state) VALUES ('1005 Fremont Street','Colma','2138','California');
Insert into address (address,city, zip,state) VALUES ('1005 Valley Oak Plaza','Langley','91364','British Columbia');
Insert into address (address,city, zip,state) VALUES ('1005 Valley Oak Plaza','London','2450','England');
Insert into address (address,city, zip,state) VALUES ('1007 Cardinet Dr.','El Cajon','98284','California');
Insert into address (address,city, zip,state) VALUES ('1008 Lydia Lane','Burbank','97034','California');
Insert into address (address,city, zip,state) VALUES ('101 Candy Rd.','Redmond','98270','Washington');
Insert into address (address,city, zip,state) VALUES ('1011 Green St.','Bellingham','MK8 8DF','Washington');
Insert into address (address,city, zip,state) VALUES ('1013 Buchanan Rd','Port Macquarie','T2P 2G8','New South Wales');
Insert into address (address,city, zip,state) VALUES ('1013 Buchanan Rd','Yakima','4810','Washington');
Insert into address (address,city, zip,state) VALUES ('1016 Park Avenue','Burbank','91502','California');
Insert into address (address,city, zip,state) VALUES ('1019 Book Road','Rhodes','OX1','New South Wales');
Insert into address (address,city, zip,state) VALUES ('1019 Buchanan Road','Woodland Hills','4810','California');
Insert into address (address,city, zip,state) VALUES ('1019 Candy Rd.','Coffs Harbour','98036','New South Wales');
Insert into address (address,city, zip,state) VALUES ('1019 Chance Drive','Sedro Woolley','3205','Washington');
Insert into address (address,city, zip,state) VALUES ('1019 Kenwal Rd.','Lake Oswego','98027','Oregon');
Insert into address (address,city, zip,state) VALUES ('1019 Pennsylvania Blvd','Marysville','3280','Washington');
Insert into address (address,city, zip,state) VALUES ('102 Vista Place','Milton Keynes','94010','England');
Insert into address (address,city, zip,state) VALUES ('10203 Acorn Avenue','Calgary','98168','Alberta');
Insert into address (address,city, zip,state) VALUES ('1023 Hawkins Street','Townsville','98501','Queensland');
Insert into address (address,city, zip,state) VALUES ('1023 Riveria Way','Burbank','PE17','California');
Insert into address (address,city, zip,state) VALUES ('1023 Riviera Way','Oxford','2113','England');
Insert into address (address,city, zip,state) VALUES ('1025 Yosemite Dr.','Townsville','AS23','Queensland');
Insert into address (address,city, zip,state) VALUES ('1026 Mt. Wilson Pl.','Lynnwood','92102','Washington');
Insert into address (address,city, zip,state) VALUES ('1026 Mt. Wilson Pl.','South Melbourne','98366','Victoria');
Insert into address (address,city, zip,state) VALUES ('1028 Indigo Ct.','Issaquah','2444','Washington');
Insert into address (address,city, zip,state) VALUES ('1028 Indigo Ct.','Warrnambool','94519','Victoria');
Insert into address (address,city, zip,state) VALUES ('1028 Royal Oak Rd.','Burlingame','V2L3W8','California');
Insert into address (address,city, zip,state) VALUES ('1029 Birchwood Dr','Burien','91364','Washington');
Insert into address (address,city, zip,state) VALUES ('1029 Birchwood Dr','Olympia','2300','Washington');
Insert into address (address,city, zip,state) VALUES ('1030 Ambush Dr.','Bury','V8Z 4N5','England');
Insert into address (address,city, zip,state) VALUES ('1032 Buena Vista','North Ryde','94014','New South Wales');
Insert into address (address,city, zip,state) VALUES ('1032 Coats Road','Stoke-on-Trent','V8P','England');
Insert into address (address,city, zip,state) VALUES ('1035 Arguello Blvd.','San Diego','V2W 1W2','California');
Insert into address (address,city, zip,state) VALUES ('1036 Mason Dr','Port Orchard','94611','Washington');
Insert into address (address,city, zip,state) VALUES ('1039 Adelaide St.','Port Macquarie','97355','New South Wales');
Insert into address (address,city, zip,state) VALUES ('104 Hilltop Dr.','Concord','1597','California');
Insert into address (address,city, zip,state) VALUES ('1040 Greenbush Drive','Newton','V3A 4R2','British Columbia');
Insert into address (address,city, zip,state) VALUES ('1040 Northridge Road','Woodland Hills','','California');
Insert into address (address,city, zip,state) VALUES ('1042 Hooftrail Way','Newcastle','','New South Wales');
Insert into address (address,city, zip,state) VALUES ('1046 Cloverleaf Circle','Shawnee','','British Columbia');
Insert into address (address,city, zip,state) VALUES ('1046 San Carlos Avenue','Colma','','California');
Insert into address (address,city, zip,state) VALUES ('1047 Las Quebradas Lane','Oak Bay','','British Columbia');
Insert into address (address,city, zip,state) VALUES ('1048 Burwood Way','Haney','','British Columbia');
Insert into address (address,city, zip,state) VALUES ('105 Woodruff Ln.','Oakland','','California');
Insert into address (address,city, zip,state) VALUES ('1050 Creed Ave','Lebanon','','Oregon');
Insert into address (address,city, zip,state) VALUES ('1050 Greenhills Circle','Lane Cove','','New South Wales');
Insert into address (address,city, zip,state) VALUES ('1050 Greenhills Circle','Langley','','British Columbia');

Insert into location (loc_name,country) VALUES ('Budapest', 'Europe/Middle East/Africa') ;
Insert into location (loc_name,country) VALUES ('Baltimore', 'Canada/US') ;
Insert into location (loc_name,country) VALUES ('Bogota', 'Latin America') ;
Insert into location (loc_name,country) VALUES ('Kyiv', 'Europe/Middle East/Africa') ;
Insert into location (loc_name,country) VALUES ('New York City', 'Canada/US') ;
Insert into location (loc_name,country) VALUES ('Brisbane', 'Asia Pacific') ;
Insert into location (loc_name,country) VALUES ('Plovdiv', 'Europe/Middle East/Africa') ;
Insert into location (loc_name,country) VALUES ('Philadelphia', 'Canada/US') ;
Insert into location (loc_name,country) VALUES ('All','All');

Insert into event (date,event_name, location_id) VALUES ('2017-05-06', 'SQLSaturday #626 - Budapest 2017', (select location_id from location where loc_name = 'Budapest'));

Insert into event (date,event_name, location_id) VALUES ('2017-05-06', 'SQLSaturday #615 - Baltimore 2017',(select location_id from location where loc_name = 'Baltimore'));

Insert into event (date,event_name, location_id) VALUES ('2017-05-13', 'SQLSaturday #608 - Bogota 2017',(select location_id from location where loc_name = 'Bogota')) ;

Insert into event (date,event_name, location_id) VALUES ('2017-05-20', 'SQLSaturday #616 - Kyiv 2017',(select location_id from location where loc_name = 'Kyiv'));

Insert into event (date,event_name, location_id) VALUES ('2017-05-20', 'SQLSaturday #588 - New York City 2017',(select location_id from location where loc_name = 'New York City'));

Insert into event (date,event_name, location_id) VALUES ('2017-05-27', 'SQLSaturday #630 - Brisbane 2017',(select location_id from location where loc_name = 'Brisbane'));

Insert into event (date,event_name, location_id) VALUES ('2017-05-27', 'SQLSaturday #599 - Plovdiv 2017',(select location_id from location where loc_name = 'Plovdiv'));

Insert into event (date,event_name, location_id) VALUES ('2017-06-03', 'SQLSaturday #638 - Philadelphia 2017',(select location_id from location where loc_name = 'Philadelphia'));

insert into role(role_description) values ('presenter');
insert into role(role_description) values ('attendee');
insert into role(role_description) values ('organizer');
insert into role(role_description) values ('volunteer');
insert into role(role_description) values ('sponsor');

/* Insert presenters into attendees since they are also attendees */
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Jeremiah','Peschka');
Insert into attendees (first_name,last_name) VALUES ('Jeremiah','Peschka');
Insert into attendees (first_name,last_name) VALUES ('Kevin','Goff');
Insert into attendees (first_name,last_name) VALUES ('Chris','Seferlis');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Mohammad','Yusuf');
Insert into attendees (first_name,last_name) VALUES ('Kennie','Pontoppidan');
Insert into attendees (first_name,last_name) VALUES ('John','Sterrett');
Insert into attendees (first_name,last_name) VALUES ('Thomas','Grohser');
Insert into attendees (first_name,last_name) VALUES ('Thomas','Grohser');
Insert into attendees (first_name,last_name) VALUES ('Joe','Chang');
Insert into attendees (first_name,last_name) VALUES ('Joe','Chang');
Insert into attendees (first_name,last_name) VALUES ('Michael','Wharton');
Insert into attendees (first_name,last_name) VALUES ('Sunil','Kadimdiwan');
Insert into attendees (first_name,last_name) VALUES ('Mike','Walsh');
Insert into attendees (first_name,last_name) VALUES ('John','Miner');
Insert into attendees (first_name,last_name) VALUES ('John','Miner');
Insert into attendees (first_name,last_name) VALUES ('James','Serra');
Insert into attendees (first_name,last_name) VALUES ('Joseph','D''Antoni');
Insert into attendees (first_name,last_name) VALUES ('Paresh','Motiwala');
Insert into attendees (first_name,last_name) VALUES ('Mickey','Stuewe');
Insert into attendees (first_name,last_name) VALUES ('John','Miner');
Insert into attendees (first_name,last_name) VALUES ('Stacia','Misner');
Insert into attendees (first_name,last_name) VALUES ('James','Serra');
Insert into attendees (first_name,last_name) VALUES ('James','Serra');
Insert into attendees (first_name,last_name) VALUES ('David','Hansen');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Kevin','Goff');
Insert into attendees (first_name,last_name) VALUES ('Mickey','Stuewe');
Insert into attendees (first_name,last_name) VALUES ('Allan','Hirt');
Insert into attendees (first_name,last_name) VALUES ('Allan','Hirt');
Insert into attendees (first_name,last_name) VALUES ('SQLSatruday','364');
Insert into attendees (first_name,last_name) VALUES ('Robert','Pearl');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('John','Flannery');
Insert into attendees (first_name,last_name) VALUES ('John','Flannery');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Edward','Pollack');
Insert into attendees (first_name,last_name) VALUES ('Mohammad','Yusuf');
Insert into attendees (first_name,last_name) VALUES ('Michael','Corey');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Robert','Pearl');
Insert into attendees (first_name,last_name) VALUES ('Gigi','Bell');
Insert into attendees (first_name,last_name) VALUES ('John','Flannery');
Insert into attendees (first_name,last_name) VALUES ('Allan','Hirt');
Insert into attendees (first_name,last_name) VALUES ('Jason','Horner');
Insert into attendees (first_name,last_name) VALUES ('Jason','Horner');
Insert into attendees (first_name,last_name) VALUES ('Edward','Pollack');
Insert into attendees (first_name,last_name) VALUES ('Edward','Pollack');
Insert into attendees (first_name,last_name) VALUES ('Brent','Ozar');
Insert into attendees (first_name,last_name) VALUES ('James','Serra');
Insert into attendees (first_name,last_name) VALUES ('Thomas','Grohser');
Insert into attendees (first_name,last_name) VALUES ('Paul','Rizza');
Insert into attendees (first_name,last_name) VALUES ('SQLSaturday','364');
Insert into attendees (first_name,last_name) VALUES ('Grant','Fritchey');
Insert into attendees (first_name,last_name) VALUES ('Sayed','Saeed');
Insert into attendees (first_name,last_name) VALUES ('John','Miner');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Paul','Rizza');
Insert into attendees (first_name,last_name) VALUES ('St�phane','Fr�chette');
Insert into attendees (first_name,last_name) VALUES ('Chris','Bell');
Insert into attendees (first_name,last_name) VALUES ('Andy','Leonard');
Insert into attendees (first_name,last_name) VALUES ('Varsham','Papikian');
Insert into attendees (first_name,last_name) VALUES ('David','Bermingham');
Insert into attendees (first_name,last_name) VALUES ('James','Serra');
Insert into attendees (first_name,last_name) VALUES ('Brent','Ozar');
Insert into attendees (first_name,last_name) VALUES ('George','Walters');
Insert into attendees (first_name,last_name) VALUES ('Allan','Hirt');
Insert into attendees (first_name,last_name) VALUES ('Kevin','Goff');
Insert into attendees (first_name,last_name) VALUES ('Jack','Corbett');
Insert into attendees (first_name,last_name) VALUES ('Kevin','Goff');
Insert into attendees (first_name,last_name) VALUES ('David','Hansen');
Insert into attendees (first_name,last_name) VALUES ('Stacia','Misner');
Insert into attendees (first_name,last_name) VALUES ('John','Flannery');
Insert into attendees (first_name,last_name) VALUES ('John','Sterrett');
Insert into attendees (first_name,last_name) VALUES ('John','Sterrett');
Insert into attendees (first_name,last_name) VALUES ('Brandon','Leach');
Insert into attendees (first_name,last_name) VALUES ('Brandon','Leach');
Insert into attendees (first_name,last_name) VALUES ('Allan','Hirt');
Insert into attendees (first_name,last_name) VALUES ('Jeremiah','Peschka');
Insert into attendees (first_name,last_name) VALUES ('SQLSaturday','364');
Insert into attendees (first_name,last_name) VALUES ('SQLSaturday','364');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('James','Serra');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Hilary','Cotter');
Insert into attendees (first_name,last_name) VALUES ('Stacia','Misner');
Insert into attendees (first_name,last_name) VALUES ('Jason','Brimhall');
Insert into attendees (first_name,last_name) VALUES ('Mike','Walsh');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Kevin','Schenega');
Insert into attendees (first_name,last_name) VALUES ('Chris','Bell');
Insert into attendees (first_name,last_name) VALUES ('Kennie','Pontoppidan');
Insert into attendees (first_name,last_name) VALUES ('Todd','Chittenden');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Michael','Wharton');
Insert into attendees (first_name,last_name) VALUES ('Jason','Horner');
Insert into attendees (first_name,last_name) VALUES ('Chris','Bell');
Insert into attendees (first_name,last_name) VALUES ('Edward','Pollack');
Insert into attendees (first_name,last_name) VALUES ('SQLSaturday','364');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Mike','Hillwig');
Insert into attendees (first_name,last_name) VALUES ('Stacia','Misner');
Insert into attendees (first_name,last_name) VALUES ('SQLSaturday','364');
Insert into attendees (first_name,last_name) VALUES ('Hilary','Cotter');
Insert into attendees (first_name,last_name) VALUES ('Jason','Brimhall');
Insert into attendees (first_name,last_name) VALUES ('Hilary','Cotter');
Insert into attendees (first_name,last_name) VALUES ('Hilary','Cotter');
Insert into attendees (first_name,last_name) VALUES ('St�phane','Fr�chette');
Insert into attendees (first_name,last_name) VALUES ('Paul','Rizza');
Insert into attendees (first_name,last_name) VALUES ('Allan','Hirt');
Insert into attendees (first_name,last_name) VALUES ('Kennie','Pontoppidan');
Insert into attendees (first_name,last_name) VALUES ('Kevin','Goff');
Insert into attendees (first_name,last_name) VALUES ('George','Walters');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('George','Walters');
Insert into attendees (first_name,last_name) VALUES ('George','Walters');
Insert into attendees (first_name,last_name) VALUES ('David','Hansen');
Insert into attendees (first_name,last_name) VALUES ('Jason','Brimhall');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Steve','Simon');
Insert into attendees (first_name,last_name) VALUES ('Kevin','Goff');
Insert into attendees (first_name,last_name) VALUES ('Thomas','Grohser');
Insert into attendees (first_name,last_name) VALUES ('Brandon','Leach');
Insert into attendees (first_name,last_name) VALUES ('Andy','Leonard');
Insert into attendees (first_name,last_name) VALUES ('Carl','Berglund');
Insert into attendees (first_name,last_name) VALUES ('Hilary','Cotter');
Insert into attendees (first_name,last_name) VALUES ('John','Miner');
Insert into attendees (first_name,last_name) VALUES ('Melissa','Riley');
Insert into attendees (first_name,last_name) VALUES ('Adam','Jorgensen');
Insert into attendees (first_name,last_name) VALUES ('Dennis','Messina');
Insert into attendees (first_name,last_name) VALUES ('Richie','Rump');
Insert into attendees (first_name,last_name) VALUES ('Chris','Bell');
Insert into attendees (first_name,last_name) VALUES ('Jack','Corbett');
Insert into attendees (first_name,last_name) VALUES ('Aaron','Bertrand');
Insert into attendees (first_name,last_name) VALUES ('Greg','Moore');
Insert into attendees (first_name,last_name) VALUES ('Aaron','Bertrand');
Insert into attendees (first_name,last_name) VALUES ('Kevin','Goff');
Insert into attendees (first_name,last_name) VALUES ('Grant','Fritchey');
Insert into attendees (first_name,last_name) VALUES ('Jason','Brimhall');
Insert into attendees (first_name,last_name) VALUES ('Brent','Ozar');
Insert into attendees (first_name,last_name) VALUES ('David','Bermingham');
Insert into attendees (first_name,last_name) VALUES ('James','Serra');
Insert into attendees (first_name,last_name) VALUES ('James','Serra');
Insert into attendees (first_name,last_name) VALUES ('Kevin','Goff');
Insert into attendees (first_name,last_name) VALUES ('Paresh','Motiwala');
Insert into attendees (first_name,last_name) VALUES ('Kevin','Goff');
Insert into attendees (first_name,last_name) VALUES ('Mike','Walsh');

/* was not provided track names so I created my own */
insert into track (name) values ('data');
insert into track (name) values ('improvement');
insert into track (name) values ('relax');
insert into track (name) values ('sql');
insert into track (name) values ('bi');

insert into class (title, difficulty) values ('A dive into Data Quality Services' ,'Intermediate');
insert into class (title, difficulty) values ('A Dynamic World Demands Dynamic SQL' ,'Intermediate');
insert into class (title, difficulty) values ('A Dynamic World Demands Dynamic SQL' ,'Intermediate');
insert into class (title, difficulty) values ('Absolute Introductory Session on SQL Server 2014 In-Memory Optimized Databases (Hekaton)' ,'Beginner');
insert into class (title, difficulty) values ('AlwaysOn: Improve reliability and reporting performance with one cool tech' ,'Beginner');
insert into class (title, difficulty) values ('An introduction to Data Mining' ,'Intermediate');
insert into class (title, difficulty) values ('An Introduction to Database Design' ,'Beginner');
insert into class (title, difficulty) values ('Autogenerating a process data warehouse' ,'Advanced');
insert into class (title, difficulty) values ('Automate your daily checklist with PBM and CMS' ,'Intermediate');
insert into class (title, difficulty) values ('Automated Installing and Configuration of SQL2014/SQL2012 AlwaysOn Across Multiple Datacenters' ,'Intermediate');
insert into class (title, difficulty) values ('Automated Installing and Configuration of SQL2014/SQL2012 AlwaysOn Across Multiple Datacenters' ,'Intermediate');
insert into class (title, difficulty) values ('Automating Execution Plan Analysis' ,'Advanced');
insert into class (title, difficulty) values ('Automating Execution Plan Analysis' ,'Advanced');
insert into class (title, difficulty) values ('Automating SQL Server using PowerShell' ,'Intermediate');
insert into class (title, difficulty) values ('Balanced Scorecards using SSRS' ,'Intermediate');
insert into class (title, difficulty) values ('Baselines and Performance Monitoring with PAL' ,'Beginner');
insert into class (title, difficulty) values ('Basic Database Design' ,'Beginner');
insert into class (title, difficulty) values ('Basic Database Programming' ,'Beginner');
insert into class (title, difficulty) values ('Become a BI Independent Consultant!' ,'Beginner');
insert into class (title, difficulty) values ('Becoming a Top DBA--Learning Automation in SQL Server' ,'Beginner');
insert into class (title, difficulty) values ('Best Practices Document' ,'Intermediate');
insert into class (title, difficulty) values ('Best Practices for Efficient SSRS Report Creation' ,'Beginner');
insert into class (title, difficulty) values ('Biggest Loser: Database Edition' ,'Intermediate');
insert into class (title, difficulty) values ('Building a BI Solution in the Cloud' ,'Intermediate');
insert into class (title, difficulty) values ('Building an Effective Data Warehouse Architecture' ,'Beginner');
insert into class (title, difficulty) values ('Building an Effective Data Warehouse Architecture with the cloud and MPP' ,'Beginner');
insert into class (title, difficulty) values ('Bulk load and minimal logged inserts' ,'Advanced');
insert into class (title, difficulty) values ('Business Analytics with SQL Server & Power Map:Everything you want to know but were afraid to ask' ,'Intermediate');
insert into class (title, difficulty) values ('Challenges to designing financial warehouses, lessons learnt' ,'Intermediate');
insert into class (title, difficulty) values ('Change Data Capture in SQL Server 2008/2012' ,'Intermediate');
insert into class (title, difficulty) values ('Changing Your Habits to Improve the Performance of Your T-SQL' ,'Beginner');
insert into class (title, difficulty) values ('Clusters Your Way: #SANLess Clusters for Physical, Virtual, and Cloud Environments' ,'Beginner');
insert into class (title, difficulty) values ('Clusters Your Way: #SANLess Clusters for Physical, Virtual, and Cloud Environments' ,'Non-Technical');
insert into class (title, difficulty) values ('Coffee Break' ,'Non-Technical');
insert into class (title, difficulty) values ('Creating A Performance Health Repository - using MDW' ,'Beginner');
insert into class (title, difficulty) values ('Creating efficient and effective SSRS BI Solutions' ,'Intermediate');
insert into class (title, difficulty) values ('Creating efficient and effective SSRS BI Solutions' ,'Intermediate');
insert into class (title, difficulty) values ('Data Partitioning' ,'Intermediate');
insert into class (title, difficulty) values ('Data Tier Application Testing with NUnit and Distributed Replay' ,'Intermediate');
insert into class (title, difficulty) values ('Database design for mere developers' ,'Intermediate');
insert into class (title, difficulty) values ('Database design for mere developers' ,'Intermediate');
insert into class (title, difficulty) values ('Database Design: Solving Problems Before they Start!' ,'Beginner');
insert into class (title, difficulty) values ('Database Modeling and Design' ,'Intermediate');
insert into class (title, difficulty) values ('Database Virtualization and Drinking out of the Fire Hose' ,'Intermediate');
insert into class (title, difficulty) values ('DAX and the tabular model' ,'Intermediate');
insert into class (title, difficulty) values ('DBA FOR DUMMIES' ,'Beginner');
insert into class (title, difficulty) values ('Dealing With Difficult People' ,'Beginner');
insert into class (title, difficulty) values ('Development Lifecycle with SQL Server Data Tools and DACFx' ,'Intermediate');
insert into class (title, difficulty) values ('Did You Vote Today? A DBAs Guide to Cluster Quorum' ,'Advanced');
insert into class (title, difficulty) values ('Dimensional Modeling Design Patterns: Beyond Basics' ,'Intermediate');
insert into class (title, difficulty) values ('Dimensional Modeling Design Patterns: Beyond Basics' ,'Intermediate');
insert into class (title, difficulty) values ('Diving Into Query Execution Plans' ,'Intermediate');
insert into class (title, difficulty) values ('Dynamic SQL: Writing Efficient Queries on the Fly' ,'Beginner');
insert into class (title, difficulty) values ('Easy Architecture Design for HA and DR' ,'Intermediate');
insert into class (title, difficulty) values ('Enhancing your career: Building your personal brand' ,'Beginner');
insert into class (title, difficulty) values ('Establishing a SLA' ,'Intermediate');
insert into class (title, difficulty) values ('ETL not ELT! Common mistakes and misconceptions about SSIS' ,'Advanced');
insert into class (title, difficulty) values ('Event Kickoff and Networking' ,'Non-Technical');
insert into class (title, difficulty) values ('Execution Plans: What Can You Do With Them?' ,'Intermediate');
insert into class (title, difficulty) values ('Faster, Better Decisions with Self Service Business Analytics' ,'Intermediate');
insert into class (title, difficulty) values ('Full Text Indexing Basics' ,'Beginner');
insert into class (title, difficulty) values ('Get your Mining Model Predictions out to all' ,'Intermediate');
insert into class (title, difficulty) values ('Getting a job with Microsoft' ,'Non-Technical');
insert into class (title, difficulty) values ('Graph Databases for SQL Server Professionals' ,'Intermediate');
insert into class (title, difficulty) values ('Hacking Expos� - Using SSL to Protect SQL Connections' ,'Intermediate');
insert into class (title, difficulty) values ('Hacking the SSIS 2012 Catalog' ,'Beginner');
insert into class (title, difficulty) values ('Hidden in plain sight: master your tools' ,'Intermediate');
insert into class (title, difficulty) values ('Highly Available SQL Server in Windows Azure IaaS' ,'Intermediate');
insert into class (title, difficulty) values ('How to Make a LOT More Money as a Consultant' ,'Beginner');
insert into class (title, difficulty) values ('How to Think Like the Engine' ,'Intermediate');
insert into class (title, difficulty) values ('Hybrid Cloud Scenarios with SQL Server 2014' ,'Intermediate');
insert into class (title, difficulty) values ('Hybrid Solutions: The Future of SQL Server Disaster Recovery' ,'Intermediate');
insert into class (title, difficulty) values ('Implementing Data Warehouse Patterns with the Microsoft BI Tools' ,'Intermediate');
insert into class (title, difficulty) values ('Inroduction to Triggers' ,'Beginner');
insert into class (title, difficulty) values ('Integrating Reporting Services with SharePoint' ,'Intermediate');
insert into class (title, difficulty) values ('Integration Services (SSIS) for the DBA' ,'Intermediate');
insert into class (title, difficulty) values ('Introducing Power BI' ,'Beginner');
insert into class (title, difficulty) values ('Introduction to Database Recovery' ,'Beginner');
insert into class (title, difficulty) values ('Introduction to High Availability with SQL Server' ,'Beginner');
insert into class (title, difficulty) values ('Introduction to Powershell for DBA''s' ,'Beginner');
insert into class (title, difficulty) values ('Introduction to SQL Server - Part 1' ,'Beginner');
insert into class (title, difficulty) values ('Introduction to SQL Server - Part 2' ,'Beginner');
insert into class (title, difficulty) values ('Is That A Failover Cluster On Your Laptop/Desktop?' ,'Intermediate');
insert into class (title, difficulty) values ('Leaving the Windows Open' ,'Intermediate');
insert into class (title, difficulty) values ('Lunch Break' ,'Non-Technical');
insert into class (title, difficulty) values ('Lunchtime Keynote' ,'Non-Technical');
insert into class (title, difficulty) values ('Master Data Services Best Practices' ,'Intermediate');
insert into class (title, difficulty) values ('Master Data Services Disaster Recovery' ,'Intermediate');
insert into class (title, difficulty) values ('Mind your language!! Cursors are a dirty word' ,'Intermediate');
insert into class (title, difficulty) values ('Modern Data Warehousing' ,'Beginner');
insert into class (title, difficulty) values ('Monitoring Server health via Reporting Services dashboards' ,'Intermediate');
insert into class (title, difficulty) values ('Monitoring SQL Server using Extended Events' ,'Beginner');
insert into class (title, difficulty) values ('Multidimensional vs Tabular - May the Best Model Win' ,'Intermediate');
insert into class (title, difficulty) values ('Murder They Wrote' ,'Intermediate');
insert into class (title, difficulty) values ('Never Have to Say "Mayday!!!" Again' ,'Beginner');
insert into class (title, difficulty) values ('Now you see it! Now you don�t! Conjuring many reports utilizing only one SSRS report.' ,'Intermediate');
insert into class (title, difficulty) values ('Optimal Infrastructure Strategies for Cisco UCS, Nexus and SQL Server' ,'Non-Technical');
insert into class (title, difficulty) values ('Optimizing Protected Indexes' ,'Intermediate');
insert into class (title, difficulty) values ('Partitioning as a design pattern' ,'Advanced');
insert into class (title, difficulty) values ('Power BI Components in Microsoft''s Self-Service BI Suite' ,'Beginner');
insert into class (title, difficulty) values ('Power to the people!!' ,'Intermediate');
insert into class (title, difficulty) values ('PowerShell Basics for SQLServer' ,'Beginner');
insert into class (title, difficulty) values ('PowerShell for the Reluctant DBA / Developer' ,'Beginner');
insert into class (title, difficulty) values ('Prevent Recovery Amnesia � Forget the Backups' ,'Beginner');
insert into class (title, difficulty) values ('Query Optimization Crash Course' ,'Beginner');
insert into class (title, difficulty) values ('Raffle' ,'Non-Technical');
insert into class (title, difficulty) values ('Rapid Application Development with Master Data Services' ,'Intermediate');
insert into class (title, difficulty) values ('Recovery and Backup for Beginners' ,'Beginner');
insert into class (title, difficulty) values ('Reduce, Reuse, Recycle: Automating Your BI Framework' ,'Intermediate');
insert into class (title, difficulty) values ('Registrations' ,'Non-Technical');
insert into class (title, difficulty) values ('Replicaton Technologies' ,'Advanced');
insert into class (title, difficulty) values ('Reporting Services for Mere DBAs' ,'Intermediate');
insert into class (title, difficulty) values ('Scaling with SQL Server Service Broker' ,'Advanced');
insert into class (title, difficulty) values ('Scaling with SQL Server Service Broker' ,'Advanced');
insert into class (title, difficulty) values ('Self-Service Data Integration with Power Query' ,'Beginner');
insert into class (title, difficulty) values ('Shortcuts to Building SSIS in .Net' ,'Beginner');
insert into class (title, difficulty) values ('So You Want To Be A Consultant?' ,'Beginner');
insert into class (title, difficulty) values ('SQL anti patterns' ,'Advanced');
insert into class (title, difficulty) values ('SQL Server 2012/2014 Columnstore index' ,'Intermediate');
insert into class (title, difficulty) values ('SQL Server 2012/2014 Performance Tuning All Up' ,'Intermediate');
insert into class (title, difficulty) values ('SQL Server 2014 Data Access Layers' ,'Intermediate');
insert into class (title, difficulty) values ('SQL Server 2014 New Features' ,'Intermediate');
insert into class (title, difficulty) values ('SQL Server AlwaysOn Availability Groups' ,'Beginner');
insert into class (title, difficulty) values ('SQL Server and the Cloud' ,'Beginner');
insert into class (title, difficulty) values ('SQL Server Compression and what it can do for you' ,'Advanced');
insert into class (title, difficulty) values ('SQL Server Reporting Services 2014 on Steroids!!' ,'Intermediate');
insert into class (title, difficulty) values ('SQL Server Reporting Services Best Practices' ,'Intermediate');
insert into class (title, difficulty) values ('SQL Server Reporting Services, attendees choose' ,'Intermediate');
insert into class (title, difficulty) values ('SQL Server Storage Engine under the hood' ,'Intermediate');
insert into class (title, difficulty) values ('SQL Server Storage internals: Looking under the hood.' ,'Advanced');
insert into class (title, difficulty) values ('SSIS 2014 Data Flow Tuning Tips and Tricks' ,'Beginner');
insert into class (title, difficulty) values ('Standalone to High-Availability Clusters over Lunch�with Time to Spare' ,'Intermediate');
insert into class (title, difficulty) values ('Stress testing SQL Server' ,'Advanced');
insert into class (title, difficulty) values ('Table partitioning for Azure SQL Databases' ,'Beginner');
insert into class (title, difficulty) values ('Testing' ,'Beginner');
insert into class (title, difficulty) values ('The future of the data professional' ,'Beginner');
insert into class (title, difficulty) values ('The Quest for the Golden Record:MDM Best Practices' ,'Beginner');
insert into class (title, difficulty) values ('The Quest to Find Bad Data With Data Profiling' ,'Intermediate');
insert into class (title, difficulty) values ('The Spy Who Loathed Me - An Intro to SQL Security' ,'Beginner');
insert into class (title, difficulty) values ('Tired of the CRUD? Automate it!' ,'Intermediate');
insert into class (title, difficulty) values ('Top 5 Ways to Improve Your triggers' ,'Intermediate');
insert into class (title, difficulty) values ('Tricks that have saved my bacon' ,'Beginner');
insert into class (title, difficulty) values ('T-SQL : Bad Habits & Best Practices' ,'Beginner');
insert into class (title, difficulty) values ('T-SQL for Application Developers - Attendees chose' ,'Intermediate');
insert into class (title, difficulty) values ('Tune Queries By Fixing Bad Parameter Sniffing' ,'Intermediate');
insert into class (title, difficulty) values ('Using Extended Events in SQL Server' ,'Advanced');
insert into class (title, difficulty) values ('Watch Brent Tune Queries' ,'Intermediate');
insert into class (title, difficulty) values ('What every SQL Server DBA needs to know about Windows Server 10 Technical Preview' ,'Intermediate');
insert into class (title, difficulty) values ('What exactly is big data and why should I care?' ,'Beginner');
insert into class (title, difficulty) values ('What is it like to work for Microsoft?' ,'Beginner');
insert into class (title, difficulty) values ('What�s new in SQL Server Integration Services 2012' ,'Intermediate');
insert into class (title, difficulty) values ('Why do we shun using tools for DBA job?' ,'Intermediate');
insert into class (title, difficulty) values ('Why OLAP? Building SSAS cubes and benefits of OLAP' ,'Intermediate');
insert into class (title, difficulty) values ('You''re Doing It Wrong!!' ,'Intermediate');

/* This is not in normal form sadly */
insert into class_track (class_id, location_id, track_id) values ('1' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('2' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('3' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('4' ,'1' ,'4');
insert into class_track (class_id, location_id, track_id) values ('5' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('6' ,'4' ,'1');
insert into class_track (class_id, location_id, track_id) values ('7' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('8' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('9' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('10' ,'5' ,'4');
insert into class_track (class_id, location_id, track_id) values ('11' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('12' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('13' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('14' ,'5' ,'4');
insert into class_track (class_id, location_id, track_id) values ('15' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('16' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('17' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('18' ,'4' ,'1');
insert into class_track (class_id, location_id, track_id) values ('19' ,'1' ,'5');
insert into class_track (class_id, location_id, track_id) values ('20' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('21' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('22' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('23' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('24' ,'1' ,'5');
insert into class_track (class_id, location_id, track_id) values ('25' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('26' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('27' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('28' ,'5' ,'4');
insert into class_track (class_id, location_id, track_id) values ('29' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('30' ,'5' ,'4');
insert into class_track (class_id, location_id, track_id) values ('31' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('32' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('33' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('34' ,'1' ,'3');
insert into class_track (class_id, location_id, track_id) values ('35' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('36' ,'4' ,'5');
insert into class_track (class_id, location_id, track_id) values ('37' ,'5' ,'5');
insert into class_track (class_id, location_id, track_id) values ('38' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('39' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('40' ,'1' ,'1');
insert into class_track (class_id, location_id, track_id) values ('41' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('42' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('43' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('44' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('45' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('46' ,'1' ,'1');
insert into class_track (class_id, location_id, track_id) values ('47' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('48' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('49' ,'4' ,'1');
insert into class_track (class_id, location_id, track_id) values ('50' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('51' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('52' ,'5' ,'4');
insert into class_track (class_id, location_id, track_id) values ('53' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('54' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('55' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('56' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('57' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('58' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('59' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('60' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('61' ,'1' ,'1');
insert into class_track (class_id, location_id, track_id) values ('62' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('63' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('64' ,'5' ,'4');
insert into class_track (class_id, location_id, track_id) values ('65' ,'5' ,'4');
insert into class_track (class_id, location_id, track_id) values ('66' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('67' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('68' ,'5' ,'4');
insert into class_track (class_id, location_id, track_id) values ('69' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('70' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('71' ,'1' ,'4');
insert into class_track (class_id, location_id, track_id) values ('72' ,'1' ,'4');
insert into class_track (class_id, location_id, track_id) values ('73' ,'1' ,'1');
insert into class_track (class_id, location_id, track_id) values ('74' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('75' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('76' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('77' ,'5' ,'5');
insert into class_track (class_id, location_id, track_id) values ('78' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('79' ,'5' ,'4');
insert into class_track (class_id, location_id, track_id) values ('80' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('81' ,'5' ,'4');
insert into class_track (class_id, location_id, track_id) values ('82' ,'5' ,'4');
insert into class_track (class_id, location_id, track_id) values ('83' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('84' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('85' ,'5' ,'3');
insert into class_track (class_id, location_id, track_id) values ('86' ,'5' ,'3');
insert into class_track (class_id, location_id, track_id) values ('87' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('88' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('89' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('90' ,'5' ,'1');
insert into class_track (class_id, location_id, track_id) values ('91' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('92' ,'5' ,'4');
insert into class_track (class_id, location_id, track_id) values ('93' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('94' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('95' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('96' ,'5' ,'2');
insert into class_track (class_id, location_id, track_id) values ('97' ,'1' ,'4');
insert into class_track (class_id, location_id, track_id) values ('98' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('99' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('100' ,'5' ,'5');
insert into class_track (class_id, location_id, track_id) values ('101' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('102' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('103' ,'4' ,'1');
insert into class_track (class_id, location_id, track_id) values ('104' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('105' ,'4' ,'1');
insert into class_track (class_id, location_id, track_id) values ('106' ,'9' ,'3');
insert into class_track (class_id, location_id, track_id) values ('107' ,'4' ,'1');
insert into class_track (class_id, location_id, track_id) values ('108' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('109' ,'4' ,'5');
insert into class_track (class_id, location_id, track_id) values ('110' ,'9' ,'3');
insert into class_track (class_id, location_id, track_id) values ('111' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('112' ,'4' ,'1');
insert into class_track (class_id, location_id, track_id) values ('113' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('114' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('115' ,'4' ,'1');
insert into class_track (class_id, location_id, track_id) values ('116' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('117' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('118' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('119' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('120' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('121' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('122' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('123' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('124' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('125' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('126' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('127' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('128' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('129' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('130' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('131' ,'4' ,'1');
insert into class_track (class_id, location_id, track_id) values ('132' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('133' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('134' ,'4' ,'4');
insert into class_track (class_id, location_id, track_id) values ('135' ,'4' ,'2');
insert into class_track (class_id, location_id, track_id) values ('136' ,'4' ,'1');
insert into class_track (class_id, location_id, track_id) values ('137' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('138' ,'1' ,'1');
insert into class_track (class_id, location_id, track_id) values ('139' ,'1' ,'4');
insert into class_track (class_id, location_id, track_id) values ('140' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('141' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('142' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('143' ,'1' ,'4');
insert into class_track (class_id, location_id, track_id) values ('144' ,'1' ,'4');
insert into class_track (class_id, location_id, track_id) values ('145' ,'1' ,'1');
insert into class_track (class_id, location_id, track_id) values ('146' ,'1' ,'4');
insert into class_track (class_id, location_id, track_id) values ('147' ,'1' ,'1');
insert into class_track (class_id, location_id, track_id) values ('148' ,'1' ,'4');
insert into class_track (class_id, location_id, track_id) values ('149' ,'1' ,'1');
insert into class_track (class_id, location_id, track_id) values ('150' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('151' ,'1' ,'4');
insert into class_track (class_id, location_id, track_id) values ('152' ,'1' ,'1');
insert into class_track (class_id, location_id, track_id) values ('153' ,'1' ,'2');
insert into class_track (class_id, location_id, track_id) values ('154' ,'1' ,'2');
