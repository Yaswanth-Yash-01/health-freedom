import 'package:flutter/material.dart';

import 'package:flutter/animation.dart';



class onboarding extends StatefulWidget {
  const onboarding({Key? key}) : super(key: key);

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> with TickerProviderStateMixin{
 late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward(); 
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 515,
              child: Image.asset(
                "assets/vector.png",
                width: double.infinity, 
                fit: BoxFit.contain, 
              ),
            ),
            SizedBox(height: 50),
            FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                
                  
                      child: const Text(
                        "Hey! I am NORTH \nSTAR , your guide \non this journey. ",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 34,letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,color: Color(0xFF37966F)),
                      ), 
              
              ),
            ),
      SizedBox(
        height: 50,
      ),
       Container(
    padding: EdgeInsets.all(20),
    alignment: Alignment.bottomRight,
    child: FloatingActionButton(
      backgroundColor: const Color(0xFF37966F),
      
     onPressed: () { 
      
      Navigator.pushNamed(context, '/login');
      
     },
      child: Icon(Icons.arrow_right),
      
  ),
  ),
            
          ],
        ),
        
      ),
    );
  
  }
}
