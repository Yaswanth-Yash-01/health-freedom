import 'dart:convert';
import 'package:flutter_application_2/activity.dart';
import 'package:flutter_application_2/knowledgemap.dart';
// import 'package:flutter_application_2/community.dart';


import 'history.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/AuthProvider.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
import 'package:stepper_list_view/stepper_list_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_2/stepper.dart';
import 'globals.dart';



class journal_menu1 extends StatefulWidget {
  const journal_menu1({super.key});
  @override
  State<journal_menu1> createState() => _journal_menu1State();
}

int selected_index = 0;

class _journal_menu1State extends State<journal_menu1> {
  @override
  Widget build(BuildContext context) {
    
    List<Widget> options = <Widget>[
      Mainhome(),
      content(),
      journal(),
      profile(),
    ];

    void ontappeditem(int index) {
      setState(() {
        selected_index = index;
      });
    }

    return Scaffold(
      body: Center(child: options.elementAt(selected_index)),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color.fromRGBO(182, 215, 202, 1.0),
        selectedIndex: selected_index,
        indicatorColor: Color.fromRGBO(254, 252, 232, 1.0),
        onDestinationSelected: ontappeditem,
        destinations: [
        NavigationDestination(icon: Icon(Icons.home,color: selected_index == 0 ? Color.fromRGBO(55, 150, 111, 1.0) : const Color.fromARGB(255, 0, 0, 0)),label: 'Home'),
         NavigationDestination(icon: Icon(Icons.book_outlined,color: selected_index == 1 ? Color.fromRGBO(55, 150, 111, 1.0) : const Color.fromARGB(255, 0, 0, 0)),label: 'Content'),
          NavigationDestination(icon: Icon(Icons.school,color: selected_index == 2 ? Color.fromRGBO(55, 150, 111, 1.0) : const Color.fromARGB(255, 0, 0, 0)),label: 'Journal'),
           NavigationDestination(icon: Icon(Icons.person,color: selected_index == 3 ? Color.fromRGBO(55, 150, 111, 1.0) : const Color.fromARGB(255, 0, 0, 0)),label: 'Profile'),
      ]
      
      ),
     
    );
  }
}

