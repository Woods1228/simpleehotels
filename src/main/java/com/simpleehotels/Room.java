package com.simpleehotels;

public class Room {
    private final int roomNumber;
    private final String address;
    private float price;
    private String ammenities;
    private String capacity;
    private final String viewType;
    private String damages;
    private final boolean extendible;

    public Room(int roomNumber, String address, float price, String ammenities, String capacity, String viewType, String damages, boolean extendible) {
        this.roomNumber = roomNumber;
        this.address = address;
        this.price = price;
        this.ammenities = ammenities;
        this.capacity = capacity;
        this.viewType = viewType;
        this.damages = damages;
        this.extendible = extendible;
    }

    /* Getters and Setters */

    // Get room number
    public int getRoomNumber() {
        return roomNumber;
    }

    // Get address
    public String getAddress() {
        return address;
    }

    // Get price and set price
    public float getPrice() {
        return price;
    }
    public void setPrice(float price) {
        this.price = price;
    }

    // Get ammenities and set ammenities
    public String getAmmenities() {
        return ammenities;
    }
    public void setAmmenities(String ammenities) {
        this.ammenities = ammenities;
    }

    // Get capacity and set capacity
    public String getCapacity() {
        return capacity;
    }
    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    // Get view type
    public String getViewType() {
        return viewType;
    }
    
    // Get damages and set damages
    public String getDamages() {
        return damages;
    }
    public void setDamages(String damages) {
        this.damages = damages;
    }

    // Get extendible
    public boolean isExtendible() {
        return extendible;
    }
}
