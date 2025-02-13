import 'package:travel_app/data/model/travel_model.dart';
import 'package:travel_app/data/dummy.dart';

class Logic {
  Future<void> searchFlight(
      {
         String? tripType,
        int? passenger,
        String? from,
        String? to,
        String? departureTime,
        String? arrivalTime,
        String? cabinClass,
        int? indexTrip,
  }) async {
    listOfSearch = [];
    listOfSearch.addAll(listOfData.where((item)=>
        item['from'] == from &&
        item['cabinClass'] == cabinClass
    ).toList());

  }

  void sortOfTripeType(){
    listOfSearch.sort((a, b) => a['tripType'].compareTo(b['tripType']));
  }

  List<Function> listOfFunction = [
  (){
  },
        (){
      listOfSearch.sort((a,b)=> a['cabinClass'].compareTo(b['cabinClass']));
    },
        (){
      listOfSearch.sort((a,b)=> a['travelers'].compareTo(b['travelers']));
    },
        (){
      listOfSearch.sort((a,b)=> a['price'].compareTo(b['price']));
    },
        (){
      listOfSearch.sort((a,b)=> a['departureTime'].compareTo(b['departureTime']));
    },
        (){
      listOfSearch.sort((a,b)=> a['arrivalTime'].compareTo(b['arrivalTime']));
    },
        (){
      listOfSearch.sort((a,b)=> a['duration'].compareTo(b['duration']));
    },

  ];




}
