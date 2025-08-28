🔹 What is a Trigger?

A trigger in SQL is a special stored procedure that automatically executes when a specific event happens on a table or view.
Think of it like a "rule" that runs automatically when INSERT, UPDATE, or DELETE happens.

🔹 Why Use Triggers?

✅ Maintain data integrity

✅ Automatically log changes (audit logs)

✅ Enforce business rules

✅ Prevent invalid transactions

🔹 Types of Triggers

AFTER Triggers (default)

Fire after an operation (INSERT/UPDATE/DELETE).

Example: log every new record added.

INSTEAD OF Triggers

Fire instead of the triggering operation.

Example: override DELETE to only mark a row as inactive.

🔹 Basic Syntax
CREATE TRIGGER trigger_name
ON table_name
AFTER INSERT -- (or UPDATE, DELETE)
AS
BEGIN
    -- SQL code here
END;

🔹 Example 1: Logging Employee Actions

Suppose we want to automatically log employee actions whenever a new log entry is inserted into employeeLogs.

CREATE TRIGGER trg_LogInsert
ON sales.employeeLogs
AFTER INSERT
AS
BEGIN
    INSERT INTO sales.AuditLogs (actionType, actionTime)
    SELECT 'INSERT on employeeLogs', GETDATE();
END;

🔹 Example 2: Prevent Deleting Employees
CREATE TRIGGER trg_PreventDelete
ON sales.Employees
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'Deleting employees is not allowed!';
END;
