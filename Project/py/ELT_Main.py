######
#
#   This program will extract data from CSV files and load it into their corresponding staging tables in a MSSQL database. The CSV files are:
#       1.  dates.csv
#       2.  customers.csv
#
######
import FileHandler
import SQLHandler

###
# 
#   Constants
# 
###
CUSTOMERS_FILENAME = "FairfieldU_DW_customers.csv"
DATES_FILENAME = "FairfieldU_DW_dates.csv"
ORDERS_FILENAME = "FairfieldU_DW_orders.csv"
###
# 
#   Main function
# 
###
if __name__ == '__main__':
    #   Get customers and dates CSV files
    lstCustomers = FileHandler.Get_Customers(True, CUSTOMERS_FILENAME)
    lstDates = FileHandler.Get_Dates(True, DATES_FILENAME)

    #   Establish a connection with the MSSQL database
    conn = SQLHandler.GetConn()

    #   As long as each step is successful clear the date table then insert the dates. Finally clear the customer table then insert the customers.
    if SQLHandler.ClearAllDates(conn) \
        and SQLHandler.InsertDates(conn, lstDates) \
        and SQLHandler.ClearAllCustomers(conn) \
        and SQLHandler.InsertCustomers(conn, lstCustomers):
        # and SQLHandler.ClearAllOrders(conn) and SQLHandler.InsertRandomOrders(conn, lstDates, lstCustomers)
        print("Data was successfully uploaded to the database")
    else:
        print("There was an issue uploading data to the database")