class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
  late int userId;
  int? trophy;
  bool isLoading = true; // To track the loading state

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    userId = authProvider.userId;

    // Fetch the trophy value when the widget is initialized
    fetchLeastSteps(userId).then((value) {
      setState(() {
        trophy = value ?? 0; // If value is null, set trophy to 0
        isLoading = false; // Set loading to false once data is fetched
      });
    });
  }

  // Fetch least steps for user's friends
  Future<int?> fetchLeastSteps(int userId) async {
    final String apiUrl =
        'https://bewell.luddy.indianapolis.iu.edu/api/groups/$userId/friendsinfo';
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        List<Friend> friendsList =
            jsonList.map((json) => Friend.fromJson(json)).toList();
        if (friendsList.isNotEmpty) {
          var leastSteps = friendsList
              .map((friend) => friend.totalSteps ?? 0)
              .reduce((a, b) => a < b ? a : b);

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

  @override
  Widget build(BuildContext context) {
    final int stepsq = Provider.of<AuthProvider>(context).totalsteps;
    final value = stepsq / 10000 + 1;

    return DefaultTabController(
      length: 2, // Number of tabs
      initialIndex: 0, // Index of the default tab
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              size: 30,
              color: Color(0xFF37966F),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/activity', arguments: username);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.help_outline,
                size: 30,
                color: Color(0xFF37966F),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chat_bubble_outline_sharp,
                size: 30,
                color: Color(0xFF37966F),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Container(
              height: 50.0,
              child: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.orange,
                indicatorColor: Colors.orange,
                labelStyle: TextStyle(fontSize: 12.0), // Adjust font size
                tabs: [
                  Tab(
                      icon: Icon(Icons.directions_walk, size: 20),
                      text: "Freedom Trail"),
                  Tab(
                      icon: Icon(Icons.content_paste_sharp, size: 20),
                      text: "Knowledge Guide"),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Container(
                height: 70,
                padding: EdgeInsets.all(10),
                color: Color.fromARGB(255, 105, 176, 147),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/Quilt.png', width: 30, height: 30),
                        SizedBox(height: 3),
                        Text('Quilts ${value.toInt()}',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/Trophies.png',
                            width: 30, height: 30),
                        SizedBox(height: 3),
                        // Display the trophy value once it's loaded
                        isLoading
                            ? Text('Loading...',
                                style: TextStyle(color: Colors.white))
                            : Text('Trophies $trophy',
                                style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  StepperControllerDemo(),
                  home(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class home extends StatefulWidget {
  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  // List<Map<String, dynamic>> Links = [
  //   {'week': 'Week 1','name': 'Physical Activity', 'url':'https://www.youtube.com/watch?v=a2AxoQ97ldQ'},
  //   {'week': 'Week 2','name': 'Heart Healthy Food', 'url':'https://www.youtube.com/watch?v=AchlG09pq4U'},
  //   {'week': 'Week 3','name': 'Blood Pressure Management', 'url':'https://indiana.sharepoint.com/sites/O365-HealthFreedomTeam/Shared%20Documents/Forms/AllItems.aspx?csf=1&web=1&e=d9Zk8C&CT=1712526949331&OR=OWA%2DNT%2DMail&CID=9ab10032%2D54bf%2D97fa%2Dbea5%2Dd9e163c0ca40&FolderCTID=0x0120007AD60925A4A2D448918E04A06E35FF80&id=%2Fsites%2FO365%2DHealthFreedomTeam%2FShared%20Documents%2FGeneral%2FContent%20for%20App%2FJune%202023%2D%20Health%20Freedom%20CVH%20Education%20Resources%20%28Recent%20Share%29%2F03%5FWeek%203%2D%20Blood%20Pressure%20Management%2F01%5FAHA%20Infographic%5FConsequences%20of%20High%20Blood%20Pressure%2Epdf&viewid=30545aca%2D68ee%2D43d0%2Da32d%2D7de9245040d3&parent=%2Fsites%2FO365%2DHealthFreedomTeam%2FShared%20Documents%2FGeneral%2FContent%20for%20App%2FJune%202023%2D%20Health%20Freedom%20CVH%20Education%20Resources%20%28Recent%20Share%29%2F03%5FWeek%203%2D%20Blood%20Pressure%20Management'},
  //   {'week': 'Week 5','name': 'Portion Size, Meal Planning, Weight Management','url':'https://www.heart.org/en/healthy-living/healthy-eating/eat-smart/nutrition-basics/portion-size-versus-serving-size'},
  //   {'week': 'Week 6','name': 'Diabetes Prevention & Management', 'url':'https://www.cdc.gov/diabetes/managing/index.html'},
  // ];
   List<Map<String, dynamic>> Links = [
  {
    'week': 'Week 1',
    'name': 'Physical Activity',
    'url': 'https://www.youtube.com/watch?v=a2AxoQ97ldQ',
    'pdfFiles': [
  'assets/NHI/Week1/Warm_up.pdf',
  'assets/NHI/Week1/Physical_Excerise.pdf',
  'assets/NHI/Week1/Recommendation_For_Adults.pdf',
  'assets/NHI/Week1/Part_Of_Every_Day.pdf'
    ],
  },

  {
    'week': 'Week 2',
    'name': 'Heart Healthy Food',
    'url': 'https://www.youtube.com/watch?v=AchlG09pq4U',
    'pdfFiles': [
    'assets/NHI/Week2/Food_Swaps.pdf',
   'assets/NHI/Week2/African_Heritage_Diet.pdf',
   'assets/NHI/Week2/In_House_Food_Swaps.pdf',
   'assets/NHI/Week2/Infographic_Salt_Can_Be_Sneaky.pdf',
   'assets/NHI/Week2/Myths_About_Salt_(Sodium).pdf',
   'assets/NHI/Week2/Handout_Healthy_Food_Prep.pdf'
    ],
  },
  {
    'week': 'Week 3',
    'name': 'Blood Pressure Management',
    'url': 'https://indiana.sharepoint.com/sites/O365-HealthFreedomTeam/Shared%20Documents/...',
    'pdfFiles': [
    'assets/NHI/Week3/Handout_Getting_More_Potassium.pdf',
    'assets/NHI/Week3/Handout_Steps_to_Lower_BP.pdf',
    'assets/NHI/Week3/Handout_Stop_Stress_in_its_Tracks.pdf',
    'assets/NHI/Week3/How_to_Manage_BP.pdf',
    'assets/NHI/Week3/Infographic_Consequences_of_High_Blood_Pressure.pdf',
   'assets/NHI/Week3/Tips_for_Accurate_BP_Measurement.pdf'
    ],
  },
  {
    'week': 'Week 4',
    'name': 'Portion Size, Meal Planning, Weight Management',
    'url': 'https://www.heart.org/en/healthy-living/healthy-eating/eat-smart/nutrition-basics/portion-size-versus-serving-size',
    'pdfFiles': [
      'assets/NHI/Week4/1.pdf',
      'assets/NHI/Week4/2.pdf',
      'assets/NHI/Week4/3.pdf',
      'assets/NHI/Week4/4.pdf',
    ],
  },
  {
    'week': 'Week 5',
    'name': 'Diabetes Prevention & Management',
    'url': 'https://www.cdc.gov/diabetes/managing/index.html',
    'pdfFiles': [
      'assets/NHI/Week5/1.pdf',
      'assets/NHI/Week5/2.pdf',
      'assets/NHI/Week5/3.pdf',
      'assets/NHI/Week5/4.pdf',
    ],
  },
];

 
  int _currentStep = 0;
  
 
final _stepperData = List.generate(5, (index) => StepperItemData(
    id: '$index',
    content: ({
      'occupation': 'Flutter Development',
    }),

  )).toList();
   


  Future<void> _launchURL(String? url) async {
    if (url == null) {
      return;
    }
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
     
      }
      return;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to launch URL - $e');
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
    //  appBar: AppBar(
    //   automaticallyImplyLeading: false, 
    //   backgroundColor: Colors.white,
    //   title: Text("Knowledge Map",style: TextStyle(color: Colors.black),),
    //  ),
   
      body: 

      Padding(
        padding: const EdgeInsets.all(30.0),

        
        child: StepperListView(
          
          showStepperInLast: true,
          stepperData: _stepperData,
          stepAvatar: (_, data) {
          
            return PreferredSize(
              preferredSize: const Size.fromRadius(15),
              child: CircleAvatar(
               radius: 15,
               backgroundColor: Colors.orange[800],
              ),
            );
          },
          //    stepWidget: (_, data) {
          //   final stepData = data as StepperItemData;
          //   return PreferredSize(
          //     preferredSize: const Size.fromWidth(30),
          //     child: Text(
                
          //       style: TextStyle(
          //         color: Color.fromARGB(255, 255, 153, 0),
          //         fontSize: 15,
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   );
          // },
          stepContentWidget: (context, data) {
           
            final stepData = data as StepperItemData;
             final index = int.parse(stepData.id.toString());
            // final link = Links[index];
            
            return Column(
              children: [
                
                Container(
                  padding: EdgeInsets.only(top:8),
                  alignment: Alignment.bottomLeft,
                  child: Text("Week ${index+1}"),
                ),
                Container(
                  
                  padding: const EdgeInsets.only(left:
                    20,right: 20,top:35,bottom: 35
                  ),
                  child: ListTile(
                  
                    contentPadding: const EdgeInsets.all(5),
                    visualDensity: const VisualDensity(
                      vertical: -4,
                      horizontal: -4,
                    ),
                    // title: Text(Links[0]['name'].toString()),
                  
                    // title: Text("Week ${int.parse(stepData.id ?? '0') +1}"),
                    subtitle:  ExpansionTile(
                      
                      textColor: Colors.green[800],
                      iconColor: Colors.green[800],
                      backgroundColor: Color.fromRGBO(182, 215, 202, 1.0),
                      title: Text("Week ${index + 1}"),
                      children: [
                        ListTile(
                          title: Text("Health for Week ${index + 1}"),
                          subtitle: Text("Health in ${Links[index]['name']}"),
                         onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Knowledgemap(
        pdfFiles: Links[index]['pdfFiles'],
        url: Links[index]['url'],
      ),
    ),
  );
},
                        ),
       
                          ListTile(
                                  title: Text("Social Justices for Week ${index + 1}"),
                                  subtitle: Text("Social Justices in ${Links[index]['name']}"),
                                ),
                        ],
                      ),
  
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: theme.dividerColor,
                        width: 1,
                      ),
                    ),
                  ),
                  
                ),
              ],
            );
          },
          stepperThemeData: StepperThemeData(
            lineColor: Colors.green,
            lineWidth: 1.5,
          ),
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
  
}


class content extends StatelessWidget {
  const content({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar( elevation: 1,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              size: 30,
              color: Color(0xFF37966F),
            ),
            onPressed: () {
           
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.help_outline,
                size: 30,
                color: Color(0xFF37966F),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chat_bubble_outline_sharp,
                size: 30,
                color: Color(0xFF37966F),
              ),
            )
          ],),
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Color.fromARGB(222, 255, 214, 160),
                    padding: EdgeInsets.all(20),
                    child: Text("Quote Of The Day\n\nSuccess is a journey , not the destination. Doing is often more important than the outcome."), 
                  ),
                  Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Week 1',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('View all'),
                ),
              ],
                      ),
                      SizedBox(height: 16.0),
                      SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildHealthItem(
                    'Description',
                    'https://irisreading-media.s3-accelerate.amazonaws.com/2022/03/note-taking.jpg',
                  ),
                  _buildHealthItem(
                    'Video',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQBnuu29z0zycYuoPo0CXnyz6ngI188EDL6gV45f95e7vGsEJTLyRteJ-otdQIQgMoHkM&usqp=CAU',
                  ),
                  _buildHealthItem(
                    'Description',
                    'https://media.gq-magazine.co.uk/photos/64b7b522d8c083bf850297e7/16:9/w_2560%2Cc_limit/chilled-workout.jpg',
                  ),
                ],
              ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Week 2',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('View all'),
                ),
              ],
                      ),
                      SizedBox(height: 16.0),
                      SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildHealthItem(
                    'Description',
                    'https://www.osiaffiliate.com/blog/wp-content/uploads/2020/01/Product-Descriptions-opt.jpg',
                  ),
                  _buildHealthItem(
                    'Video',
                    'https://buzzflick.com/wp-content/uploads/2022/01/How-to-add-YouTube-Video-Description.jpg',
                  ),
                  _buildHealthItem(
                    'Description',
                    'https://lasvegastelemedicinedoctors.com/wp-content/uploads/2020/08/AdobeStock_338364178-1024x681.jpg',
                  ),
                ],
              ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Week 3',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('View all'),
                ),
              ],
                      ),
                      SizedBox(height: 16.0),
                      SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildHealthItem(
                    'Description',
                    'https://blog.engram.us/content/images/size/w760h400/2023/11/description.png',
                  ),
                  _buildHealthItem(
                    'Video',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUAu8tGsilqxlyIhTvsGBN0AvAX50s4zVkgKATWusUVA&s',
                  ),
                  _buildHealthItem(
                    'Description',
                    'https://www.usnews.com/object/image/0000018c-ef5b-d893-abbf-ff5be9260000/https-media-gettyimages-com-id-1425203502-photo-happy-and-joggers.jpg?update-time=1704823221313&size=responsive640',
                  ),
                ],
              ),
                      ),
                    ],
                  ),
                ),
                 Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Week 4',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('View all'),
                ),
              ],
                      ),
                      SizedBox(height: 16.0),
                      SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildHealthItem(
                    'Description',
                    'https://irisreading-media.s3-accelerate.amazonaws.com/2022/03/note-taking.jpg',
                  ),
                  _buildHealthItem(
                    'Video',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQBnuu29z0zycYuoPo0CXnyz6ngI188EDL6gV45f95e7vGsEJTLyRteJ-otdQIQgMoHkM&usqp=CAU',
                  ),
                  _buildHealthItem(
                    'Description',
                    'https://media.gq-magazine.co.uk/photos/64b7b522d8c083bf850297e7/16:9/w_2560%2Cc_limit/chilled-workout.jpg',
                  ),
                ],
              ),
                      ),
                    ],
                  ),
                ),
                 Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Week 5',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('View all'),
                ),
              ],
                      ),
                      SizedBox(height: 16.0),
                      SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildHealthItem(
                    'Description',
                    'https://irisreading-media.s3-accelerate.amazonaws.com/2022/03/note-taking.jpg',
                  ),
                  _buildHealthItem(
                    'Video',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQBnuu29z0zycYuoPo0CXnyz6ngI188EDL6gV45f95e7vGsEJTLyRteJ-otdQIQgMoHkM&usqp=CAU',
                  ),
                  _buildHealthItem(
                    'Description',
                    'https://media.gq-magazine.co.uk/photos/64b7b522d8c083bf850297e7/16:9/w_2560%2Cc_limit/chilled-workout.jpg',
                  ),
                ],
              ),
                      ),
                    ],
                  ),
                ),

                ],
                
              ),
            ),
            
            
          ),
    );
  }
   Widget _buildHealthItem(String description, String imageUrl) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class MenuItem {
  final String title;
  final String subtitle;
  final String icon;

  MenuItem({required this.title, required this.subtitle, required this.icon});
}
class journal extends StatefulWidget {
  
