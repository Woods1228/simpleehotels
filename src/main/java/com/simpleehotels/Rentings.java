package com.simpleehotels;

public class Rentings {
    private final String rentingID;
    private final String startDate;
    private final String endDate;
    private final float price;
    private final String customerSSN;
    private final int roomNumber;
    private final String address;

    public Rentings(String rentingID, String startDate, String endDate, float price, String customerSSN, int roomNumber, String address) {
        this.rentingID = rentingID;
        this.startDate = startDate;
        this.endDate = endDate;
        this.price = price;
        this.customerSSN = customerSSN;
        this.roomNumber = roomNumber;
        this.address = address;
    }

    // getters
    public String getRentingID() {
        return rentingID;
    }
    public String getStartDate() {
        return startDate;
    }
    public String getEndDate() {
        return endDate;
    }
    public float getPrice() {
        return price;
    }
    public String getCustomerSSN() {
        return customerSSN;
    }
    public int getRoomNumber() {
        return roomNumber;
    }
    public String getAddress() {
        return address;
    }
}
