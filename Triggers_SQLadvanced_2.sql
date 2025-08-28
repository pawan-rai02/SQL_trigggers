create table sales.employeeLogs(
	logID int identity (1, 1) primary key,
	employeeID int,
	logMessage varchar(255),
	logDate date
)