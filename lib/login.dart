 import 'package:flutter/material.dart';
import 'package:flutter_application_2/AuthProvider.dart';
 import 'dart:async';
 import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'AuthProvider.dart';
import 'package:flutter/animation.dart';
import 'avatar.dart';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> with TickerProviderStateMixin {
  
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
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
 
late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward(); // Start the animation
  }
  @override
  Widget build(BuildContext context) {
       final authProvider = Provider.of<AuthProvider>(context, listen: false);
    // final userId = authProvider.userId;
    // 
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
              FadeTransition(
                opacity: _opacityAnimation,
                child: const Row(
                  children: [
                    Text(
                      'Hello there! Welcome to \nyour journey towards \nhealth freedom', 
                      style: TextStyle(fontSize: 24,letterSpacing: 0.2,
                        fontWeight: FontWeight.normal,
                        height: 1.2,color:Color(0xFF37966F) ),
                    ),
                  ],
                ),
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
                        child: FadeTransition
                        (opacity: _opacityAnimation,child: _helpIcon)
                      ),
                    ),
                      ]
                    )
                  )
                  ],
                ),
              ),
         
              Row(
                children: [
                  SizedBox(height: 70,)
                ],
              ),
      
               const SizedBox(height: 20.0), 
             TextFormField(
        controller: _username,
        decoration: InputDecoration(
          labelText: 'Username',
          border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFCCCCCC)), 
          ),
        ),
      ),
      
      const SizedBox(height: 10.0),
      
      TextFormField(
        
        controller: _password,
        obscureText: true,
        decoration: InputDecoration(
          labelText:
       
      'Password',
          border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF4CAF50)), // Hex code for green
          ),
        ),
      ),
      Padding(padding: EdgeInsets.only(top:30)),
      SizedBox(
  width: 120,
  child: ElevatedButton(
  
     onPressed: () async {
      
         
         
              try {
                final authProvider =
                    Provider.of<AuthProvider>(context, listen: false);
                final responseData = await authProvider.login(
                  _username.text,
                  _password.text,
                );
               final ui = (responseData['id']);
                print(responseData);
                
               
              
                if (responseData != null) {

              
                 if(responseData['avatarId'] !=  null){
              
                  Navigator.pushNamed(context, '/journal_menu1',arguments: responseData['username']);
                 }else{
                  Navigator.pushNamed(context, '/avatar',arguments: responseData['username']);
                 }
    
                  
                } else {
                  // Handle login failure
                  print('Login failed');
                }
              } catch (error) {
                // Handle error
                print('Error: $error');
              }
           
            },
    child: Text("Login", style: TextStyle(fontSize: 17)),
    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF37966F)),
  ),
),

      SizedBox(height: 10,),
      Padding(padding: EdgeInsets.only(top:30)),
      SizedBox(
        width: 120,
        child:   ElevatedButton(
          
      onPressed:() async {
       
          Navigator.pushNamed(context, '/register');
        } , child: Text("Register",style:TextStyle(fontSize: 17) ,),
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF37966F))),
      ),
      Padding(padding: EdgeInsets.only(top:30)),
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
                    'Enter your email ID in the first box and your password in the second box. Then click “NEXT” to complete the login process and acess your account.',
                    style: TextStyle(fontSize: 16.0),
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