  @override
  State<journal> createState() => _journalState();
}

class _journalState extends State<journal> {
  @override
   void initState() {
    super.initState();
    
    fetchBloodPressureRecords();
    fetchglucoselevelRecords();
  }
List<Map<String, dynamic>> bloodPressureRecords = [];

   Future<List<Map<String, dynamic>>> getBloodPressureRecords(int userId) async {
  String apiUrl = 'https://bewell.luddy.indianapolis.iu.edu/api/blood-pressure/user/$userId/getmysaveddata';
  
  try {
    final http.Response response = await http.get(Uri.parse(apiUrl));
 
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      print(response.body);
      List<Map<String, dynamic>> records = data.cast<Map<String, dynamic>>();
       bloodPressureRecords = records;
       print(bloodPressureRecords);
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
  List<Map<String, dynamic>> glucoselevelRecords = [];
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
  
  Widget build(BuildContext context) {

    List<MenuItem> menu = [
    MenuItem (title: "BMI: Body Mass Index ",subtitle: "",icon:"assets/stethoscope.png"),
    MenuItem (title: "Blood Pressure",subtitle: "last recorded: ${Globals.lastentrybp}",icon:"assets/bloodpressure.png"),
    MenuItem (title: "Glucose Sugar Intake",subtitle: "last recorded: ${Globals.lastentryglucoselevel}",icon:"assets/gulcosesugar.png"),
    MenuItem (title: "Medications",subtitle: " ",icon:"assets/capsule-fill.png"),
    MenuItem (title: "Smoking",subtitle: " ",icon:"assets/smoking.png"),
    MenuItem (title: "Heart rate measurement",subtitle: " ",icon:"assets/heart-pulse-fill.png"),
    MenuItem (title: "Physical Activity",subtitle: " ",icon:"assets/run-fill.png"),
    MenuItem (title: "Water intake",subtitle: " ",icon:"assets/water.png"),
   
  ];

   void _onItemTap(int index) {
    if(index ==0){
     Future<void> _launchURL(String? url) async {
    if (url == null) {
      return;
    }
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
     
      }
      return;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to launch URL - $e');
      }
    }
  }
      String url = "https://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/bmicalc.htm";
      _launchURL(url);
          }
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => bloodpressure()),
        );
      }
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => gulcosesugar()),
        );
      }
    }
    return Scaffold(
       appBar: AppBar( elevation: 1,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              size: 30,
              color: Color(0xFF37966F),
            ),
            onPressed: () {
          
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.help_outline,
                size: 30,
                color: Color(0xFF37966F),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chat_bubble_outline_sharp,
                size: 30,
                color: Color(0xFF37966F),
              ),
            )
          ],),
      body: Padding(
        padding: const EdgeInsets.only(top:14.0,bottom: 10),
        child: Center(child: ListView.builder(itemCount: menu.length,itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              child: Container(
                alignment: Alignment.center,
                height: 72,
                width: 340,
                color: Color.fromRGBO(254, 252, 232, 1.0),
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                SizedBox(width: 40),
                  Image.asset( 
                          menu[index].icon,
                          width: 24, 
                          height: 24, 
                        ), 
                Expanded(
                    child: Center(
              child: Text('${menu[index].title}\n${menu[index].subtitle}',style: TextStyle(fontWeight: FontWeight.bold,)),
                    ),
                  ),
                    Icon(Icons.navigate_next),
                     SizedBox(width: 40),
                  ],
                )
              ),
              onTap: () => _onItemTap(index),
            )
          );
        })),
      ),
    );
  }
}

