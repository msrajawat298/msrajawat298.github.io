# [sql online-compiler](https://www.programiz.com/sql/online-compiler)

1. 2nd Highest Salary

    ```sql
    SELECT max(salary) from emp_table where salary < (SELECT max(salary) from emp_table);
    ```
    ```sql
    SELECT max(salary) from emp_table where salary not in (SELECT max(salary) from emp_table);
    ```
    ### Without max function
    ```sql
    SELECT DISTINCT salary FROM emp_table where salary not in (SELECT DISTINCT salary FROM emp_table ORDER BY salary DESC LIMIT 1) LIMIT 1;
    ```
    ### Without max function and sub query
    ```sql
    SELECT DISTINCT salary FROM emp_table ORDER BY salary DESC LIMIT 1,1;
    ```


2. Display the highest payed employees in each department?
    ```sql
    SELECT max(sal), deptno from emp group by deptno;
    ```

2. Display the number of employees in each department?
    ```sql
    SELECT count(*) as Total_Employee, deptno from emp group by deptno;
    ```

3.  Display Alternate Records
    ```sql
    SELECT first_name, age, rowid FROM Customers WHERE (rowid%2) = 1;
    ```
4. Find duplicated values or duplicate names and its frequency of a column means how many duplicate records available.
    ```sql
    SELECT count(*) as Total_duplicate_records, emp_name from emp group by emp_name;
    ```

## Reference Links 
[Top 50 SQL Interview Questions](https://youtube.com/playlist?list=PLqM7alHXFySGweLxxAdBDK1CcDEgF-Kwx&si=KLCszzVBwycNK74S)