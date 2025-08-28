/*
--TRIGGER SYNTAX
create trigger trigger_name on table_name
after insert, update, delete 
begin
	--what will happen in the trigger
end
*/


create trigger trg_afterInsertEmployee on sales.employees
after insert
as
begin
	insert into sales.EmployeeLogs (employeeID, logMessage, logDate)
	select
		employeeID,
		'New Employee Added =' + CAST(EmployeeID as varchar),
		GETDATE()
	from INSERTED
end
