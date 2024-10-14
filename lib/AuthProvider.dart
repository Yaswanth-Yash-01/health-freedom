import 'package:flutter/material.dart';
import 'package:flutter_application_2/community.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  late var _userId; 

  bool get isLoggedIn => _isLoggedIn;
   get userId => _userId; 
int totalsteps = 0; 
  

  void setTotalSteps(int steps) {
    totalsteps = steps;
    notifyListeners(); 
  }
  Future<Map<String, dynamic>> login(String username, String password) async {
    var url = Uri.parse('https://bewell.luddy.indianapolis.iu.edu/login/authenticate');

    var data = {
      'username': username,
      'password': password,
    };
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData != null) {
          _isLoggedIn = true;
          _userId = (responseData['id']);
          notifyListeners();
         
          return responseData;
        } else {
          throw Exception('Login failed: Invalid response from server');
        }
      } else {
        throw Exception('Failed to authenticate: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error posting data: $error');
    }
  }
   Future<int?> fetchLeastSteps(int userId) async {
      final String apiUrl = 'https://bewell.luddy.indianapolis.iu.edu/api/groups/$userId/friendsinfo'; 
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        List<Friend> friendsList = jsonList.map((json) => Friend.fromJson(json)).toList();
        if (friendsList.isNotEmpty) {
          var leastSteps = friendsList.map((friend) => friend.totalSteps ?? 0).reduce((a, b) => a < b ? a : b);
          return leastSteps~/10000;
        }
      } else {
        throw Exception('Failed to load steps');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
    return null;
  }
   

}

