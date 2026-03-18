public with sharing class WrapperClassDeserPartOne {

    public class OrderPayload{
        public String storename;
        public String orderno;
        public Customer customer;
    }

    public class Customer{
        public String id;
        public String name;
        public String phone;
        public Address address;
    }

    public class Address{
        public String street;
        public String city;
        public String state;
    }
    
    /*String orderString = '{   "storename": "Kamat LLC",   "orderno": "1790893",   "customer": {     "id": "CUST-1001",     "name": "Kian O\'Reilly",     "phone": "+971-50-123-4567",     "address": {       "street": "12 Marina Walk",       "city": "Dubai",       "state": "Dubai"     }   } }';
    WrapperClassDeserPartOne.handleDeliveryResponse(orderString);*/
    public static void handleDeliveryResponse(String orderString){
        OrderPayload payload = (OrderPayload)JSON.deserialize(orderString, OrderPayload.class);
        System.debug('Your delivery location is: ' + payload.customer.address.street + ' ' + payload.customer.address.city);
        System.debug('Please greet by the name of: ' + payload.customer.name);
    }
}