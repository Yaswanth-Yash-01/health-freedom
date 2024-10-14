import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'AuthProvider.dart';

class activity extends StatefulWidget {
  const activity({super.key});

  @override
  State<activity> createState() => _activityState();
}



late String username;

class _activityState extends State<activity> {
  TextEditingController activitytype = TextEditingController();
  TextEditingController steps = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController date = TextEditingController();
    int? stepsValue;
  int? durationValue;
 bool isStepsFilled = false;  // To track whether 'Steps' field is filled
  bool isDurationFilled = false;
   @override
  void initState() {
    super.initState();

    // Listen to changes in the 'Steps' field
     steps.addListener(() {
      setState(() {
        isStepsFilled = steps.text.isNotEmpty;
        if (isStepsFilled) {
          duration.clear();
          isDurationFilled = false;
        }
      });
    });

    // Listen to changes in the 'Duration' field
     duration.addListener(() {
      setState(() {
        isDurationFilled = duration.text.isNotEmpty;
        if (isDurationFilled) {
          steps.clear();
          isStepsFilled = false;
        }
      });
    });
  }

  Future<void> addactivity(int userId) async {
 
    String apiUrl = 'https://bewell.luddy.indianapolis.iu.edu/api/activities';
  if (steps.text.isNotEmpty) {
    stepsValue = int.tryParse(steps.text);
  }

  if (duration.text.isNotEmpty) {
    durationValue = int.tryParse(duration.text);
  }
    // Sample request body
    Map<String, dynamic> requestBody = {
      'activityType': activitytype.text,
      'steps': stepsValue,
      'duration': durationValue,
      'date': date.text, 
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl + '/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );
       print('Response status code: ${response.statusCode}');
       print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        print('Activity added successfully');
        
      } else {
        print('Failed to add activity');
        print(response.body);
      }
    } catch (error) {
      print('Error adding activity: $error');
    }
  }
  @override
Widget build(BuildContext context) {
   username = ModalRoute.of(context)!.settings.arguments as String;
  final authProvider = Provider.of<AuthProvider>(context);
final userId = authProvider.userId;
   
 List<String> activityTypes = ['AEROBICS CLASS', 'BASKETBALL, GAME', 'BICYCLING', 'CLEANING HOUSE','DANCING','ELLIPTICAL MACHINE','JOGGING','SWIMMING','WALKING','YARD WORK'];
activityTypes = activityTypes.toSet().toList();
  String? selectedActivityType = activityTypes.isNotEmpty ? activityTypes.first : null;
Color _selectedDateColor = Color(0xFF37966F); 
Color _calendarPickerColor = Color(0xFF37966F);
  return Scaffold(
    appBar: AppBar(
      title: Text('Add Activity'),
      backgroundColor: Color(0xFF37966F),
    ),
    body: SingleChildScrollView(
      child: Padding(
        
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Padding(
            padding: const EdgeInsets.only(top:60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16.0),
                DropdownButtonFormField(
            value: selectedActivityType,
            onChanged: (newValue) {
              setState(() {
                selectedActivityType = newValue;
                 activitytype.text = newValue ?? ''; 
              });
            },
            items: activityTypes.map((type) {
              return DropdownMenuItem(
                value: type,
                child: Text(type),
              );
            }).toList(),
            decoration: InputDecoration(
              focusColor: Color(0xFF37966F),
              fillColor: Color(0xFF37966F),
              labelText: 'Activity Type',
            ),
          ),
                
                SizedBox(height: 16.0),
                TextFormField(
                  controller: steps,
                  decoration: InputDecoration(
                     fillColor: Color(0xFF37966F),
                    labelText: 'Steps',
                    enabled: !isDurationFilled,
                  ),
                  
                ),
                  SizedBox(height: 16.0),
                TextFormField(
                  controller: duration,
                  decoration: InputDecoration(
                     fillColor: Color(0xFF37966F),
                    labelText: 'Duration in Minutes',
                    // enabled: !isStepsFilled,
                  ),
                ),
                
                SizedBox(height: 30.0),
                TextFormField(
  controller: date,
  readOnly: true,

  onTap: () async {
    
    final DateTime? pickedDate = await showDatePicker(
      
      context: context,
      initialDate: DateTime.now(), 
      firstDate: DateTime(1900), 
      lastDate: DateTime(2100),
       builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: _calendarPickerColor),
          ),
          child: child!,
        );
      }, 
    );

   
    if (pickedDate != null) {
      setState(() {
        date.text = pickedDate.toString(); 
      });
    }
  },
  decoration: InputDecoration(
    labelText: 'Date',
    icon: Icon(Icons.calendar_today, color: _selectedDateColor), 
    enabledBorder: OutlineInputBorder( 
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder( 
      borderSide: BorderSide(color: _selectedDateColor),
    ),
  ),
),
                SizedBox(height: 30,),
                            ElevatedButton(
              onPressed:(){

                addactivity(userId);
                                Navigator.pushNamed(context, '/journal_menu1',arguments: username);
            } , child: Text("Next",style:TextStyle(fontSize: 17,color:Color(0xFF37966F)) ),
              style: ElevatedButton.styleFrom(backgroundColor:Colors.white)),   
                           SizedBox(height: 20,),
                            ElevatedButton(
              onPressed:(){
                Navigator.pushNamed(context, '/journal_menu1',arguments: username);
            } , child: Text("Skip",style:TextStyle(fontSize: 17,color:Color(0xFF37966F) ) ,),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
 @override
  void dispose() {
    steps.dispose();
    duration.dispose();
    super.dispose();
  }
}



