import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/AuthProvider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'friends.dart';

class StepperControllerDemo extends StatefulWidget {
  @override
  _StepperControllerDemoState createState() => _StepperControllerDemoState();
}

class _StepperControllerDemoState extends State<StepperControllerDemo> {
  ScrollController _scrollController = ScrollController();
  late String username;
  bool light = false;
  late int userId;
  int totalsteps = 0;
  late Future<List<Friend>> _futureFriends;
  bool showFriends = false;
  List<Friend> friends = [];
  
  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    userId = authProvider.userId;
    fetchtotalsteps(userId);
    _futureFriends = fetchFriendsInfo(userId);
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
        
          return leastSteps;
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

  Future<void> fetchtotalsteps(int userId) async {
    String apiUrl = 'https://bewell.luddy.indianapolis.iu.edu/api/activities/$userId/TotalSteps';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        int steps = int.parse(response.body);
       
        if (steps != null) {
          Provider.of<AuthProvider>(context, listen: false).setTotalSteps(steps);
          setState(() {
            totalsteps = steps;
          });
        } else {
          print('Invalid response format: ${response.body}');
        }
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  // int trophie(){
  //   friend
  // }

  Future<List<Friend>> fetchFriendsInfo(int userId) async {
    String apiUrl = 'https://bewell.luddy.indianapolis.iu.edu/api/groups/$userId/friendsinfo';
 
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        return data.map((json) => Friend.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load friends info');
      }
    } catch (error) {
      throw Exception('Error fetching friends info: $error');
    }
  }

