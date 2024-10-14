import 'package:flutter/material.dart';
import 'package:flutter_application_2/AuthProvider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'globals.dart';

class bloodpressurehistory extends StatefulWidget {
  const bloodpressurehistory({Key? key}) : super(key: key);

  @override
  State<bloodpressurehistory> createState() => _bloodpressurehistoryState();
}

class _bloodpressurehistoryState extends State<bloodpressurehistory> {
  List<Map<String, dynamic>> bloodPressureRecords = [];

  @override
  void initState() {
    super.initState();
    Globals.lastentrybp;
    fetchBloodPressureRecords();
  
  }
  
  Future<List<Map<String, dynamic>>> getBloodPressureRecords(int userId) async {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
  final userId = authProvider.userId;
    String apiUrl = 'https://bewell.luddy.indianapolis.iu.edu/api/blood-pressure/user/$userId/getmysaveddata';

    try {
      final http.Response response = await http.get(Uri.parse(apiUrl));
     print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Map<String, dynamic>> records = data.cast<Map<String, dynamic>>(); 
        
        return records;
      } else {
        print('Failed to get blood pressure records');
        return [];
      }
    } catch (error) {
      print('Error getting blood pressure records: $error');
      return [];
    }
  }

  Future<void> fetchBloodPressureRecords() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final userId = authProvider.userId;
    List<Map<String, dynamic>> records = await getBloodPressureRecords(userId);
    setState(() {
      bloodPressureRecords = records;
      if (records.isNotEmpty) {
        Globals.lastentrybp = records[records.length - 1]['date'].toString();
        
      } else {
        Globals.lastentrybp = 'No Recent Activities';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Pressure"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: bloodPressureRecords.isEmpty
            ? Center(child: Text('No blood pressure records found'))
            : ListView.builder(
                itemCount: bloodPressureRecords.length,
                itemBuilder: (context, index) {
                  final record = bloodPressureRecords[index];
                  return ListTile(
                    title: Text('Date: ${record['date']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Systolic: ${record['systolic']}'),
                        Text('Diastolic: ${record['diastolic']}'),
                        Text('Pulse: ${record['pulse']}'),
                        Text('Weight: ${record['weight']}'),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
    
}


class gulcoselevelhistory extends StatefulWidget {
  const gulcoselevelhistory({super.key});

  @override
  State<gulcoselevelhistory> createState() => _gulcoselevelhistoryState();
}

class _gulcoselevelhistoryState extends State<gulcoselevelhistory> {
 List<Map<String, dynamic>> glucoselevelRecords = [];
   @override
    void initState() {
    super.initState();
    Globals.lastentryglucoselevel;
    fetchglucoselevelRecords();
    
  }
  
  Future<List<Map<String, dynamic>>> getglucoselevelRecords(int userId) async {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
  final userId = authProvider.userId;
    String apiUrl = 'https://bewell.luddy.indianapolis.iu.edu/api/glucose-level/user/$userId/getmysaveddata';

    try {
      final http.Response response = await http.get(Uri.parse(apiUrl));
     print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Map<String, dynamic>> records = data.cast<Map<String, dynamic>>(); 
        
        return records;
      } else {
        print('Failed to get glucose records');
        return [];
      }
    } catch (error) {
      print('Error getting glucose level records: $error');
      return [];
    }
  }

  Future<void> fetchglucoselevelRecords() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final userId = authProvider.userId;
    List<Map<String, dynamic>> records = await getglucoselevelRecords(userId);
    setState(() {
      glucoselevelRecords = records;
      if (records.isNotEmpty) {
        Globals.lastentryglucoselevel = records[records.length - 1]['date'].toString();
        
      } else {
        Globals.lastentryglucoselevel = 'No Recent Activities';
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Glucose Level"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: glucoselevelRecords.isEmpty
            ? Center(child: Text('No glucose level records found'))
            : ListView.builder(
                itemCount: glucoselevelRecords.length,
                itemBuilder: (context, index) {
                  final record = glucoselevelRecords[index];
                  return ListTile(
                    title: Text('Date: ${record['date']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Blood Gulcose: ${record['bloodGlucose']}'),
                        Text('Insulin: ${record['insulinUnits']}'),
                        Text('Carbs: ${record['carbsGrams']}'),
                        Text('Meal Description: ${record['mealDescription']}'),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}