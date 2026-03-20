public with sharing class UntypedParsingOrderRequestHandler {
    
    //UntypedParsingOrderRequestHandler.handleOrderRequests(orderForRestaurantPayload);
    public static void handleOrderRequests(String orderForRestaurantPayload){
        Map<String,Object> orderPayload = (Map<String,Object>)JSON.deserializeUntyped(orderForRestaurantPayload);
        List<Object> results = (List<Object>)orderPayload.get('results');
        for(Object result: results){
            Map<String,Object> orderMapPerSource = (Map<String,Object>) result;
            System.debug('The sources of orders are from: ' + orderMapPerSource.get('source'));
            List<Object> orders = (List<Object>)orderMapPerSource.get('orders');
            for(Object order: orders){
                Map<String,Object> orderMap = (Map<String,Object>)order;
                String orderId = (String)orderMap.get('id');
                Map<String,Object> details = (Map<String,Object>)orderMap.get('details');
                Decimal totalAmount = (Decimal)details.get('totalAmount');
                Object priority = details.get('priority');
                if(priority == null){
                    System.debug('Order is placed for: ' + details.get('customerName') + ' and order id is: ' + orderId + ' and total amount is: ' + totalAmount);
                    System.debug('There\'s no rush as such, complete this after the priortiy orders are done');
                }
                else{
                    Integer priorityValue = Integer.valueOf(priority);
                    System.debug('Order is placed for: ' + details.get('customerName') + ' and order id is: ' + orderId + ' and total amount is: ' + totalAmount + ' and priority is: ' + priorityValue);
                }
            }
        }
    }
}