class Item {
  final String title;
  final String description;

  Item(this.title, this.description);
}

class profile extends StatelessWidget {
  

   profile({Key? key}) : super(key: key);

  @override
  //  final List<Item> items = [
  //   Item("A new hat for your avatar\n50 coins", "Get"),
  //   Item("New breakfast recipe\n50 coins", "Get"),
  //   Item("A new hat for your avatar\n50 coins", "Get"),
  //   Item("A new hat for your avatar\n50 coins", "Get"),
  // ];
  
  List<String> gridimgs = [
  'assets/Union.png',
  'assets/Union01.png',
  'assets/Union-2.png',
  'assets/Union-3.png',
  'assets/Union-4.png',
  'assets/Shoofly.png',
  'assets/stain.png',
  'assets/flyinggeese.png',
  'assets/drunkardpath.png',
  'assets/northstar.png',
];
List<String> contentMessages = [
  'The Monkey Wrench... \nSalves knew it was time to gather and pack away whatever tools they needed for the long journey to freedom. They also had to be prepared and hone their mental and spiritual tools, because they needed to be deceptive.',
  '..turns the wagon wheel..\nSalves knew that they should pack enough provisions to fit ina wagon and to be used in their long journeys. It was time to move on because the situation was getting dangerous.',
  'Crossroads',
  'Log Cabin\nSlaves knew that this symbol drawn on the ground indicated that a person was safe for them to get instructions. It also advised that slaves were seeking for shelter. According to Brackman (2006), this symbol also indicated that slaves should “establish a permanent residency in a “free” area”',
  "Bear's Paw\nSlaves knew that they should had to follow the bear tracks through the woods, in order remain safe, which would also lead them to water and food.",
  "Shoofly\nSlaves knew that shoofly was someone to be trusted or was someone among friends or a friendly guide who is nearby and could help them.",
  "stain bow tie\nSlaves knew that they had to dress up in different clothing to resemble free blacks.",
  "flying geese",
  "drunkard path",
  "north star",
];
   Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userId = authProvider.userId;
    final newtotalSteps = Provider.of<AuthProvider>(context).totalsteps;
    final int stepsq = Provider.of<AuthProvider>(context).totalsteps;
    final value = stepsq/10000+1;
    username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 255,
            color: const Color.fromARGB(255, 254, 252, 232),
            child: Stack(
              children: [
                Positioned(
                  top: 70,
                  left: MediaQuery.of(context).size.width / 2 - 50,
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
                                color: Color.fromARGB(255, 255, 81, 6),
                                width: 4,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.network(
                               'https://bewell.luddy.indianapolis.iu.edu/avatars/$userId/image' , // Path to your profile picture
                                fit: BoxFit.cover,
                              ),
                            ),
                            
                          ),
                         
                        ),
                       
                      ],
                    ),
                  ),
                ),
                 Positioned(
                     left: 170,
                          top: 180,
                          child: Container(
                            
                          alignment: Alignment.center,
                          child:Text.rich(
  TextSpan(
    children: [
      
      TextSpan(
        text: username,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        
        ),
      ),
    ],
  ),
))
                        )
                // Positioned(
                //   top: 210,
                //   left: MediaQuery.of(context).size.width / 2 - 50,
                //   child: Container(),
                // ),
              ],
            ),
          ),
        
          DefaultTabController(
            length: 2, // Number of tabs
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child:  TabBar(
                      tabs: [
                        Tab(text: 'Quilts\n    ${value.toInt()}',height: 60,),
                        Tab(text: 'Trophies\n   0',height: 60,),
                        // Tab(text: 'Coins\n  250',height: 60,),
                      ],
                      labelColor: Colors.orange, // Color of selected tab label
                      unselectedLabelColor: Colors.green, // Color of unselected tab label
                      indicatorColor: Colors.orange,
                      indicatorWeight: 4, // Color of tab indicator
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                      
        
                        Container(
                          color: Colors.white,
                       child: GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 3,
  mainAxisSpacing: 3,
  crossAxisCount: 4,
  children: List.generate(value.toInt(), (index) {
    // Determine if the cell should be orange based on the current step
    bool isOrange = index < (newtotalSteps/10000); // Adding 1 to match station numbering
    String imagePath = gridimgs[index]; // Get the image path for this cell
    String contentMessage = contentMessages[index]; // Get the content message for this cell

    return GestureDetector(
      onTap: isOrange
          ? () {
              // Show dialog only if the cell is orange
              _showDialog(context, imagePath, contentMessage);
            }
          : null, // Set onTap to null if cell is not orange
      child: Container(
        padding:  EdgeInsets.all(8),
        color: isOrange ? const Color.fromARGB(255, 255, 255, 255) : Colors.transparent,
        child: Image.asset(imagePath),
      ),
    );
  }),
),

                          
                        //   child: GridView.count(
                        //   primary: false,
                        //   padding: const EdgeInsets.all(20),
                        //   crossAxisSpacing: 3,
                        //   mainAxisSpacing: 3,
                        //   crossAxisCount: 4,
                        //   children: <Widget>[
                        //     GestureDetector(
                        //       onTap: (){
                        //         _showDialog(context, 'assets/Union.png', 'The Monkey Wrench... \nSalves knew it was time to gather and pack away whatever tools they needed for the long journey to freedom. They also had to be prepared and hone their mental and spiritual tools, because they needed to be deceptive.');
                        //       },
                        //       child: Container(
                        //         padding: const EdgeInsets.all(8),
                        //         color: Colors.orange[800],
                        //         child: Image.asset('assets/Union.png'),
      
                        //       ),
                        //     ),
                        //     GestureDetector(
                        //        onTap: (){
                        //         _showDialog(context, 'assets/Union01.png', '..turns the wagon wheel..\nSalves knew that they should pack enough provisions to fit ina wagon and to be used in their long journeys. It was time to move on because the situation was getting dangerous.');
                        //       },
                        //       child: Container(
                        //         padding: const EdgeInsets.all(8),
                        //         color: Colors.orange[800],
                        //         child: Image.asset('assets/Union01.png'),
                        //       ),
                        //     ),
                        //     GestureDetector(
                        //       onTap: (){
                        //         _showDialog(context, 'assets/Union-2.png', 'Crossroads');
                        //       },
                        //       child: Container(
                        //         padding: const EdgeInsets.all(8),
                        //         child: Image.asset('assets/Union-2.png'),
                        //       ),
                        //     ),
                        //     GestureDetector(
                        //        onTap: (){
                        //         _showDialog(context, 'assets/Union-3.png', 'Log Cabin\nSlaves knew that this symbol drawn on the ground indicated that a person was safe for them to get instructions. It also advised that slaves were seeking for shelter. According to Brackman (2006), this symbol also indicated that slaves should “establish a permanent residency in a “free” area”');
                        //       },
                        //       child: Container(
                        //         padding: const EdgeInsets.all(8),
                        //         child: Image.asset('assets/Union-3.png'),
                        //       ),
                        //     ),
                        //     GestureDetector(
                        //       onTap: (){
                        //         _showDialog(context, 'assets/Union-4.png', "Bear's Paw\nSlaves knew that they should had to follow the bear tracks through the woods, in order remain safe, which would also lead them to water and food.");
                        //       },
                        //       child: Container(
                        //         padding: const EdgeInsets.all(8),
                        //         child: Image.asset('assets/Union-4.png'),
                        //       ),
                        //     ),
                        //     GestureDetector(
                        //        onTap: (){
                        //         _showDialog(context, 'assets/Shoofly.png', "Shoofly\nSlaves knew that shoofly was someone to be trusted or was someone among friends or a friendly guide who is nearby and could help them.");
                        //       },
                        //       child: Container(
                                
                        //         padding: const EdgeInsets.all(8),
                        //          child: Image.asset('assets/Shoofly.png'),
                        //       ),
                        //     ),
                        //      GestureDetector(
                        //        onTap: (){
                        //         _showDialog(context, 'assets/stain.png', "stain bow tie\nSlaves knew that they had to dress up in different clothing to resemble free blacks.");
                        //       },
                        //        child: Container(
                        //         padding: const EdgeInsets.all(8),
                        //         child: Image.asset('assets/stain.png'),),
                        //      ),
                        //     GestureDetector(
                        //       onTap: (){
                        //         _showDialog(context, 'assets/flyinggeese.png', "flying geese");
                        //       },
                        //       child: Container(
                        //         padding: const EdgeInsets.all(8),
                        //         child: Image.asset('assets/flyinggeese.png'),
                        //       ),
                        //     ),
                        //      GestureDetector(
                        //        onTap: (){
                        //         _showDialog(context, 'assets/drunkardpath.png', "drunkard path");
                        //       },
                        //        child: Container(
                        //         padding: const EdgeInsets.all(8),
                        //         child: Image.asset('assets/drunkardpath.png'),
                        //                                  ),
                        //      ),
                        //     GestureDetector(
                        //        onTap: (){
                        //         _showDialog(context, 'assets/northstar.png', "north star");
                        //       },
                        //       child: Container(
                        //         padding: const EdgeInsets.all(8),
                        //         child: Image.asset('assets/northstar.png'),
                        //       ),
                        //     ),
                           
                        //   ],
                        // ),
                        ),
                         Container(
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(height: 40),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 180,
                                  width: double.infinity,
                                  child:  Center(
                                    child: Column(
                                      children: [
                                        Column(                            
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(width: 30,),
                                                   Image.asset('assets/Trophies.png', width: 30, height: 30), 
                                                SizedBox(width: 30,),
                                                Row(
                                              children: [
                                                 Text('Trip to the Hubbard House\nUnderground Railroad Museum',style:TextStyle(fontWeight: FontWeight.bold)),
                                              ],
                                            )
                                              ],
                                            ),
                                            ],
                                        ),
                                       SizedBox(height: 20),
                                        Text('Congratualtions! You have earned a trophy and a\nchance to visit the Hubbard House Underground\nRailroad Museum.'),
                                        SizedBox(height: 10),
                                        ElevatedButton(child: Text('Take the trip',style: TextStyle(color: Colors.green),),onPressed: null)
                                      ], 
                                    )
                                    ),
                                ),
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 20,
                                  width: double.infinity,
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                  child: Center(child:Column(children: [
                                 Row(
                                  children: [
                                 Text("  Upcoming",style:TextStyle(fontWeight: FontWeight.bold)),
                                 SizedBox(width:MediaQuery.of(context).size.width * 0.60),
                                  Row(
                                                children: [
                                                   Text('View all',style:TextStyle(fontWeight: FontWeight.bold)),
                                                ],   
                                  )     
                                  ],
                                
                                 )
                                  ],)),
                                ),
                              ),
                              SizedBox(height: 20), // Add space between containers
                              // Container(
                              //   height: 50,
                              //   width: 100,
                              //   color: Colors.green,
                              //   child: Center(child: Text('Container 3')),
                              // ),
                            ],
                          ),
                        ),
                      ),
                        // Contents of Tab 3
        //                 Container(
        //                   color: Color.fromARGB(255, 255, 255, 255),
        //                   child: Center(child:Container(
        //                      child: ListView.builder(
        //   itemCount: items.length,
        //   itemBuilder: (context, index) {
        //      return ListTile(
              
        //       title: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: <Widget>[
        //           Text(items[index].title),
        //           Text(items[index].description),
        //         ],
        //       ),
        //     );
            
        //   },
        // ),
        //                   )),
        //                 ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _showDialog(BuildContext context, String imageName, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('About This Quilt'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                imageName,
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20),
              Text(text),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green[800], 
    foregroundColor: Colors.white,
  ),
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
              
            ),
          ],
        );
      },
    );
  }
}



