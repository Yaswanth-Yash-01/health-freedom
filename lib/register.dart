 import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}
class _registerState extends State<register> {
   bool _showTip = false;
   Widget _helpIcon = Image.asset('assets/help.png',width: 65.0, height: 71.0);
  void _toggleTipVisibility() {
    setState(() {
      _showTip = !_showTip;
      _helpIcon = _showTip 
          ? Image.asset('assets/help1.png', width: 60.0, height: 71.0)
          : Image.asset('assets/help.png', width: 60.0, height: 71.0);
    });
  }
   
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _dob = TextEditingController();
   final TextEditingController _id = TextEditingController();
 String? _password;
  String? _confirmPassword;
void _checkPasswordMatch() {
    setState(() {
      _password = _passwordController.text;
      _confirmPassword = _confirmPasswordController.text;
    });
  }
Future<Map<String, dynamic>> postData() async {
  var url = Uri.parse('https://bewell.luddy.indianapolis.iu.edu/registration/register');
  var data = {
    'username': _username.text,
    'password': _passwordController.text,
    'firstName': _firstname.text,
    'lastName': _lastname.text,
    'emailId': _email.text,
    'dob': _dob.text,
    'confirmPassword': _confirmPasswordController.text,
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
    
  
    if (response.statusCode == 200 || response.statusCode == 201) {
    
      final responseData = jsonDecode(response.body);
      print("success");
      return responseData;
    } else {
      throw Exception('Failed to post data: ${response.statusCode} ${response.body}');
    }
  } catch (error) {
   
    throw Exception('Error posting data: $error');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: 
      
      
      Stack(
        
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 60),
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
            color : Color.fromRGBO(55, 150, 111, 0.10000000149011612),
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
            color : Color.fromRGBO(55, 150, 111, 0.10000000149011612),
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
            color : Color.fromRGBO(55, 150, 111, 0.10000000149011612),
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
            color : Color.fromRGBO(55, 150, 111, 0.10000000149011612),
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
            color : Color.fromRGBO(55, 150, 111, 0.10000000149011612),
            )
            )
            ),
            
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          
                  
                  const SizedBox(height: 20.0), 
                  const Row(
                    children: [
                      Text(
                        'Hello there! Welcome to \nyour journey towards \nhealth freedom', 
                        style: TextStyle(fontSize: 24,letterSpacing: 0.2,
              fontWeight: FontWeight.normal,
              height: 1.2,color:Color(0xFF37966F) ),
                      ),
                    ],
                  ),
          
                  Padding(
                    padding: const EdgeInsets.only(left: 240,top: 5),
                    child: Row(
                      children: [
                           Container(
                        width: 65,
                        height: 71,
                        
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                          top: 0,
                          left: 5,
                          child: Container(
                        width: 54,
                        height: 54,
                        
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                          width: 54,
                          height: 60,
                         
                        )
                        ),
                          ]
                        )
                      )
                        ),Positioned(
                          top: 0,
                          left: 0,
                          child: GestureDetector(
                            onTap: _toggleTipVisibility,
                            child: _helpIcon
                          ),
                        ),
                          ]
                        )
                      )
                      ],
                    ),
                  ),
                   Padding(padding: EdgeInsets.only(top:10)),
            if (_showTip)
                  Positioned(
                    bottom: 20.0,
                    left: 20.0,
                    right: 20.0,
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                         color: Color(0xFFFEFCE8),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'Enter below details to register an account with us',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                const SizedBox(height: 20.0), 
                 TextFormField(
            controller: _email,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCCCCCC)), 
              ),
            ),
          ),
          
          const SizedBox(height: 10.0),
          
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            onChanged: (value) {
              _checkPasswordMatch();
            },
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4CAF50)), 
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: true,
            onChanged: (value) {
              _checkPasswordMatch();
            },
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4CAF50)), 
              ),
              errorText: _password != _confirmPassword ? "Passwords don't match" : null,
            ),
          ),
          const SizedBox(height: 10.0),
           TextFormField(
            
            controller: _username,
            obscureText: false,
            decoration: InputDecoration(
              labelText:
           
          'Username',
              border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4CAF50)), 
              ),
            ),
          ),
          const SizedBox(height: 10.0),
           TextFormField(
            
            controller: _firstname,
            obscureText: false,
            decoration: InputDecoration(
              labelText:
           
          'Firstname',
              border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4CAF50)), 
              ),
            ),
          ),
          const SizedBox(height: 10.0),
           TextFormField(
            
            controller: _lastname,
            obscureText: false,
            decoration: InputDecoration(
              labelText:
           
          'Lastname',
              border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4CAF50)), 
              ),
            ),
          ),
          const SizedBox(height: 10.0),
           TextFormField(
            
            controller: _dob,
            obscureText: false,
            decoration: InputDecoration(
              labelText:
           
          'Date Of Birth',
              border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4CAF50)), 
              ),
            ),
          ),
       
          Padding(padding: EdgeInsets.only(top:30)),
          // SizedBox(
          //   width: 120,
          //   child:  
          // ),
             
                ],
                
              ),
               
              
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(bottom:20),
             child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                     
                onPressed:(){
                
                postData();
                print(_email);
                print(_password);
                print(_dob);
                if(_confirmPassword == _password){
                 Navigator.pop(context);
                
                }
                 print("Password Does not-----");
              } , child: Text("Submit",style:TextStyle(fontSize: 17) ,),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF37966F))),
              ),
           ),
        ],
      ),
      
    );
  }
}