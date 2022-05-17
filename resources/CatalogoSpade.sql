BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Categoria" (
	"ID"	INTEGER,
	"NomeCategoria"	VARCHAR(50) NOT NULL UNIQUE,
	"Descrizione"	TEXT NOT NULL,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Arma" (
	"ID"	INTEGER,
	"Nome"	VARCHAR(40) NOT NULL,
	"Potenza"	REAL NOT NULL,
	"Peso"	REAL NOT NULL,
	"Livello"	INTEGER NOT NULL DEFAULT 0,
	"TipoDanno"	VARCHAR(20) NOT NULL,
	"Stabilita"	REAL,
	"RiduzioneDanno"	INTEGER,
	"Scaling"	VARCHAR(20),
	"NomeCategoria"	VARCHAR(50),
	FOREIGN KEY("NomeCategoria") REFERENCES "Categoria"("NomeCategoria") ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Abilita" (
	"ID"	INTEGER,
	"Nome"	VARCHAR(40) NOT NULL UNIQUE,
	"Descrizione"	VARCHAR(200) NOT NULL,
	"TipologiaArma"	VARCHAR(20) NOT NULL,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Munizioni" (
	"ID"	INTEGER,
	"Nome"	VARCHAR(40) NOT NULL UNIQUE,
	"Descrizione"	VARCHAR(120) NOT NULL,
	"Danno"	REAL NOT NULL,
	"TipoDanno"	VARCHAR(20) NOT NULL,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ArmaDistanza" (
	"ID"	INTEGER,
	"Nome"	VARCHAR(30) NOT NULL UNIQUE,
	"Descrizione"	VARCHAR(200) NOT NULL,
	"Gittata"	INTEGER NOT NULL,
	"Capacita Fuoco"	INTEGER NOT NULL,
	"NomeMunizioni"	VARCHAR(20),
	"NomeAbilita"	VARCHAR(20),
	"NomeCategoria"	VARCHAR(20),
	FOREIGN KEY("NomeCategoria") REFERENCES "Categoria"("NomeCategoria") ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY("NomeAbilita") REFERENCES "Abilita"("Nome") ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY("NomeMunizioni") REFERENCES "Munizioni"("Nome") ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ArmaBianca" (
	"ID"	INTEGER,
	"Nome"	VARCHAR(20) NOT NULL UNIQUE,
	"Descrizione"	VARCHAR(200) NOT NULL,
	"NomeAbilita"	VARCHAR(20),
	"NomeCategoria"	VARCHAR(20),
	FOREIGN KEY("NomeAbilita") REFERENCES "Abilita"("Nome") ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY("NomeCategoria") REFERENCES "Categoria"("NomeCategoria") ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Scudi" (
	"ID"	INTEGER,
	"Nome"	VARCHAR(20) NOT NULL UNIQUE,
	"Descrizione"	VARCHAR(200) NOT NULL,
	"NomeAbilita"	VARCHAR(20),
	"NomeCategoria"	VARCHAR(20),
	FOREIGN KEY("NomeAbilita") REFERENCES "Abilita"("Nome") ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY("NomeCategoria") REFERENCES "Categoria"("NomeCategoria") ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY("ID" AUTOINCREMENT)
);
INSERT INTO "Categoria" ("ID","NomeCategoria","Descrizione") VALUES (1,'arma bianca','ossia le armi con le quali puoi attaccare corpo a corpo'),
 (2,'distanza ','ossia tutte le armi in grado di infliggere danni da lontano'),
 (3,'scudi','ossia le armi improntate principalmente sulla difesa');
INSERT INTO "Arma" ("ID","Nome","Potenza","Peso","Livello","TipoDanno","Stabilita","RiduzioneDanno","Scaling","NomeCategoria") VALUES (1,'scudo a torre',80.0,13.0,0,'contundente',86.0,100,'Dstr','scudi'),
 (2,'pugnale',140.0,1.5,0,'taglio',26.0,45,'Bdex;Estr','arma bianca'),
 (3,'avelyn',64.0,7.5,0,'fisico',NULL,NULL,NULL,'distanza ');
