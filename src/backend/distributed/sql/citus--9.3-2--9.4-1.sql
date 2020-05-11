-- citus--9.3-2--9.4-1

-- bump version to 9.4-1

CREATE OR REPLACE FUNCTION last_saved_plan()
    RETURNS TEXT
    LANGUAGE C STRICT
    AS 'citus';
