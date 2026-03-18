public with sharing class UntypedDeserialisationSimple {
    //String responseFromThirdParty = '{   "company": "Ernser, Yost and Brakus",   "username": "Noemy31",   "password": "vhhqkZ27kcRkD9a",   "role": "administrator",   "phone": "(986) 018-7519",   "cell": "(972) 990-4568",   "age": 30 } ';
    //UntypedDeserialisationSimple.parseMySampleResponse(responseFromThirdParty);
    public static void parseMySampleResponse(String responseFromThirdParty){
        //add code to parse JSON string here
        Map<String,Object> jsonResponse = (Map<String,Object>)JSON.deserializeUntyped(responseFromThirdParty);
        Integer currentAge = (Integer)jsonResponse.get('age');
        System.debug(currentAge);
    }

    //String responseFromThirdParty = '[   {     "_id": "69b783fe4ef2499a2eeb0441",     "index": 0,     "guid": "3087f454-0906-438a-824d-0a33ae9d7afb",     "isActive": true,     "balance": "$3,678.30",     "picture": "http://placehold.it/32x32",     "age": 37,     "eyeColor": "brown",     "name": "Claire Ruiz",     "gender": "female",     "company": "PROSURE",     "email": "claireruiz@prosure.com",     "phone": "+1 (956) 466-3518",     "address": "192 Oriental Boulevard, Elliott, Vermont, 3035",     "about": "Officia ipsum mollit ipsum est veniam id et ad ut laborum excepteur laborum. Et laborum proident enim aliquip ea. Aliquip id Lorem consectetur tempor irure.\r\n",     "registered": "2015-09-30T03:57:41 -04:00",     "latitude": 45.56528   },   {     "_id": "69b784b74ef2499a2eeb0442",     "index": 1,     "guid": "a2c9e1d3-7f6b-4c71-9f52-1d4b9e8a0f12",     "isActive": false,     "balance": "$1,245.90",     "picture": "http://placehold.it/32x32",     "age": 29,     "eyeColor": "green",     "name": "Daniel Harper",     "gender": "male",     "company": "TECHTRON",     "email": "danielharper@techtron.com",     "phone": "+1 (415) 555-1298",     "address": "784 Pine Street, Denver, Colorado, 80203",     "about": "Laboris tempor incididunt laboris officia amet reprehenderit nulla incididunt voluptate incididunt excepteur.",     "registered": "2018-06-12T11:24:10 -04:00",     "latitude": 39.739235   } ]';
    //UntypedDeserialisationSimple.parseMyJSONArray(responseFromThirdParty);
    public static void parseMyJSONArray(String responseFromThirdParty){
        List<Object> records = (List<Object>)JSON.deserializeUntyped(responseFromThirdParty);
        List<String> guidList = new List<String>();
        for(Object record: records){
            Map<String, Object> eachRec = (Map<String, Object>)record;
            String guid = (String)eachRec.get('guid');
            guidList.add(guid);
        }
        System.debug(guidList);
    }
}