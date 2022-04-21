def Get_Customers(hasHeader, filename):
    lstCustomers = list()

    with open(filename, "r") as file:
        for customer in file:
            if not(hasHeader):
                row = customer.split(",")
                row[7] = row[7].replace("\n", "")
                lstCustomers.append(row)
            else:
                hasHeader = False

    return lstCustomers

def Get_Dates(hasHeader, filename):
    lstDates = list()

    with open(filename, "r") as file:
        for date in file:            
            if not(hasHeader):
                row = date.split(",")
                row[7] = row[7].replace("\n", "")
                lstDates.append(row)
            else:
                hasHeader = False

    return lstDates