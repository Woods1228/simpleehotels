package com.simpleehotels;
import java.sql.Date;

public class Customer{
    private final String ssn;
    private final String name;
    private final String address;
    private final Date registration_date;

    public Customer(String ssn, String name, String address, Date registration_date){
        this.ssn=ssn;
        this.name=name;
        this.address=address;
        this.registration_date=registration_date;
    }

    public String getSsn(){
        return ssn;
    }

    public String getName(){
        return name;
    }

     public String getAddress(){
        return address;
    }

    public Date getRegistrationDate(){
        return registration_date;
    }

}