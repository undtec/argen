DROP TABLE IF EXISTS t_DBVersion;
CREATE TABLE t_DBVersion  (
   DBVersion_ID INTEGER PRIMARY KEY AUTOINCREMENT,
   DBDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   DBVersionNumber INTEGER
);

DROP TABLE IF EXISTS t_Project;
CREATE TABLE t_Project (
	 Project_ID INTEGER PRIMARY KEY AUTOINCREMENT,
	 ProjectData_ID INTEGER REFERENCES t_ProjectData(ProjectData_ID),
	 ProjectName TEXT,
	 ProjectType INTEGER,
	 ProjectAPI INTEGER,
	 DatabaseEngine INTEGER,
	 DatabasePath TEXT,
	 DatabaseHost TEXT,
	 DatabasePort INTEGER,
	 DatabaseUsername TEXT,
	 DatabaseName TEXT,
	 DatabaseEncrypted BOOLEAN,
	 SSLConfigJSON TEXT
);

DROP TABLE IF EXISTS t_ProjectData;
CREATE TABLE t_ProjectData (
	ProjectData_ID INTEGER PRIMARY KEY AUTOINCREMENT,
	ProjectData BLOB
);