class bloodpressure extends StatefulWidget {
  
  const bloodpressure({super.key});

  @override
  

  State<bloodpressure> createState() => _bloodpressureState();
}

class _bloodpressureState extends State<bloodpressure> {
TextEditingController date = TextEditingController();
TextEditingController systolic = TextEditingController();
TextEditingController diastolic = TextEditingController();
TextEditingController pulse = TextEditingController();
TextEditingController weight = TextEditingController();
 
   Future<void> addBloodPressureRecord(int userId) async {
    String apiUrl = 'https://bewell.luddy.indianapolis.iu.edu/api/blood-pressure/add';

    // Sample request body
    Map<String, dynamic> requestBody = {
      'date': date.text,
      'systolic': systolic.text,
      'diastolic': diastolic.text,
      'pulse': pulse.text,
      'weight': weight.text,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl + '?userId=$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 201) {
        print('Blood pressure record added successfully');
        
      } else {
        print('Failed to add blood pressure record');
      }
    } catch (error) {
      print('Error adding blood pressure record: $error');
    }
  }
  
  
  Widget build(BuildContext context) {
  date.text = '';
  systolic.text = '';
  diastolic.text = '';
  pulse.text = '';
  weight.text = '';
final authProvider = Provider.of<AuthProvider>(context);
    final userId = authProvider.userId;
    return Scaffold(
      
      appBar: AppBar(
         actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.history,
        color: Colors.black,
      ),
      onPressed: () {
        bloodpressurehistory();
        Navigator.pushNamed(context, '/historybloodpressure');
      },
    )
  ],
        title: Text("Blood Pressure"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
           
          Container(
            
            child: Text("DATE",style: TextStyle(fontWeight: FontWeight.bold),),alignment: Alignment.topLeft),
           
            Padding(padding: EdgeInsets.only(top:10),
            child: Container(
              child: TextField(
                controller:date ,
                decoration: InputDecoration(
                 enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
                  hintText: 'mm/dd/yy',
                  suffixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Icon(
            Icons.calendar_month,color:  const Color(0xFF37966F),
          ),
        ),
                ),
              ),
            ),
            ),
            Padding(padding: EdgeInsets.only(top:20)),
            Container(
            child: Text("SYSTOLIC",style: TextStyle(fontWeight: FontWeight.bold),),alignment: Alignment.topLeft),
            
            Container(
            child: Text("mm Hg(upper number)"),alignment: Alignment.topLeft),

            Padding(padding: EdgeInsets.only(top:10),
            child: Container(
              child: TextField(
                controller: systolic,
                decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
                  border: OutlineInputBorder(),
                  hintText: 'Systolic',
                ),
              ),
            ),
            ),
            Padding(padding: EdgeInsets.only(top:20)),
            Container(
            child: Text("DIASTOLIC",style: TextStyle(fontWeight: FontWeight.bold),),alignment: Alignment.topLeft),
            Container(
            child: Text("mm Hg(lower number)"),alignment: Alignment.topLeft),
            Padding(padding: EdgeInsets.only(top:10),
            child: Container(
              child: TextField(
                controller: diastolic,
                decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
                  border: OutlineInputBorder(),
                  hintText: 'Diastolic',
                ),
              ),
            ),
            ),
             Padding(padding: EdgeInsets.only(top:20)),
            Container(
            child: Text("PULSE",style: TextStyle(fontWeight: FontWeight.bold),),alignment: Alignment.topLeft),
            Container(
            child: Text("bpm"),alignment: Alignment.topLeft),
            Padding(padding: EdgeInsets.only(top:10),
            child: Container(
              child: TextField(
                controller: pulse,
                decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
                  border: OutlineInputBorder(),
                  hintText: 'Pulse',
                ),
              ),
            ),
            ),
             Padding(padding: EdgeInsets.only(top:20)),
            Container(
            child: Text("Weight",style: TextStyle(fontWeight: FontWeight.bold),),alignment: Alignment.topLeft),
            Container(
            child: Text("lbs"),alignment: Alignment.topLeft),
            Padding(padding: EdgeInsets.only(top:10),
            child: Container(
              child: TextField(
                controller: weight,
                decoration: const InputDecoration(
                   enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Color(0xFF37966F)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Color(0xFF37966F)),
      ),
                  border: OutlineInputBorder(),
                  hintText: 'Weight',
                ),
              ),
            ),
            ),
            Padding(padding: EdgeInsets.only(top:10)),
            ElevatedButton(
    onPressed:(){
      addBloodPressureRecord(userId);
      Navigator.pop(context);
      
  } , child: Text("Next",style:TextStyle(fontSize: 17) ,),
    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF37966F))),         
          ],
        ),
      ),
    
    );
  }
}

