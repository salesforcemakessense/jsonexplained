public class JSON2ApexWrapper{
    public Customer customer{get;set;}
    public List<Items> items{get;set;}
    public String orderStatus{get;set;}
    public DeliveryPartner deliveryPartner{get;set;}
    public String orderId{get;set;}

public class Items{
    public String itemId{get;set;}
    public Integer quantity{get;set;}
    public Decimal price{get;set;}
    public String itemName{get;set;}
}
public class DeliveryPartner{
    public String id{get;set;}
    public String phone{get;set;}
    public String name{get;set;}
}
public class Customer{
    public Address address{get;set;}
    public String name{get;set;}
    public String phone{get;set;}
    public String id{get;set;}
}
public class Address{
    public String street{get;set;}
    public String state{get;set;}
    public String city{get;set;}
}
public static JSON2ApexWrapper parse(String jsonString){
    return (JSON2ApexWrapper) System.JSON.deserialize(jsonString, JSON2ApexWrapper.class);
}
}