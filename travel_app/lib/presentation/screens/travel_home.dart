import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travel_app/dummy.dart';
import 'package:travel_app/logic.dart';
import 'package:travel_app/screens/ezy_travel_screen.dart';
import 'package:intl/intl.dart'; // For formatting dates

class TravelHome extends StatefulWidget {
  TravelHome({super.key});

  @override
  State<TravelHome> createState() => _TravelHomeState();
}

class _TravelHomeState extends State<TravelHome> {
  String? selectFromLocation;
  String? selectToLocation;

  int indexTripeType = -1;

  final departureController = TextEditingController();
  final returnController = TextEditingController();
  final travelersController = TextEditingController();
  final cabinController = TextEditingController();

  int? passenger;

  void convertTextToInt() {
    setState(() {
      passenger = int.tryParse(travelersController.text);
    });
  }

  DateTime? selectedDepartureDate;
  DateTime? selectedReturnDate;
  String? selectedCabinClass;
  final DateFormat formatter = DateFormat('yyyy-MM-dd'); // Format for date

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xffC4E59E),
        title: Text(
          'Search Flights',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            height: 28,
            color: Color(0xff49454F),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 30,
            ),
            color: Color(0xff49454F),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _designHeader(),
            _designHeaderTwo(),
            _designFlight(context),
            _designInspirations(),
            SizedBox(
              height: 20,
            ),
            _designHotelPackage(),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget _designHeader() {
    return SizedBox(
      height: 230,
      child: Stack(
        children: [
          Image(
            image: AssetImage('images/assets/image_one.png'),
            width: double.infinity,
            height: 212,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Let’s start your trip',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFFFFFF)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                height: 55,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      indexTripeType = index;
                      setState(() {
                        print('tripe type :${listOfTripType[index]}');
                      });
                    },
                    child: Container(
                      color: indexTripeType == index
                          ? Color(0xff2EA446)
                          : Colors.white,
                      width: 136,
                      alignment: Alignment.center,
                      child: Text(
                        listOfTripType[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }

  Widget _designHeaderTwo() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Image(
                image: AssetImage(
                  'images/assets/airport.png',
                ),
                width: 20.89,
                height: 30.93,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 20,
              ),
              Row(
                spacing: 20,
                children: [
                  Text(
                    'From',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff484C54),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                    width: 180,
                    child: DropdownButtonFormField<String>(
                      value: (listOfLocations.contains(selectFromLocation))
                          ? selectFromLocation
                          : null,
                      isExpanded: true,
                      hint: Text("Select To"),
                      items: listOfLocations.map((location) {
                        return DropdownMenuItem<String>(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectFromLocation = value;
                          print('to: ' + selectFromLocation.toString());
                        });
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xff63AF23),
                    Color(0xffffffff),
                  ])),
                  margin: EdgeInsets.symmetric(horizontal: 42),
                  height: 2,
                ),
              ),
              Image(
                image: AssetImage(
                  'images/assets/verse.png',
                ),
                width: 50,
                height: 50,
                fit: BoxFit.fill,
              ),
            ],
          ),
          Row(
            children: [
              Image(
                image: AssetImage(
                  'images/assets/location.png',
                ),
                width: 16.9,
                height: 22.06,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 24),
              Row(
                spacing: 40,
                children: [
                  Text(
                    'To',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff484C54),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                    width: 180,
                    child: DropdownButtonFormField<String>(
                      value: (listOfLocations.contains(selectToLocation))
                          ? selectToLocation
                          : null,
                      isExpanded: true,
                      hint: Text("Select To"),
                      items: listOfLocations.map((location) {
                        return DropdownMenuItem<String>(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectToLocation = value;
                          print('to: ' + selectToLocation.toString());
                        });
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _designFlight(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 12,
            children: [
              Expanded(
                child: TextField(
                  controller: departureController,
                  decoration: InputDecoration(
                      label: Container(
                          padding: EdgeInsets.all(6),
                          color: Color(0xffE9F0E4),
                          child: Text(
                            'Departure',
                            style: TextStyle(fontSize: 18),
                          )),
                      border: OutlineInputBorder(),
                      suffixIcon: InkWell(
                        onTap: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030),
                            initialDate: DateTime.now(),
                          );
                          if (picked != null &&
                              picked != selectedDepartureDate) {
                            setState(() {
                              departureController.text =
                                  formatter.format(picked);
                            });
                          }
                          print('departure ' + departureController.text);
                        },
                        child: Icon(
                          Icons.calendar_month,
                          size: 30,
                        ),
                      )),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: returnController,
                  decoration: InputDecoration(
                      label: Container(
                          padding: EdgeInsets.all(6),
                          color: Color(0xffE9F0E4),
                          child: Text(
                            'Return',
                            style: TextStyle(fontSize: 18),
                          )),
                      border: OutlineInputBorder(),
                      suffixIcon: InkWell(
                        onTap: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030),
                          );
                          if (picked != null && picked != selectedReturnDate) {
                            returnController.text = formatter.format(picked);
                          }
                          print('return ' + departureController.text);
                        },
                        child: Icon(
                          Icons.calendar_month,
                          size: 30,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 12,
            children: [
              Expanded(
                child: TextField(
                  controller: travelersController,
                  decoration: InputDecoration(
                    label: Container(
                        padding: EdgeInsets.all(6),
                        color: Color(0xffE9F0E4),
                        child: Text(
                          'Travelers',
                          style: TextStyle(fontSize: 18),
                        )),
                    suffixIcon: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  backgroundColor: Color(0xffE9F0E4),
                                  content: SizedBox(
                                    width: 100,
                                    height: 130,
                                    child: ListView.builder(
                                        itemCount: listOfPassengers.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              travelersController.text =
                                                  '${listOfPassengers[index]}';
                                              convertTextToInt();
                                              print(travelersController.text);
                                              setState(() {
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text(
                                              "${listOfPassengers[index].toString()}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          );
                                        }),
                                  ),
                                ));
                      },
                      child: Icon(Icons.keyboard_arrow_down_sharp),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: cabinController,
                  decoration: InputDecoration(
                    label: Container(
                        padding: EdgeInsets.all(6),
                        color: Color(0xffE9F0E4),
                        child: Text(
                          'Cabin Class',
                          style: TextStyle(fontSize: 18),
                        )),
                    suffixIcon: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Color(0xffE9F0E4),
                              content: SizedBox(
                                  width: 100,
                                  height: 130,
                                  child: ListView.builder(
                                    itemCount: listOfCabinClasses.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          cabinController.text =
                                              listOfCabinClasses[index]
                                                  .toString();
                                          setState(() {
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Row(
                                          spacing: 6,
                                          children: [
                                            Container(
                                              color: Colors.blue,
                                              width: 16,
                                              height: 20,
                                              child: Center(
                                                child: Text(
                                                  index.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              listOfCabinClasses[index]
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff484C54)),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )),
                            ),
                          );
                        },
                        child: Icon(Icons.keyboard_arrow_down_rounded)),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () async {
            if (indexTripeType == -1 &&
                passenger == null &&
                travelersController.text.isEmpty &&
                departureController.text.isEmpty &&
                cabinController.text.isEmpty &&
                selectFromLocation == null &&
                selectToLocation == null) {
              if (selectFromLocation == null || selectToLocation == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Color(0xffC4E59E),
                    content: SizedBox(
                      width: double.infinity,
                      height: 30,
                      child: Text(
                        'Please choose From and to location',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EzyTravelScreen(
                              list: listOfData,
                              fromLocation: selectFromLocation!,
                              toLocation: selectToLocation!,
                            )));
              }
            } else {
              await Logic().searchFlight(
                passenger: passenger,
                arrivalTime: travelersController.text,
                departureTime: departureController.text,
                cabinClass: cabinController.text,
                from: selectFromLocation,
                to: selectFromLocation,
                indexTrip: indexTripeType,
              );
              print('list of search' + listOfSearch.toString());
              if (selectFromLocation == null || selectToLocation == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Color(0xffC4E59E),
                    content: SizedBox(
                      width: double.infinity,
                      height: 30,
                      child: Text(
                        'Please choose from and to location',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EzyTravelScreen(
                        list: listOfSearch,
                        fromLocation: selectFromLocation!,
                        toLocation: selectToLocation!,
                      ),
                    ));
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff2EA446),
              borderRadius: BorderRadius.circular(16),
            ),
            width: 165,
            height: 50,
            child: Center(
                child: Text(
              'Search Flights',
              style: TextStyle(fontSize: 16, color: Color(0xfFFFFFFF)),
            )),
          ),
        )
      ],
    );
  }

  Widget _designInspirations() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Travel Inspirations',
                style: TextStyle(
                  color: Color(0xff2D2D2D),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Dubai',
                    style: TextStyle(
                      color: Color(0xff2D2D2D),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 32,
                    color: Color(0xff63AF23),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(left: 12),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image(
                    image: AssetImage('images/assets/saudi.png'),
                    height: 313,
                    width: 226,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'From AED867',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          'Economy round trip',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Saudi Arabia ',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _designHotelPackage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Flight & Hotel Packages',
            style: TextStyle(
              color: Color(0xff2D2D2D),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image(
            image: AssetImage('images/assets/hotel_package.png'),
            height: 313,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