class gulcosesugar extends StatefulWidget {
  const gulcosesugar({super.key});

  @override
  State<gulcosesugar> createState() => _gulcosesugarState();
}

class _gulcosesugarState extends State<gulcosesugar> {
  TextEditingController date = TextEditingController();
TextEditingController bloodsugar = TextEditingController();
TextEditingController insulin = TextEditingController();
TextEditingController carbs = TextEditingController();
TextEditingController mealdescription = TextEditingController();
  

    Future<void> addgulcosesugarRecord(int userId) async {
    String apiUrl = 'https://bewell.luddy.indianapolis.iu.edu/api/glucose-level/add';

    // Sample request body
    Map<String, dynamic> requestBody = {
      'date': date.text,
      'bloodGlucose': bloodsugar.text,
      'insulinUnits': insulin.text,
      'carbsGrams': carbs.text,
      'mealDescription': mealdescription.text,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl + '?userId=$userId'
        ),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );
       print('Response status code: ${response.statusCode}');
       print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        print('glucose record added successfully');
        
      } else {
        print('Failed to add glucose record');
      }
    } catch (error) {
      print('Error adding glucose record: $error');
    }
  }
  Widget build(BuildContext context) {

  date.text = '';
  bloodsugar.text = '';
  insulin.text = '';
  carbs.text = '';
  mealdescription.text = '';

final authProvider = Provider.of<AuthProvider>(context);
    final userId = authProvider.userId;
    return Scaffold(
      
      appBar: AppBar(
         actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.history,
        color: Colors.black,
      ),
      onPressed: () {
        bloodpressurehistory();
        Navigator.pushNamed(context, '/historyglucoselevel');
      },
    )
  ],
        title: Text("Glucose Sugar"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
           
          Container(
            
            child: Text("DATE",style: TextStyle(fontWeight: FontWeight.bold),),alignment: Alignment.topLeft),
           
            Padding(padding: EdgeInsets.only(top:10),
            child: Container(
              child: TextField(
                controller:date ,
                decoration: InputDecoration(
                 enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
                  hintText: 'mm/dd/yy',
                  suffixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Icon(
            Icons.calendar_month,color:  const Color(0xFF37966F),
          ),
        ),
                ),
              ),
            ),
            ),
            Padding(padding: EdgeInsets.only(top:20)),
            Container(
            child: Text("Blood Gulcose",style: TextStyle(fontWeight: FontWeight.bold),),alignment: Alignment.topLeft),
            
            Container(
            child: Text("mg/dl"),alignment: Alignment.topLeft),

            Padding(padding: EdgeInsets.only(top:10),
            child: Container(
              child: TextField(
                controller: bloodsugar,
                decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
                  border: OutlineInputBorder(),
                  hintText: 'Blood Gulcose',
                ),
              ),
            ),
            ),
            Padding(padding: EdgeInsets.only(top:20)),
            Container(
            child: Text("INSULIN",style: TextStyle(fontWeight: FontWeight.bold),),alignment: Alignment.topLeft),
            Container(
            child: Text("Units"),alignment: Alignment.topLeft),
            Padding(padding: EdgeInsets.only(top:10),
            child: Container(
              child: TextField(
                controller: insulin,
                decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
                  border: OutlineInputBorder(),
                  hintText: 'Insulin',
                ),
              ),
            ),
            ),
             Padding(padding: EdgeInsets.only(top:20)),
            Container(
            child: Text("CARBS",style: TextStyle(fontWeight: FontWeight.bold),),alignment: Alignment.topLeft),
            Container(
            child: Text("gms"),alignment: Alignment.topLeft),
            Padding(padding: EdgeInsets.only(top:10),
            child: Container(
              child: TextField(
                controller: carbs,
                decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: const Color(0xFF37966F)),
      ),
                  border: OutlineInputBorder(),
                  hintText: 'Carbs',
                ),
              ),
            ),
            ),
             Padding(padding: EdgeInsets.only(top:20)),
            Container(
            child: Text("Meal Description",style: TextStyle(fontWeight: FontWeight.bold),),alignment: Alignment.topLeft),
            Container(
            child: Text("Describe"),alignment: Alignment.topLeft),
            Padding(padding: EdgeInsets.only(top:10),
            child: Container(
              child: TextField(
                controller: mealdescription,
                decoration: const InputDecoration(
                   enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Color(0xFF37966F)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Color(0xFF37966F)),
      ),
                  border: OutlineInputBorder(),
                  hintText: 'Description',
                ),
              ),
            ),
            ),
            Padding(padding: EdgeInsets.only(top:10)),
            ElevatedButton(
    onPressed:(){
      addgulcosesugarRecord(userId);
      Navigator.pop(context);
      
  } , child: Text("Next",style:TextStyle(fontSize: 17) ,),
    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF37966F))),         
          ],
        ),
      ),
    
    );
  }
}