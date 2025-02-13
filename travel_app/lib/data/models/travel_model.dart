class Flight {
  final String airline;
  final String flightNumber;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final int stops;
  final int price;
  final String currency;
  final String tripType;
  final bool refundable;
  final String baggage;

  Flight({
    required this.airline,
    required this.flightNumber,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.stops,
    required this.price,
    required this.currency,
    required this.tripType,
    required this.refundable,
    required this.baggage,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      airline: json["airline"],
      flightNumber: json["flightNumber"],
      departureTime: json["departureTime"],
      arrivalTime: json["arrivalTime"],
      duration: json["duration"],
      stops: json["stops"],
      price: json["price"],
      currency: json["currency"],
      tripType: json["tripType"],
      refundable: json["refundable"],
      baggage: json["baggage"],
    );
  }

}

class FlightSearchCriteria {
  final String tripType;
  final String from;
  final String to;
  final String departureDate;
  final String returnDate;
  final int passengers;
  final String cabinClass;

  FlightSearchCriteria({
    required this.tripType,
    required this.from,
    required this.to,
    required this.departureDate,
    required this.returnDate,
    required this.passengers,
    required this.cabinClass,
  });

  factory FlightSearchCriteria.fromJson(Map<String, dynamic> json) {
    return FlightSearchCriteria(
      tripType: json["tripType"],
      from: json["from"],
      to: json["to"],
      departureDate: json["departureDate"],
      returnDate: json["returnDate"],
      passengers: json["passengers"],
      cabinClass: json["cabinClass"],
    );
  }


}