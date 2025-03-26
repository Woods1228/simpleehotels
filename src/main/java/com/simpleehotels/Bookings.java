package com.simpleehotels;

public class Bookings {
    private final String bookingID;
    private final String startDate;
    private  final String endDate;
    private final float price;
    private final String customerSSN;
    private final int roomNumber;
    private final String address;

    public Bookings(String bookingID, String startDate, String endDate, float price, String customerSSN, int roomNumber, String address) {
        this.bookingID = bookingID;
        this.startDate = startDate;
        this.endDate = endDate;
        this.price = price;
        this.customerSSN = customerSSN;
        this.roomNumber = roomNumber;
        this.address = address;
    }

    // getters
    public String getBookingID() {
        return bookingID;
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
