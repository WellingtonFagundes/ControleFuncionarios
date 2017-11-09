use RecursosHumanos
go

CREATE TABLE tblLogin
(
	LoginId			int				IDENTITY(1,1) NOT NULL,
	LoginName		varchar(100)	NOT NULL,
	Email			varchar(100)	NOT NULL,
	UserName		varchar(20)		NOT NULL,
	Password		varchar(20)		NOT NULL,
	Rights			int				NOT NULL,
	ModifiedDate	datetime		NOT NULL,
	CONSTRAINT [PK_tblLogin] PRIMARY KEY CLUSTERED 
	(
		LoginId ASC
	)
)ON [PRIMARY]


INSERT INTO tblLogin(
	LoginName,
	Email,
	UserName,
	Password,
	Rights,
	ModifiedDate)

	VALUES ('Administrator',
			'admin@admin.com',
			'admin',
			'admin',
			 1,
			 GETDATE())

CREATE TABLE tblDepartment(
	DepartmentId	int				IDENTITY(1,1) NOT NULL,
	DepartmentName	varchar(100)	NOT NULL,
	CONSTRAINT [PK_tblDepartment] PRIMARY KEY CLUSTERED 
	(
		DepartmentId ASC
	)
)ON [PRIMARY]


INSERT INTO tblDepartment (DepartmentName) VALUES ('Management')
INSERT INTO tblDepartment (DepartmentName) VALUES ('HR')
INSERT INTO tblDepartment (DepartmentName) VALUES ('Engineering')
INSERT INTO tblDepartment (DepartmentName) VALUES ('Accounts')

CREATE TABLE tblEmployee(
	EmployeeId		int				IDENTITY(1,1)	NOT NULL,
	Name			varchar(200)	NOT NULL,
	DOB				datetime		NOT NULL,
	Degree			varchar(250)	NULL,
	Address			varchar(300)	NOT NULL,
	City			varchar(50)		NOT NULL,
	State			varchar(50)		NOT NULL,
	Zip				varchar(50)		NOT NULL,
	Phone			varchar(15)		NOT NULL,
	Mobile			varchar(15)		NOT NULL,
	Email			varchar(100)	NOT NULL,
	Designation		varchar(100)	NOT NULL,
	DepartmentId	int				NOT NULL,			
	DOJ				datetime		NOT NULL,
	DOC				datetime		NOT NULL,
	Bio				text			NOT NULL,
	Photo			varchar(100)	NOT NULL,
	Status			int				NOT NULL,
	CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED
	(
		EmployeeId ASC
	)
)ON [PRIMARY]


CREATE TABLE tblTrainings(
	TrainingId		int			IDENTITY(1,1) NOT NULL,
	StartDate		datetime	NOT NULL,
	EndDate			datetime	NOT NULL,
	TrainingDetails	text		NOT NULL,
	Effectiveness	text		NOT NULL,
	JobType			int			NOT NULL,
	EmployeeId		int			NOT NULL,
	CONSTRAINT	[PK_tblTrainings] PRIMARY KEY CLUSTERED
	(
		TrainingId ASC
	)	
) ON [PRIMARY]