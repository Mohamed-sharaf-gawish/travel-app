import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/data/dummy.dart';
import 'package:travel_app/logic/logic.dart';
import 'package:travel_app/presentation/screens/travel_home.dart';

class EzyTravelScreen extends StatefulWidget {
   EzyTravelScreen({super.key,required this.list,
   required this.fromLocation,required this.toLocation});

  List<Map<String,dynamic>> list;
  String? fromLocation;
  String? toLocation;
  @override
  State<EzyTravelScreen> createState() => _EzyTravelScreenState();
}

class _EzyTravelScreenState extends State<EzyTravelScreen> {
  DateTime dateTime = DateTime.now();

  bool isStop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xffC4E59E),
        leadingWidth: 40,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => TravelHome()));
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
          color: Color(0xff49454F),
        ),
        title: Text(
          'Ezy Travel',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            height: 28,
            color: Color(0xff49454F),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _designGroupOne(),
              SizedBox(
                height: 16,
              ),
              _designGroupTwo(),
              SizedBox(
                height: 16,
              ),
              _designGroupThree()
            ],
          ),
        ),
      ),
    );
  }

  Widget _designGroupOne() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(0, 5),
                blurRadius: 1,
                spreadRadius: 1)
          ]),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        spacing: 2,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( widget.fromLocation!.isEmpty ? 'Not From Location' : widget.fromLocation! ,
                style: TextStyle(
                  color: Color(0xff2D2D2D),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('  -  ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
              Text(  widget.toLocation!.isEmpty ? 'Not to Location' : widget.toLocation!,
                style: TextStyle(
                  color: Color(0xff2D2D2D),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            'Departure: Sat, 23 Mar - Return: Sat, 23 Mar',
            style: TextStyle(
              color: Color(0xff2D2D2D),
              fontSize: 16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              Text(
                '(Round Trip)',
                style: TextStyle(
                  color: Color(0xffFA7927),
                  fontSize: 16,
                ),
              ),
              Text(
                'Modify Search',
                style: TextStyle(
                  color: Color(0xff2EA446),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,
            height: 1.2,
            color: Color(0xffC8C8C8),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 4,
                  children: [
                    Text(
                      'Sort',
                      style: TextStyle(
                        color: Color(0xff434343),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    backgroundColor: Color(0xffC8C8C8),
                                    content: SizedBox(
                                      width: 100,
                                      height: 200,
                                      child: ListView.builder(
                                          itemCount: listOfSort.length,
                                          itemBuilder: (context, index) =>
                                              Row(
                                                spacing: 6,
                                                children: [
                                                  Container(
                                                    width: 16,
                                                    height: 20,
                                                    color: Colors.blue,
                                                    child: Center(
                                                        child: Text(
                                                      (index + 1).toString(),
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white),
                                                    )),
                                                  ),
                                                  Text(
                                                    listOfSort[index],
                                                    style: TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              )),
                                    ),
                                  ));
                          setState(() {});
                        },
                        child: InkWell(
                          onTap: (){
                            Logic().sortOfTripeType();
                            setState(() {

                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 30,
                            color: Color(0xff434343),
                          ),
                        ))
                  ],
                ),
                Row(
                  spacing: 4,
                  children: [
                    InkWell(
                      onTap: (){
                        if(isStop == false)
                          {
                            isStop = true;
                            setState(() {

                            });
                          }
                        else{
                          isStop = false;
                          setState(() {
                          });
                        }
                      },
                      child: Text(
                       isStop == true ? 'Stop' : 'Non - Stop',
                        style: TextStyle(
                          color: Color(0xff434343),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 4,
                  children: [
                    Text(
                      'Filter',
                      style: TextStyle(
                        color: Color(0xff434343),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.filter_alt_sharp,
                      size: 30,
                      color: Color(0xff434343),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _designGroupTwo() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffC8C8C8),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            spacing: 2,
            children: [
              Text(
                DateFormat.MMMd().format(dateTime) + ' - ' + DateFormat.MMMd().format(dateTime.add(Duration(days: 1))),
                style: TextStyle(
                  color: Color(0xff434343),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'From AED 741',
                style: TextStyle(
                  color: Color(0xff434343),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 4,
        ),
      ),
    );
  }

  Widget _designGroupThree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            '${isStop == true ? listOfStop.length : widget.list.length} Flight Found',
            style: TextStyle(
              color: Color(0xff2D2D2D),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height:isStop == true ? listOfStop.length * 390 :  widget.list.length * 390,
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(0, 5),
                              blurRadius: 1,
                              spreadRadius: 1)
                        ]),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image:
                                        AssetImage('images/assets/ellipse.png'),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Onward - ${isStop == true ? listOfStop[index]['airline'] : widget.list[index]['airline']}',
                                    style: TextStyle(
                                      color: Color(0xff434343),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${isStop == true ? listOfStop[index]['flightNumber'] : widget.list[index]['flightNumber']}',
                                    style: TextStyle(
                                      color: Color(0xff2EA446),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${isStop == true ? listOfStop[index]['departureTime'] : widget.list[index]['departureTime']}',
                                    style: TextStyle(
                                      color: Color(0xff0B0B0B),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            'images/assets/vector.png'),
                                        color: Color(0xff505050),
                                      ),
                                      Image(
                                        image: AssetImage(
                                            'images/assets/airport_two.png'),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${isStop == true ? listOfStop[index]['arrivalTime'] : widget.list[index]['arrivalTime']} ',
                                    style: TextStyle(
                                      color: Color(0xff0B0B0B),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${isStop == true ? listOfStop[index]['from'] : widget.list[index]['from']}',
                                      style: TextStyle(
                                        color: Color(0xff2F2F2F),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '  ${isStop == true ? listOfStop[index]['duration'] : widget.list[index]['duration']}',
                                      style: TextStyle(
                                        color: Color(0xff454B50),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${isStop == true ? listOfStop[index]['to'] : widget.list[index]['to']}',
                                    style: TextStyle(
                                      color: Color(0xff2F2F2F),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Text(
                                  '${isStop == true ? listOfStop[index]['stops'] : widget.list[index]['stops']} Stops',
                                  style: TextStyle(
                                    color: Color(0xff454B50),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Color(0xffC8C8C8),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image:
                                        AssetImage('images/assets/ellipse.png'),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Return - ${isStop == true ? listOfStop[index]['airline'] : widget.list[index]['airline']}',
                                    style: TextStyle(
                                      color: Color(0xff434343),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${isStop == true ? listOfStop[index]['flightNumber'] : widget.list[index]['flightNumber']}',
                                    style: TextStyle(
                                      color: Color(0xff2EA446),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${isStop == true ? listOfStop[index]['arrivalTime'] : widget.list[index]['arrivalTime']}',
                                    style: TextStyle(
                                      color: Color(0xff0B0B0B),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            'images/assets/vector.png'),
                                        color: Color(0xff505050),
                                      ),
                                      Image(
                                        image: AssetImage(
                                            'images/assets/airport_two.png'),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    isStop == true ? listOfStop[index]['departureTime'] :  widget.list[index]['departureTime'],
                                    style: TextStyle(
                                      color: Color(0xff0B0B0B),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${isStop == true ? listOfStop[index]['to'] : widget.list[index]['to']}',
                                      style: TextStyle(
                                        color: Color(0xff2F2F2F),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '     ${isStop == true ? listOfStop[index]['duration'] : widget.list[index]['duration']}',
                                      style: TextStyle(
                                        color: Color(0xff454B50),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${isStop == true ? listOfStop[index]['from'] : widget.list[index]['from']}',
                                    style: TextStyle(
                                      color: Color(0xff2F2F2F),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image(
                            image: AssetImage('images/assets/vector_two.png'),
                            width: double.infinity,
                            fit: BoxFit.fill,
                            color: Color(0xff505050),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            spacing: 12,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff63AF23),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  'Cheapest',
                                  style: TextStyle(color: Color(0xff63AF23)),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff428EE7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  'Refundable',
                                  style: TextStyle(color: Color(0xff428EE7)),
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Text(
                                    'Flight Details',
                                    style: TextStyle(color: Color(0xffFA7927)),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Color(0xffFA7927),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 24,
                  ),
              itemCount:isStop == true ? listOfStop.length :  widget.list.length),
        )
      ],
    );
  }
}
