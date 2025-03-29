package com.simpleehotels;

public class HotelChain {
    private String name;
    private String address;
    private String email;
    private String numOfHotels;

    public HotelChain(String name, String address, String email, String numOfHotels) {
        this.name = name;
        this.address = address;
        this.email = email;
        this.numOfHotels = numOfHotels;
    }
    // Getters
    public String getName() {
        return name;
    }
    public String getAddress() {
        return address;
    }
    public String getEmail() {
        return email;
    }
    public String getNumOfHotels() {
        return numOfHotels;
    }
    // Setters
    public void setName(String name) {
        this.name = name;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setNumOfHotels(String numOfHotels) {
        this.numOfHotels = numOfHotels;
    }
}
