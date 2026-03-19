public with sharing class WrapperClassDeserPartTwo {
    public class OrderPayload{
        public String orderId;
        public String orderStatus;
        public Customer customer;
        public DeliveryPartner deliveryPartner;
        public List<OrderItem> items;
    }

    public class OrderItem{
        public String itemId;
        public String itemName;
        public Integer quantity;
        public Decimal price;
    }

    public class DeliveryPartner{
        public String id;
        public String name;
        public String phone;
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

    /*String orderString = '{   "orderId": "ORD-9001",   "orderStatus": "Preparing",   "customer": {     "id": "CUST-1001",     "name": "Kian",     "phone": "+971-50-123-4567",     "address": {       "street": "12 Marina Walk",       "city": "Dubai",       "state": "Dubai"     }   },   "items": [     {       "itemId": "ITM-01",       "itemName": "Margherita Pizza",       "quantity": 1,       "price": 45     },     {       "itemId": "ITM-02",       "itemName": "Garlic Bread",       "quantity": 2,       "price": 12.5     }   ],   "deliveryPartner": {     "id": "DEL-501",     "name": "Ravi Kumar",     "phone": "+971-55-777-8888"   } }';
    WrapperClassDeserPartTwo.findDeliveryInfo(orderString);*/
    public static void findDeliveryInfo(String orderString){
        OrderPayload payload = (OrderPayload)JSON.deserialize(orderString,OrderPayload.class);
        
        List<OrderItem> orderItems = payload.items;
        for(OrderItem oi: orderItems){
            System.debug('As part of your order:' + payload.orderId + ' You have ordered ' + oi.quantity + ' of ' + oi.itemName);
        }
    }

    /*String orderString = '{   "orderId": "ORD-9001",   "orderStatus": "Preparing",   "customer": {     "id": "CUST-1001",     "name": "Kian",     "phone": "+971-50-123-4567",     "address": {       "street": "12 Marina Walk",       "city": "Dubai",       "state": "Dubai"     }   },   "items": [     {       "itemId": "ITM-01",       "itemName": "Margherita Pizza",       "quantity": 1,       "price": 45     },     {       "itemId": "ITM-02",       "itemName": "Garlic Bread",       "quantity": 2,       "price": 12.5     }   ],   "deliveryPartner": {     "id": "DEL-501",     "name": "Ravi Kumar",     "phone": "+971-55-777-8888"   } }';
    WrapperClassDeserPartTwo.findDeliveryInfoFromUtil(orderString);*/
    public static void findDeliveryInfoFromUtil(String orderString){
        JSON2ApexWrapper payload = JSON2ApexWrapper.parse(orderString);
        
        List<JSON2ApexWrapper.Items> orderItems = payload.items;
        for(JSON2ApexWrapper.Items oi: orderItems){
            System.debug('As part of your order:' + payload.orderId + ' You have ordered ' + oi.quantity + ' of ' + oi.itemName);
        }
    }
}