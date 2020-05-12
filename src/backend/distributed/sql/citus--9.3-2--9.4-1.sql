-- citus--9.3-2--9.4-1

-- bump version to 9.4-1

CREATE OR REPLACE FUNCTION last_saved_plan()
    RETURNS TEXT
    LANGUAGE C STRICT
    AS 'citus';

CREATE OR REPLACE FUNCTION save_explain_output_for_next_query(
      save_enabled boolean, verbose boolean, costs boolean,
      timing boolean, summary boolean, format integer)
    RETURNS VOID
    LANGUAGE C STRICT
    AS 'citus';
