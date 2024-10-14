import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/AuthProvider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class community extends StatefulWidget {
  const community({super.key});

  @override
  State<community> createState() => _communityState();
}
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

class Friend {
  final int userId;
  final String username;
  final int? totalSteps;

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
class _communityState extends State<community> {
   late String username;
  @override
  Widget build(BuildContext context) {
     username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
               Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 64),
                    child: Container(
                      width: 298.28570556640625,
                      height: 4,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
          top: 0,
          left: 0,
          child: Container(
          width: 44.081634521484375,
          height: 4,
          decoration: BoxDecoration(
            borderRadius : BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
        color : Color.fromRGBO(233, 97, 55, 1),
        )
        )
        ),Positioned(
          top: 0,
          left: 51.427734375,
          child: Container(
          width: 44.081634521484375,
          height: 4,
          decoration: BoxDecoration(
            borderRadius : BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
        color : Color.fromRGBO(233, 97, 55, 1),
        )
        )
        ),Positioned(
          top: 0,
          left: 99.857421875,
          child: Container(
          width: 44.081634521484375,
          height: 4,
          decoration: BoxDecoration(
            borderRadius : BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
        color : Color.fromRGBO(233, 97, 55, 1),
        )
        )
        ),Positioned(
          top: 0,
          left: 151.28515625,
          child: Container(
          width: 44.081634521484375,
          height: 4,
          decoration: BoxDecoration(
            borderRadius : BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
        color :  Color.fromRGBO(233, 97, 55, 1),
        )
        )
        ),Positioned(
          top: 0,
          left: 200.71484375,
          child: Container(
          width: 46.28571319580078,
          height: 4,
          decoration: BoxDecoration(
            borderRadius : BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
        color :  Color.fromRGBO(233, 97, 55, 1),
        )
        )
        ),Positioned(
          top: 0,
          left: 252,
          child: Container(
          width: 46.28571319580078,
          height: 4,
          decoration: BoxDecoration(
            borderRadius : BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
        color : Color.fromRGBO(233, 97, 55, 1),
        )
        )
        ),
        
                        ],
                      ),
                    ),
                  ),
                ],
              ),
                Padding(padding: EdgeInsets.only(top:20)),    // Figma Flutter Generator Frame11190Widget - FRAME
      Container(
      width: 343,
      height: 800,
      decoration: BoxDecoration(
          
  ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: -1,
        child: Container(
      width: 344,
      height: 700,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 1,
        child: Text('Welcome, $username!', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(66, 103, 90, 1),
        fontFamily: 'Montserrat',
        fontSize: 24,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 39,
        left: 0,
        child: Text('Meet your conductor Smith Harrison and your\nCommunity members.', textAlign: TextAlign.center, softWrap: true, style: TextStyle(
          
        color: Color.fromRGBO(0, 0, 0, 1),
        
        fontFamily: 'Roboto',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5714285714285714
      ),)
      ),Positioned(
        top: 414,
        left: 0,
        child: Text('Community Members', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Montserrat',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5714285714285714
      ),)
      ),Positioned(
        top: 430,
        left:0,
        child: Container(
      width: 700,
      height: 500,
      child: FriendsPositionedWidget(),
      
    )
      ),
      Positioned(
        left: 100,
    top: 650,
     child: SizedBox(
      
     width: 120,
     child:   ElevatedButton(
   
      onPressed:(){
     
      Navigator.pushNamed(context, '/overview',arguments:username);
     } , child: Text("Next",style:TextStyle(fontSize: 17) ,),
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF37966F))),
   ),
   ),
      Positioned(
        top: 97,
        left: 1,
        child: Container(
      width: 343,
      height: 297,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
      width: 343,
      height: 297,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 47,
        left: 0,
        child: Container(
        width: 343,
        height: 250,
        decoration: BoxDecoration(
          color : Color.fromRGBO(254, 252, 232, 1),
  )
      )
      ),Positioned(
        top: 149,
        left: 10,
        child: Text('Smith has been working towards health freedom\njourney since a year with an experience of\nconducting 12 groups so far.\nHe is enthusiastic about swimming and kick boxing.\n You can connect with SMITH in the community section\nof the application.', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Roboto',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5714285714285714
      ),)
      ),Positioned(
        top: 116,
        left: 90,
     child: Text(
       'Smith Harrison', 
  textAlign: TextAlign.center, // Align text to center horizontally
  softWrap: true, // Allow text to wrap within the container
  style: TextStyle(
    color: Color.fromRGBO(66, 103, 90, 1),
    fontFamily: 'Montserrat',
    fontSize: 24,
    letterSpacing: 0,
    fontWeight: FontWeight.normal,
    height: 1,
  ),
),
      ),Positioned(
        top: 0,
        left: 122,
        child: Container(
      width: 100,
      height: 100,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/dp.png', // Path to your profile picture
                fit: BoxFit.cover,
              ),
            ),
          ),
          
      )
        ]
      )
    )
      ),
        ]
      )
    )
      ),
        ]
      )
    )
      ),
      
        ]
      )
    )
      ),
      
        ]
      )
    ),
   
   
            ],
          ),
        )
        
    )
    
    );
  }
}


class FriendsPositionedWidget extends StatefulWidget {
  @override
  _FriendsPositionedWidgetState createState() => _FriendsPositionedWidgetState();
}

class _FriendsPositionedWidgetState extends State<FriendsPositionedWidget> {
  late Future<List<Friend>> _futureFriends;

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    int userId = authProvider.userId;
    _futureFriends = fetchFriendsInfo(userId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Friend>>(
      future: _futureFriends,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Failed to load friends info'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No friends found'));
        } else {
          List<Friend> friends = snapshot.data!;
          return Stack(
            children: [
              Positioned(
                left: 20.0,
                top: 20.0,
                child: Row(
                  children: friends.map((friend) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://bewell.luddy.indianapolis.iu.edu/avatars/${friend.userId}/image',
                            ),
                            radius: 40,
                            backgroundColor: Colors.grey[200],
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            friend.username,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}