  Future<void> getavatar(userId) async {
    String apiUrl = 'https://bewell.luddy.indianapolis.iu.edu/avatars/$userId/image';
    try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200){
      print(Image.network('https://bewell.luddy.indianapolis.iu.edu/avatars/$userId/image'));
    }
    } catch(error){
      throw Exception('Error fetching Image: $error');
    }
  }
  Widget circleAvatar(String? avatarUrl) {
  if (avatarUrl == null) {
    return CircleAvatar(
      child: Text(
        '?', // Placeholder for missing avatar
        style: TextStyle(color: Colors.white),
      ),
    );
  } else {
    return CircleAvatar(
      backgroundImage: NetworkImage(avatarUrl),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userId = authProvider.userId;
    username = ModalRoute.of(context)!.settings.arguments as String;
    fetchtotalsteps(userId);
    
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 5, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    SizedBox(
                      child: Text(
                        'Hello $username',
                        style: TextStyle(fontSize: 25),
                      ),
                      width: 300,
                    ),
                    Expanded(
                      child: Switch(
                        activeColor: Colors.orange,
                        value: light,
                        activeTrackColor: const Color.fromARGB(255, 184, 110, 0),
                        onChanged: (bool value) {
                          setState(() {
                            light = value;
                            showFriends = value;
                            if (showFriends) {
                              _futureFriends = fetchFriendsInfo(userId);
                               fetchLeastSteps(userId);
                            }
                         
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          if (showFriends)
            FutureBuilder<List<Friend>>(
              future: _futureFriends,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Failed to load friends info'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No friends found'));
                } else {
                  friends = snapshot.data!;
                  return Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Padding(
             padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 5),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 15,
                              top: 0,
                              bottom: 0,
                              child: Container(
                                width: 2,
                                color: Colors.grey,
                              ),
                            ),
//                             Column(
//   children: [
//     Image.network(
//       'http://localhost:8082/avatars/$userId/image', 
//       height: 150, 
//     ),
   
//   ],
// ),
                            Column(
                              children: List.generate(10, (index) {
                                List<Friend> friendsAtStation = friends.where((friend) => (friend.totalSteps ?? 0) ~/ 10000 == index).toList();
                                bool isActive = (totalsteps ~/ 10000) >= index;
                                bool isComplete = (totalsteps ~/ 10000) > index;
                               
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(vertical: 5),
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: isActive
                                                      ? Color.fromARGB(255, 226, 101, 52)
                                                      : Colors.grey,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              if (isComplete)
                                                Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                ),
                                            ],
                                          ),
                                          if (index < 9)
                                            Container(
                                              width: 2,
                                              height: 60,
                                              color: isActive
                                                  ? Color.fromARGB(255, 98, 162, 135)
                                                  : Colors.grey,
                                            ),
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            
                                            color: isActive 
                                                ?Color.fromARGB(255, 98, 162, 135)
                                                : Colors.grey.withOpacity(0.1),
                                            border: Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Station ${index + 1}',
                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 0, 0, 0)),
                                              ),
                                           
                                              Text("Total steps: $totalsteps",style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),),
                                              if (friendsAtStation.isNotEmpty)
                                                ...friendsAtStation.map((friend) {
                                                //  var leastSteps = friendsAtStation.map((friend) => friend.totalSteps).reduce((a, b) => a! < b! ? a : b);
                                                //  print("least:$leastSteps");
                                                
                                                // print(friend.totalSteps);
                                                  return Padding(
  padding: const EdgeInsets.symmetric(vertical: 5.0),
  child: Row( // Use Row for better alignment
    children: [
      CircleAvatar( // Use CircleAvatar for a rounded image
        backgroundImage: NetworkImage(
          'https://bewell.luddy.indianapolis.iu.edu/avatars/${friend.userId}/image', // Use friend.userId
        ),
        backgroundColor: Colors.grey[200], // Set a placeholder background color
      ),
      SizedBox(width: 10.0),
      if(username != friend.username)
      

       // Add spacing between image and text
      Expanded( // Expand the text to fill remaining space
        child: 
        Text(
          "Your Friend ${friend.username} is at this station with ${friend.totalSteps == null ? 0 : friend.totalSteps} steps",

          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      if(username == friend.username)
      Expanded( // Expand the text to fill remaining space
        child: 
        Text(
          "You are here with $totalsteps steps",
          // "Your Friend ${friend.username} is at this station with ${friend.totalSteps} steps",
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    ],
  ),
);
                                                }).toList(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          if (!showFriends)
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 5),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 15,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      Column(
                        children: List.generate(10, (index) {
                          bool isActive = (totalsteps ~/ 10000) >= index;
                          bool isComplete = (totalsteps ~/ 10000) > index;

                          return Container(
                            margin: EdgeInsets.symmetric(vertical:5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(vertical: 5),
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: isActive
                                                ?  Color.fromARGB(255, 226, 101, 52)
                                                : Colors.grey,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        if (isComplete)
                                          Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                      ],
                                    ),
                                  
                                    if (index < 9)
                                      Container(
                                        width: 2,
                                        height: 60,
                                        color: isActive
                                            ? Color.fromARGB(255, 98, 162, 135)
                                            : Colors.grey,
                                      ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? Color.fromARGB(255, 98, 162, 135)
                                          : Colors.grey.withOpacity(0.1),
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Station ${index + 1}',
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                        Text("Total steps: $totalsteps",style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                SizedBox(width: 120),
                ElevatedButton(
                  onPressed: (){
                 Navigator.pushNamed(context, '/activity',arguments: username);
                  },
                  child: Text("Record Activity", style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF37966F)),
                  ),
                ),
                SizedBox(width: 20),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Friend {
  final int userId;
  final String username;
  late final int? totalSteps;
 

  Friend({
    required this.userId,
    required this.username,
    this.totalSteps,
   
  });

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      userId: json['userId'],
      username: json['username'],
      totalSteps: json['totalSteps'],
    );
  }
}



// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/AuthProvider.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import 'friends.dart';

// class StepperControllerDemo extends StatefulWidget {
//   @override
//   _StepperControllerDemoState createState() => _StepperControllerDemoState();
// }

// class _StepperControllerDemoState extends State<StepperControllerDemo> {
//   ScrollController _scrollController = ScrollController();
//   late String username;
//   bool light = false;
//   late int userId;
//   int totalsteps = 0;
//   late Future<List<Friend>> _futureFriends;
//   bool showFriends = false;
//   List<Friend> friends = [];

//   @override
//   void initState() {
//     super.initState();
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     userId = authProvider.userId;
//     fetchtotalsteps(userId);
//     _futureFriends = fetchFriendsInfo(userId);
//   }

//   Future<void> fetchtotalsteps(int userId) async {
//     String apiUrl = 'http://localhost:8089/api/activities/$userId/TotalSteps';

//     try {
//       final response = await http.get(Uri.parse(apiUrl));

//       if (response.statusCode == 200) {
//         int steps = int.parse(response.body);
//         if (steps != null) {
//           Provider.of<AuthProvider>(context, listen: false).setTotalSteps(steps);
//           setState(() {
//             totalsteps = steps;
//           });
//         } else {
//           print('Invalid response format: ${response.body}');
//         }
//       } else {
//         print('Failed to fetch data: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
//   }

//   Future<List<Friend>> fetchFriendsInfo(int userId) async {
//     String apiUrl = 'http://localhost:8085/api/groups/$userId/friendsinfo';

//     try {
//       final response = await http.get(Uri.parse(apiUrl));

//       if (response.statusCode == 200) {
//         List<dynamic> data = jsonDecode(response.body);
//         return data.map((json) => Friend.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load friends info');
//       }
//     } catch (error) {
//       throw Exception('Error fetching friends info: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);
//     final userId = authProvider.userId;
//     username = ModalRoute.of(context)!.settings.arguments as String;
//     fetchtotalsteps(userId);

//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 5, top: 5),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: <Widget>[
//                     SizedBox(
//                       child: Text(
//                         'Hello $username',
//                         style: TextStyle(fontSize: 25),
//                       ),
//                       width: 300,
//                     ),
//                     Expanded(
//                       child: Switch(
//                         activeColor: Colors.orange,
//                         value: light,
//                         activeTrackColor: const Color.fromARGB(255, 184, 110, 0),
//                         onChanged: (bool value) {
//                           setState(() {
//                             light = value;
//                             showFriends = value;
//                             if (showFriends) {
//                               _futureFriends = fetchFriendsInfo(userId);
//                             }
//                           });
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           if (showFriends)
//             FutureBuilder<List<Friend>>(
//               future: _futureFriends,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Failed to load friends info'));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return Center(child: Text('No friends found'));
//                 } else {
//                   friends = snapshot.data!;
//                   return Expanded(
//                     child: SingleChildScrollView(
//                       controller: _scrollController,
//                       child: Padding(
//              padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 5),
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               left: 15,
//                               top: 0,
//                               bottom: 0,
//                               child: Container(
//                                 width: 2,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             Column(
//                               children: List.generate(10, (index) {
//                                 List<Friend> friendsAtStation = friends.where((friend) => (friend.totalSteps ?? 0) ~/ 10000 == index).toList();
//                                 bool isActive = (totalsteps ~/ 10000) >= index;
//                                 bool isComplete = (totalsteps ~/ 10000) > index;

//                                 return Container(
//                                   margin: EdgeInsets.symmetric(vertical: 5),
//                                   child: Row(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Column(
//                                         children: [
//                                           Stack(
//                                             alignment: Alignment.center,
//                                             children: [
//                                               Container(
//                                                 margin: EdgeInsets.symmetric(vertical: 5),
//                                                 width: 30,
//                                                 height: 30,
//                                                 decoration: BoxDecoration(
//                                                   color: isActive
//                                                       ? Color.fromARGB(255, 226, 101, 52)
//                                                       : Colors.grey,
//                                                   shape: BoxShape.circle,
//                                                 ),
//                                               ),
//                                               if (isComplete)
//                                                 Icon(
//                                                   Icons.check,
//                                                   color: Colors.white,
//                                                 ),
//                                             ],
//                                           ),
//                                           if (index < 9)
//                                             Container(
//                                               width: 2,
//                                               height: 60,
//                                               color: isActive
//                                                   ? Color.fromARGB(255, 98, 162, 135)
//                                                   : Colors.grey,
//                                             ),
//                                         ],
//                                       ),
//                                       SizedBox(width: 10),
//                                       Expanded(
//                                         child: Container(
//                                           padding: EdgeInsets.all(10),
//                                           decoration: BoxDecoration(
//                                             color: isActive
//                                                 ?Color.fromARGB(255, 98, 162, 135)
//                                                 : Colors.grey.withOpacity(0.1),
//                                             border: Border.all(color: Colors.grey),
//                                             borderRadius: BorderRadius.circular(10),
//                                           ),
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 'Station ${index + 1}',
//                                                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
//                                               ),
//                                               Text("Total steps: $totalsteps",style: TextStyle(color: Colors.white),),
//                                               if (friendsAtStation.isNotEmpty)
//                                                 ...friendsAtStation.map((friend) {
//                                                   return Padding(
//                                                     padding: const EdgeInsets.symmetric(vertical: 2.0),
//                                                     child: Text(
//                                                       "${friend.username} is at this station with ${friend.totalSteps} steps",
//                                                       style: TextStyle(color: Colors.white),
//                                                     ),
//                                                   );
//                                                 }).toList(),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               }),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           if (!showFriends)
//             Expanded(
//               child: SingleChildScrollView(
//                 controller: _scrollController,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 5),
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         left: 15,
//                         top: 0,
//                         bottom: 0,
//                         child: Container(
//                           width: 2,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       Column(
//                         children: List.generate(10, (index) {
//                           bool isActive = (totalsteps ~/ 10000) >= index;
//                           bool isComplete = (totalsteps ~/ 10000) > index;

//                           return Container(
//                             margin: EdgeInsets.symmetric(vertical: 5),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Column(
//                                   children: [
//                                     Stack(
//                                       alignment: Alignment.center,
//                                       children: [
//                                         Container(
//                                           margin: EdgeInsets.symmetric(vertical: 5),
//                                           width: 30,
//                                           height: 30,
//                                           decoration: BoxDecoration(
//                                             color: isActive
//                                                 ?  Color.fromARGB(255, 226, 101, 52)
//                                                 : Colors.grey,
//                                             shape: BoxShape.circle,
//                                           ),
//                                         ),
//                                         if (isComplete)
//                                           Icon(
//                                             Icons.check,
//                                             color: Colors.white,
//                                           ),
//                                       ],
//                                     ),
//                                     if (index < 9)
//                                       Container(
//                                         width: 2,
//                                         height: 60,
//                                         color: isActive
//                                             ? Color.fromARGB(255, 98, 162, 135)
//                                             : Colors.grey,
//                                       ),
//                                   ],
//                                 ),
//                                 SizedBox(width: 10),
//                                 Expanded(
//                                   child: Container(
//                                     padding: EdgeInsets.all(15),
//                                     decoration: BoxDecoration(
//                                       color: isActive
//                                           ? Color.fromARGB(255, 98, 162, 135)
//                                           : Colors.grey.withOpacity(0.1),
//                                       border: Border.all(color: Colors.grey),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Station ${index + 1}',
//                                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
//                                         ),
//                                         Text("Total steps: $totalsteps",style: TextStyle(color: Colors.white),),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Row(
//               children: [
//                 SizedBox(width: 50),
//                 ElevatedButton(
//                   onPressed: null,
//                   child: Text("Record Activity", style: TextStyle(color: Colors.white)),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF37966F)),
//                   ),
//                 ),
//                 SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigator.pushNamed(context, '/community');
//                   },
//                   child: Text("Track Live", style: TextStyle(color: Colors.white)),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF37966F)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Friend {
//   final int userId;
//   final String username;
//   final int? totalSteps;

//   Friend({
//     required this.userId,
//     required this.username,
//     this.totalSteps,
//   });

//   factory Friend.fromJson(Map<String, dynamic> json) {
//     return Friend(
//       userId: json['userId'],
//       username: json['username'],
//       totalSteps: json['totalSteps'],
//     );
//   }
// }






