USE AdventureWorks2019;
GO

-- Declare the variables to be used
DECLARE @c TINYINT = 1, @a TINYINT = 1
    , @businessEntityID INT
    , @creditCardID INT
    , @modifiedDate DATETIME
    , @cardType VARCHAR(100)
    , @cardNumber VARCHAR(25)
    , @expMonth TINYINT
    , @expYear SMALLINT
    , @modifiedDate2 DATETIME;

-- Declare the cursor for PersonCreditCard
DECLARE cPersonCreditCard CURSOR FOR
SELECT TOP 20 BusinessEntityID, CreditCardID, ModifiedDate
FROM Sales.PersonCreditCard; -- Ensure this table exists

-- Open the PersonCreditCard cursor
OPEN cPersonCreditCard;

-- Fetch the first row from the cursor
FETCH NEXT FROM cPersonCreditCard
INTO @businessEntityID, @creditCardID, @modifiedDate;

-- Iterate through the rows of the PersonCreditCard cursor
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Print the values for the current row
    PRINT '< Cursor cPersonCreditCard: ' + CAST(@c AS VARCHAR);
    PRINT '@businessEntityID: ' + CAST(@businessEntityID AS VARCHAR);
    PRINT '@creditCardID: ' + CAST(@creditCardID AS VARCHAR);
    PRINT '@modifiedDate: ' + CAST(@modifiedDate AS VARCHAR);

    SET @c = @c + 1;
    SET @a = 1;

    -- Declare a nested cursor for CreditCard
    DECLARE cCreditCard CURSOR FOR
    SELECT CardType, CardNumber, ExpMonth, ExpYear, ModifiedDate
    FROM Sales.CreditCard
    WHERE CreditCardID = @creditCardID; -- Ensure this table exists

    -- Open the CreditCard cursor
    OPEN cCreditCard;

    -- Fetch the first row from the CreditCard cursor
    FETCH NEXT FROM cCreditCard
    INTO @cardType, @cardNumber, @expMonth, @expYear, @modifiedDate2;

    -- Iterate through the rows of the CreditCard cursor
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Print the values for the current row of the CreditCard cursor
        PRINT '   <<< Cursor cCreditCard: ' + CAST(@a AS VARCHAR);
        PRINT '   @cardType: ' + CAST(@cardType AS VARCHAR);
        PRINT '   @cardNumber: ' + CAST(@cardNumber AS VARCHAR);
        PRINT '   @expMonth: ' + CAST(@expMonth AS VARCHAR);
        PRINT '   @expYear: ' + CAST(@expYear AS VARCHAR);
        PRINT '   @modifiedDate2: ' + CAST(@modifiedDate2 AS VARCHAR);
        PRINT '   >>>>>';
        
        SET @a = @a + 1;
        -- Fetch the next row from the CreditCard cursor
        FETCH NEXT FROM cCreditCard
        INTO @cardType, @cardNumber, @expMonth, @expYear, @modifiedDate2;
    END -- End of the CreditCard cursor iteration
    
    CLOSE cCreditCard; -- Close the CreditCard cursor
    DEALLOCATE cCreditCard; -- Deallocate the CreditCard cursor

    PRINT '>>>>>>>>';

    -- Fetch the next row from the PersonCreditCard cursor
    FETCH NEXT FROM cPersonCreditCard
    INTO @businessEntityID, @creditCardID, @modifiedDate;
END -- End of the PersonCreditCard cursor iteration

CLOSE cPersonCreditCard; -- Close the PersonCreditCard cursor
DEALLOCATE cPersonCreditCard; -- Deallocate the PersonCreditCard cursor

Key Points:

    Cursor Declaration: The DECLARE cPersonCreditCard CURSOR FOR section defines the cursor to iterate through rows from the Sales.PersonCreditCard table.
    Cursor Operations: The OPEN, FETCH NEXT, CLOSE, and DEALLOCATE commands manage the lifecycle of the cursor, fetching and processing rows as needed.
    Nested Cursor: The nested cursor cCreditCard is used to fetch related card details based on CreditCardID.

Make sure to validate that Sales.PersonCreditCard and Sales.CreditCard exist in your AdventureWorks 2019 database and that the column names match those used in the script.
