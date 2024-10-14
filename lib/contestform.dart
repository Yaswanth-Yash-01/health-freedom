import 'package:flutter/material.dart';

class contestform extends StatefulWidget {
  const contestform({super.key});

  @override
  State<contestform> createState() => _contestformState();
}

class _contestformState extends State<contestform> {
  final String content = 'These Terms of Use govern your access to and use of Health Affairs- digital products and services, including Health Affairs, healthaffairs.org, Health Affairs mobile applications, grantwatch.org, and narrativematters.org, Health Affairs Insider, and all articles, files or supplementary materials contained therein (“Content”) and, unless other terms and conditions expressly apply, any other electronic service of Health Affairs that may be made available from time-to-time (each a “Service” and collectively “Services”). Any use of the Services shall constitute acceptance of these Terms of Use. Unless otherwise indicated, the Content available through the Services is protected by copyright and may be used only in accordance with copyright and other applicable laws. Content includes, but is not limited to, text, graphics, videos, audio, design, and layout, and is owned and copyrighted by Health Affairs. Content available through the Services is for personal noncommercial use only. ';
  
   bool? isChecked = false;
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
               Container(
                padding: EdgeInsets.only(top:20),
        width: 343,
        height: 105,
        
        child: Stack(
          children: <Widget>[
            Positioned(
          top: 0,
          left: 0,
          child: Text('Consent Review', textAlign: TextAlign.left, style: TextStyle(
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
          child: Text('You may be sharing sensitive data with this application.\n Learn how the app will handle your data by \n reviewing it’s terms of service and policies', textAlign: TextAlign.left, style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Roboto',
          fontSize: 14,
          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
          fontWeight: FontWeight.normal,
          height: 1.5714285714285714
        ),)
        ),
          ]
        )
          ),
     Container(
      padding: EdgeInsets.only(top:20),
                width: 342,
                height: 405, // Set your desired height
                child: Scrollbar(
                  thickness: 6.0,
                  radius: Radius.circular(8.0),
                  child: SingleChildScrollView(
                    child: Container(
                      width: 200.0,
                      padding: EdgeInsets.all(16.0),
                      color: Color(0xFFFEFCE8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            content,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              height: 1.5714285714285714,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
Padding(padding: EdgeInsets.only(top:10)),
      Container(
                    
      width: 343,
      height: 24,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
  ),
      child: Stack(
        
        children: <Widget>[
        Checkbox(
          activeColor: Colors.green,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value;
              
            });
          },
        ),
        ]
      )
    )
      ),Positioned(
        top: 1,
        left: 28,
        child: Text('I have read and understood the form.', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Montserrat',
        fontSize: 14,
        letterSpacing: 0 ,
        fontWeight: FontWeight.normal,
        height: 1.5714285714285714
      ),)
      ),
        ]
      )
    ),
    Padding(padding: EdgeInsets.only(top:30)),
SizedBox(
  width: 120,
  child:   ElevatedButton(

    onPressed:(){
   if(isChecked==true){
    Navigator.pushNamed(context, '/msgof',arguments: username);
   }
   
    
  } , child: Text("Next",style:TextStyle(fontSize: 17) ,),
    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF37966F))),
)
          
            ],
          ),
        ),
      ),
    );
  }
}