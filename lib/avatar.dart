import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/AuthProvider.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_2/contestform.dart';
import 'package:provider/provider.dart';
import 'package:http_parser/http_parser.dart' as http_parser; 


class ChooseAvatarPage extends StatefulWidget {
  const ChooseAvatarPage({super.key});

  @override
  State<ChooseAvatarPage> createState() => _ChooseAvatarPageState();
}

class _ChooseAvatarPageState extends State<ChooseAvatarPage> {

  String? selectedPersonName;
  String? selectedDescription;
  String? selectedImagePath;

  void selectAvatar(String personName, String description, String imagePath) {
    setState(() {
      selectedPersonName = personName;
      selectedDescription = description;
      selectedImagePath = imagePath;
    });
  }


  void handleNextButtonPress() {
    if (selectedPersonName != null &&
        selectedDescription != null &&
        selectedImagePath != null) {

      print("Selected Avatar:");
      print("Name: $selectedPersonName");
      print("Description: $selectedDescription");
      print("Image Path: $selectedImagePath");

   
    } else {
     
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an avatar')),
      );
    }
  }
 
  Future<void> postAvatar(BuildContext context) async {
  final authProvider = Provider.of<AuthProvider>(context, listen: false);
  final userId = authProvider.userId.toString();
  String apiUrl = 'https://bewell.luddy.indianapolis.iu.edu/avatars';

  try {
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.fields['userId'] = userId;
    request.fields['title'] = selectedPersonName!;
    request.fields['description'] = selectedDescription!;

    ByteData imageData = await rootBundle.load(selectedImagePath!);
    List<int> imageBytes = imageData.buffer.asUint8List();

    request.files.add(http.MultipartFile.fromBytes(
      'file',
      imageBytes,
      filename: 'avatar.jpg',
      contentType: http_parser.MediaType('image', 'jpeg'),
    ));

    var response = await request.send();
    var result = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      print('Avatar uploaded successfully');
      var avatarId = result.body;
      
      String apiurl = 'https://bewell.luddy.indianapolis.iu.edu/users/$userId/$avatarId';
      try {
        http.Response response = await http.put(Uri.parse(apiurl));

        if (response.statusCode == 200) {
          print('User ID posted successfully');
          Navigator.pushNamed(context, '/six1', arguments: username);
        } else {
          print('Failed to post User ID. Error ${response.statusCode}');
        }
      } catch (e) {
        print('Error posting User ID: $e');
      }
    } else {
      print('Failed to upload avatar. Error ${response.statusCode}');
      print('Response body: ${result.body}');
    }
  } catch (e) {
    print('Error uploading avatar: $e');
  }
}

  Future<void> addtogroup(int userId) async{
  String apiUrl = "https://bewell.luddy.indianapolis.iu.edu/api/groups/$userId/add-to-group";
    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        print('User ID posted successfully');
      } else {
        print('Failed to post User ID 8085. Error ${response.statusCode}');
      }
    } catch (e) {
      print('Error posting User ID: $e');
    }
  }
  


 late String username;

  @override
  Widget build(BuildContext context) {
     final authProvider = Provider.of<AuthProvider>(context);
    final userId = authProvider.userId;
     username = ModalRoute.of(context)!.settings.arguments as String;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
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
                            borderRadius: BorderRadius.circular(4),
                            color: Color.fromRGBO(233, 97, 55, 1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 51.427734375,
                        child: Container(
                          width: 44.081634521484375,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color.fromRGBO(233, 97, 55, 1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 99.857421875,
                        child: Container(
                          width: 44.081634521484375,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color.fromRGBO(233, 97, 55, 1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 151.28515625,
                        child: Container(
                          width: 44.081634521484375,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color.fromRGBO(233, 97, 55, 1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 200.71484375,
                        child: Container(
                          width: 46.28571319580078,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color.fromRGBO(55, 150, 111, 0.1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 252,
                        child: Container(
                          width: 46.28571319580078,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color.fromRGBO(55, 150, 111, 0.1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 80.0, left: 16.0, right: 20,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Choose your Avatar',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                              letterSpacing: 0.0,
                              height: 29.0 / 24.0,
                            ),
                          ),
                          Text(
                            'Your avatar is the abolitionist you are walking in the honour of, choose wisely.',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                              height: 22.0 / 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GroupWidget(
                            personName: "Harriet Tubman",
                            description: "An American abolitionist and conductor on the Underground Railroad, who helped enslaved people escape to freedom.",
                            imagePath: "assets/avatars/harriet.png",
                            isSelected: selectedPersonName == "Harriet Tubman",
                            onSelect: selectAvatar,
                          ),
                          GroupWidget(
                            personName: "John Brown",
                            description: "John Brown was a leading figure in the abolitionist movement in the pre-Civil War United States. Unlike many anti-slavery activists, he was not a pacifist and believed in aggressive action.",
                            imagePath: "assets/avatars/John.png",
                            isSelected: selectedPersonName == "John Brown",
                            onSelect: selectAvatar,
                          ),
                          GroupWidget(
                            personName: "Frederick Douglass",
                            description: "Born into slavery in 1818, Frederick Douglass escaped as a young man and became a leading voice in the abolitionist movement. For his entire life, he fought for equality and justice for all people.",
                            imagePath: "assets/avatars/frederick.png",
                            isSelected: selectedPersonName == "Frederick Douglass",
                            onSelect: selectAvatar,
                          ),
                          GroupWidget(
                            personName: "Sojourner Truth",
                            description: "A former slave, Sojourner Truth became an outspoken advocate for abolition, temperance, and civil and women’s rights in the nineteenth century.",
                            imagePath: "assets/avatars/sojourner.png",
                            isSelected: selectedPersonName == "Sojourner Truth",
                            onSelect: selectAvatar,
                          ),
                          GroupWidget(
                            personName: "James Garfield",
                            description: "Advocated for harsh measures against Confederacy & supported Civil Rights Acts as Congressman. He promoted education for African Americans but shifted focus from voting rights to broader equality.",
                            imagePath: "assets/avatars/james.png",
                            isSelected: selectedPersonName == "James Garfield",
                            onSelect: selectAvatar,
                          ),
                          GroupWidget(
                            personName: "Harriet Beecher Stowe",
                            description: "Wrote Uncle Toms Cabin, a widely read antislavery novel that ignited public outrage and sympathy for enslaved people. Became a powerful voice for abolition, fundraising, and influenced public opinion.",
                            imagePath: "assets/avatars/beecher.png",
                            isSelected: selectedPersonName == "Harriet Beecher Stowe",
                            onSelect: selectAvatar,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: Column(
                        children: [
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.50/2,
                                height: 1.0,
                                color: Color.fromRGBO(217, 217, 217, 1),
                              ),
                              const Text(
                                "Or",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                width: 180.0,
                                height: 1.0,
                                color: Color.fromRGBO(217, 217, 217, 1),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      color: Colors.white,
                      child: const Column(
                        children: [
                          Text(
                            "Walk in the honour of your friends",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(66, 103, 90, 1),
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Type your name here",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Positioned(
                        bottom: 0,
                        left: (MediaQuery.of(context).size.width - 161) / 2,
                        child: Container(
                          width: 161,
                          height: 36.11,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(55, 150, 111, 1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextButton(
                             onPressed: () {
                              addtogroup(userId);

                              postAvatar(context);    

           Navigator.pushNamed(context, '/six1',arguments: username);
  },
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GroupWidget extends StatelessWidget {
  final String personName;
  final String description;
  final String imagePath;
  final bool isSelected;
  final void Function(String, String, String) onSelect;

  const GroupWidget({
    Key? key,
    required this.personName,
    required this.description,
    required this.imagePath,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(personName, description, imagePath);
      },
      child: Container(
        width: 250.0,
        height: 316.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: [
            Positioned(
              top: 58.0,
              left: 0.0,
              child: Container(
                width: 252.0,
                height: 269.0,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Color.fromRGBO(233, 97, 55, 1)
                      : Color.fromRGBO(250, 247, 202, 0.973),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 60.0, left: 16.0, right: 16.0, bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        personName,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 11.0,
              left: 76.0,
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 0.0),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
