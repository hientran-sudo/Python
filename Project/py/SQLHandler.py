######
#
#   The functions in this file handle all database related functionality
#
######
import pyodbc

######
#
#   Functions
#
######

#   This function will return a connection to the MSSQL database
def GetConn():
    server = 'localhost' 
    database = 'fairfieldudw_stage' 
    username = 'sweg6508-agent' 
    password = 'sweg6508-agent1' 
    
    return pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+password)

# Clear all dates in the dimension.dates staging table
def ClearAllDates(conn):
    flag = True
    sql = "DELETE FROM [Dimension].[Date]"

    with conn.cursor() as cursor:
        try:
            cursor.execute(sql)
            conn.commit()
        except pyodbc.Error as ex:
            print(ex.args[1]) 
            flag = False

    return flag

# Insert dates into the dimension.dates staging table
def InsertDates(conn, lstDates):
    flag = True
    sql = "INSERT INTO [Dimension].[Date] ([DateKey],[FullDate],[DayName],[DayNumber],[MonthName],[MonthNumber],[QuarterNumber],[Year]) VALUES (?,?,?,?,?,?,?,?)"

    with conn.cursor() as cursor:
        try:
            for dateRow in lstDates:
                cursor.execute(sql, dateRow)
                conn.commit()
        except pyodbc.Error as ex:
            print(ex.args[1]) 
            flag = False

    return flag

# Clear all customers in the dimension.customers staging table
def ClearAllCustomers(conn):
    flag = True
    sql = "DELETE FROM [Dimension].[Customer]"

    with conn.cursor() as cursor:
        try:
            cursor.execute(sql)
            conn.commit()
        except pyodbc.Error as ex:
            print(ex.args[1]) 
            flag = False

    return flag

# Insert customers into the dimension.customer staging table
def InsertCustomers(conn, lstCustomers):
    flag = True
    sql = "INSERT INTO [Dimension].[Customer] ([CustomerKey],[CustomerAlternateKey],[FirstName],[LastName],[FullName],[Address],[Phone],[EmailAddress]) VALUES (?,?,?,?,?,?,?,?)"

    with conn.cursor() as cursor:
        try:
            for custRow in lstCustomers:
                cursor.execute(sql, custRow)
                conn.commit()
        except pyodbc.Error as ex:
            print(ex.args[1]) 
            flag = False

    return flag
    
