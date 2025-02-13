
  List<Map<String,dynamic>> listOfData =[
    {
      "airline": "Garuda Indonesia",
      "flightNumber": "GA 409",
      "departureTime": "14:35",
      "arrivalTime": "21:55",
      "duration": "4h 30m",
      "stops": 0,
      "price": 409,
      "currency": "AED",
      "tripType": "Round Trip",
      "refundable": true,
      "baggage": "20kg",
      "from": "BLR - Bengaluru",
      "to": "DXB - Dubai",
      "cabinClass": "Economy",
      "travelers": 1
    },
    {
      "airline": "Emirates",
      "flightNumber": "EK 501",
      "departureTime": "10:00",
      "arrivalTime": "13:15",
      "duration": "3h 15m",
      "stops": 0,
      "price": 1200,
      "currency": "AED",
      "tripType": "One Way",
      "refundable": true,
      "baggage": "30kg",
      "from": "DEL - Delhi",
      "to": "LHR - London",
      "cabinClass": "Business",
      "travelers": 2
    },
    {
      "airline": "Qatar Airways",
      "flightNumber": "QR 202",
      "departureTime": "22:50",
      "arrivalTime": "05:30",
      "duration": "6h 40m",
      "stops": 1,
      "price": 950,
      "currency": "AED",
      "tripType": "Round Trip",
      "refundable": true,
      "baggage": "25kg",
      "from": "DOH - Doha",
      "to": "CDG - Paris",
      "cabinClass": "First Class",
      "travelers": 3
    },
    {
      "airline": "Lufthansa",
      "flightNumber": "LH 762",
      "departureTime": "07:45",
      "arrivalTime": "15:30",
      "duration": "7h 45m",
      "stops": 0,
      "price": 780,
      "currency": "AED",
      "tripType": "One Way",
      "refundable": false,
      "baggage": "20kg",
      "from": "FRA - Frankfurt",
      "to": "SIN - Singapore",
      "cabinClass": "Premium Economy",
      "travelers": 1
    },
    {
      "airline": "Singapore Airlines",
      "flightNumber": "SQ 318",
      "departureTime": "23:10",
      "arrivalTime": "05:50",
      "duration": "6h 40m",
      "stops": 0,
      "price": 1500,
      "currency": "AED",
      "tripType": "Round Trip",
      "refundable": true,
      "baggage": "35kg",
      "from": "SIN - Singapore",
      "to": "LHR - London",
      "cabinClass": "Business",
      "travelers": 4
    },
    {
      "airline": "Turkish Airlines",
      "flightNumber": "TK 720",
      "departureTime": "13:25",
      "arrivalTime": "21:10",
      "duration": "7h 45m",
      "stops": 0,
      "price": 620,
      "currency": "AED",
      "tripType": "One Way",
      "refundable": true,
      "baggage": "20kg",
      "from": "IST - Istanbul",
      "to": "DEL - Delhi",
      "cabinClass": "Economy",
      "travelers": 2
    },
    {
      "airline": "British Airways",
      "flightNumber": "BA 142",
      "departureTime": "19:30",
      "arrivalTime": "07:45",
      "duration": "10h 15m",
      "stops": 0,
      "price": 890,
      "currency": "AED",
      "tripType": "Round Trip",
      "refundable": true,
      "baggage": "25kg",
      "from": "LHR - London",
      "to": "JFK - New York",
      "cabinClass": "First Class",
      "travelers": 5
    },
    {
      "airline": "Air France",
      "flightNumber": "AF 107",
      "departureTime": "12:15",
      "arrivalTime": "18:45",
      "duration": "6h 30m",
      "stops": 1,
      "price": 710,
      "currency": "AED",
      "tripType": "One Way",
      "refundable": false,
      "baggage": "22kg",
      "from": "CDG - Paris",
      "to": "DXB - Dubai",
      "cabinClass": "Premium Economy",
      "travelers": 3
    },
    {
      "airline": "Etihad Airways",
      "flightNumber": "EY 218",
      "departureTime": "02:30",
      "arrivalTime": "08:40",
      "duration": "6h 10m",
      "stops": 0,
      "price": 980,
      "currency": "AED",
      "tripType": "Round Trip",
      "refundable": true,
      "baggage": "30kg",
      "from": "AUH - Abu Dhabi",
      "to": "BOM - Mumbai",
      "cabinClass": "Business",
      "travelers": 6
    },
    {
      "airline": "Cathay Pacific",
      "flightNumber": "CX 690",
      "departureTime": "18:20",
      "arrivalTime": "08:50",
      "duration": "14h 30m",
      "stops": 1,
      "price": 1340,
      "currency": "AED",
      "tripType": "Round Trip",
      "refundable": true,
      "baggage": "40kg",
      "from": "HKG - Hong Kong",
      "to": "LAX - Los Angeles",
      "cabinClass": "First Class",
      "travelers": 4
    }
  ];

List<Map<String,dynamic>> listOfStop = listOfData.where((item){
  return item['stops'] == 0;
}).toList();

  List<Map<String,dynamic>> listOfSearch = [];

  List listOfLocations = [
    "BLR - Bengaluru",
    "DEL - Delhi",
    "DOH - Doha",
    "IST - Istanbul",
    "BOM - Mumbai",
    "SIN - Singapore",
    "DXB - Dubai",
    "AMS - Amsterdam",
    "LHR - London",
    "AUH - Abu Dhabi",
    "YVR - Vancouver",
    "CDG - Paris",
    "FRA - Frankfurt"
  ];

  List<String> listOfCabinClasses = [
    "Economy",
    "Premium Economy",
    "Business",
    "First Class"
  ];

  List<int> listOfPassengers = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
  ];

  List<String> listOfTripType = [
    'Round Trip',
    'One Way',
    'Multi-city',
  ];


  List<String> listOfSort = [
    'tripeType',
    'cabinClass',
    'travelers',
    'price',
    'departureTime',
    'arrivalTime',
    'duration',
  ];