INSERT INTO "Abilita" ("ID","Nome","Descrizione","TipologiaArma") VALUES (1,'concentrazione','Assume a stance from which to execute a lunging slash or a deflecting parry','arma bianca'),
 (2,'schivata','Instantly step behind or around the side of foes. Especially effective when locked on to target.','arma bianca'),
 (3,'parata','Deflect an attack when timed properly and follow up with a critical hit. Works while equipped in either hand.','scudi'),
 (4,'parata magica','Repel an attack at the right time to follow up with a critical hit. Works while equipped in either hand. Also deflects spells.','scudi'),
 (5,'attacco con scudo','Without lowering your guard, strike the enemy with the shield to knock them back or stagger them. Works while equipped in either hand.','scudi'),
 (6,'carica','Hold weapon at waist and charge at foe. Only, it is important to have good footing','arma bianca'),
 (7,'spallata','Lunge into a shoulder tackle pushing back enemies to create distance.Deals no damage and serves as a kind of kick.','distanza'),
 (8,'raffica','Swiftly nocks arrows with finesse after drawing the bow, allowing for consecutive shots.Speed of shots roughly doubles but damage is likewise halfed. Costs minor FP per shot.','distanza'),
 (9,'perforazione','Pull the arrow even further back for a more powerful shot that can also pierce shields.','distanza');
INSERT INTO "Munizioni" ("ID","Nome","Descrizione","Danno","TipoDanno") VALUES (1,'dardo normale','Un normale dardo da scagliare con una balestra.',48.0,'fisico'),
 (2,'freccia normale','Una normale freccia da scagliare con un arco.',45.0,'fisico'),
 (3,'frecci pesante da ammazza draghi','Freccia pesante adatta a colpire la carne umana.',90.0,'fisico'),
 (4,'dardo elettrico ','Dardo che infligge danno elettrico.',110.0,'elementare'),
 (5,'freccia oscura','Freccia che infligge danno oscuro.',65.0,'elementare'),
 (6,'freccia grande di Millwood','Munizioni per Archi Grandi.',97.0,'elementare');
INSERT INTO "ArmaDistanza" ("ID","Nome","Descrizione","Gittata","Capacita Fuoco","NomeMunizioni","NomeAbilita","NomeCategoria") VALUES (1,'avelyn','Repeating crossbow cherished by the weapon craftsman Eidas. Its elaborate design makes it closer to a work of art than a weapon.',50,3,'dardo normale','spallata','distanza '),
 (2,'arco pesante da ammazza draghi','Bow of the Dragonslayers, led by Hawkeye Gough, one of Gwyn''''s Four Knights.',50,1,'frecci pesante da ammazza draghi','perforazione','distanza '),
 (3,'arco composito','Composite short bow emphasizing power. Its size allows for quick shots.',42,5,'freccia normale','raffica','distanza ');
INSERT INTO "ArmaBianca" ("ID","Nome","Descrizione","NomeAbilita","NomeCategoria") VALUES (1,'pugnale','This standard small dagger has only a modest attack but can be jabbed in rapid succession, and is effective in critical hits such as after a parry or when stabbing in the back.','schivata','arma bianca'),
 (2,'forcone','Standard spear used commonly by soldiers. Long reach, and can be used with shield up. Effective against hard exteriors, and hits for high damage at the right moment of an enemy''''s swing.','carica','arma bianca'),
 (3,'uchigatana','Katana forged in an Eastern land. Known for its brisk slashing motions.','concentrazione','arma bianca');
INSERT INTO "Scudi" ("ID","Nome","Descrizione","NomeAbilita","NomeCategoria") VALUES (1,'scudo a torre','Metal Greatshield. Used by the Knight Berenike, known for his heavy armour','attacco con scudo','scudi'),
 (2,'scudo del sole','Shield of Solaire of Astora, Knight of Sunlight. Decorated with a holy symbol.','parata','scudi'),
 (3,'scudo germoglio sacro','A treasured antique of the Way of White, known to some as the Sorcerer''''s Bane.','parata magica','scudi');
COMMIT;
