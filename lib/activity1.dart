import 'package:flutter/material.dart';
import 'dart:math' as math;

class activity extends StatefulWidget {
  const activity({super.key});

  @override
  State<activity> createState() => _activityState();
}

class _activityState extends State<activity> {
  @override
 Widget build(BuildContext context) {
        
        return Container(
      width: 375,
      height: 812,
      decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
  ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 61,
        left: 16,
        child: Container(
      width: 97.28691101074219,
      height: 4,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 44.0827751159668,
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
        left: 51,
        child: Container(
        width: 46.28691482543945,
        height: 4,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
      color : Color.fromRGBO(0, 0, 0, 0.10000000149011612),
  )
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 287,
        left: 31,
        child: Text('All activities', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Montserrat',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5714285714285714
      ),)
      ),Positioned(
        top: 121,
        left: 31,
        child: Text('Most recent activities', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Montserrat',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5714285714285714
      ),)
      ),Positioned(
        top: 51,
        left: 338,
        child: Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
  ),
      
    )
      ),
      Positioned(
        top: 158,
        left: 32.9765625,
        child: Container(
      width: 71.78823852539062,
      height: 71.78823852539062,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 71.78823852539062,
        height: 71.78823852539062,
        decoration: BoxDecoration(
          color : Color.fromRGBO(55, 150, 111, 0.3499999940395355),
      borderRadius : BorderRadius.all(Radius.elliptical(71.78823852539062, 71.78823852539062)),
  )
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 235.1058349609375,
        left: 25,
        child: Text('Walk', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Roboto',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5714285714285714
      ),)
      ),Positioned(
        top: 158,
        left: 144,
        child: Container(
      width: 71.78823852539062,
      height: 71.78823852539062,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 71.78823852539062,
        height: 71.78823852539062,
        decoration: BoxDecoration(
          color : Color.fromRGBO(55, 150, 111, 0.3499999940395355),
      borderRadius : BorderRadius.all(Radius.elliptical(71.78823852539062, 71.78823852539062)),
  )
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 235.1058349609375,
        left: 136,
        child: Text('Run', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Roboto',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5714285714285714
      ),)
      ),Positioned(
        top: 158,
        left: 262,
        child: Container(
      width: 71.78823852539062,
      height: 71.78823852539062,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 71.78823852539062,
        height: 71.78823852539062,
        decoration: BoxDecoration(
          color : Color.fromRGBO(55, 150, 111, 0.3499999940395355),
      borderRadius : BorderRadius.all(Radius.elliptical(71.78823852539062, 71.78823852539062)),
  )
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 235.1058349609375,
        left: 247,
        child: Text('Strech', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Roboto',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5714285714285714
      ),)
      ),Positioned(
        top: 327,
        left: 30.9765625,
        child: Container(
      width: 71.78823852539062,
      height: 71.78823852539062,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 71.78823852539062,
        height: 71.78823852539062,
        decoration: BoxDecoration(
          color : Color.fromRGBO(55, 150, 111, 0.3499999940395355),
      borderRadius : BorderRadius.all(Radius.elliptical(71.78823852539062, 71.78823852539062)),
  )
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 404.10546875,
        left: 23,
        child: Text('Swimming', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Roboto',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5714285714285714
      ),)
      ),Positioned(
        top: 454,
        left: 30.9765625,
        child: Container(
      width: 71.78823852539062,
      height: 71.78823852539062,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 71.78823852539062,
        height: 71.78823852539062,
        decoration: BoxDecoration(
          color : Color.fromRGBO(55, 150, 111, 0.3499999940395355),
      borderRadius : BorderRadius.all(Radius.elliptical(71.78823852539062, 71.78823852539062)),
  )
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 531.10546875,
        left: 23,
        child: Text('Power Nap', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Roboto',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5714285714285714
      ),)
      ),Positioned(
        top: 327,
        left: 146,
        child: Container(
      width: 71.78823852539062,
      height: 71.78823852539062,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 71.78823852539062,
        height: 71.78823852539062,
        decoration: BoxDecoration(
          color : Color.fromRGBO(55, 150, 111, 0.3499999940395355),
      borderRadius : BorderRadius.all(Radius.elliptical(71.78823852539062, 71.78823852539062)),
  )
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 404.10546875,
        left: 134,
        child: Text('Gardening', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Roboto',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5714285714285714
      ),)
      ),Positioned(
        top: 327,
        left: 259.625,
        child: Container(
      width: 71.78823852539062,
      height: 71.78823852539062,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 71.78823852539062,
        height: 71.78823852539062,
        decoration: BoxDecoration(
          color : Color.fromRGBO(55, 150, 111, 0.3499999940395355),
      borderRadius : BorderRadius.all(Radius.elliptical(71.78823852539062, 71.78823852539062)),
  )
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 404.10546875,
        left: 245,
        child: Text('Reading', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Roboto',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5714285714285714
      ),)
      ),Positioned(
        top: 579,
        left: 16,
        child: Container(
      width: 343,
      height: 80,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 343,
        height: 80,
        decoration: BoxDecoration(
          color : Color.fromRGBO(254, 252, 232, 1),
  )
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 584,
        left: 27,
        child: Text('Don’t see your activity in the list? click below to add', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Roboto',
        fontSize: 14,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5714285714285714
      ),)
      ),Positioned(
        top: 614,
        left: 107,
        child: Container(
      decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
      boxShadow : [BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.0430000014603138),
          offset: Offset(0,2),
          blurRadius: 0
      )],
      color : Color.fromRGBO(255, 255, 255, 1),
      border : Border.all(
          color: Color.fromRGBO(55, 150, 111, 1),
          width: 1,
        ),
  ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6.400000095367432),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
      decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 0.000009999999747378752),
  ),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
          
  ),
      
    ),
],
      ),
    ), SizedBox(width : 10),
Text('Other acitivity', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(55, 150, 111, 1),
        fontFamily: 'Roboto',
        fontSize: 16,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5
      ),),

        ],
      ),
    )
      ),
      
      Positioned(
        top: 476,
        left: 41,
        child: Container(
      width: 51,
      height: 29.00149917602539,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
      width: 20,
      height: 21.48147964477539,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Image.asset('assets/help.png')
      ),Positioned(
        top: 6.0848212242126465,
        left: 0.98046875,
        child: Image.asset('assets/help.png')
      ),
        ]
      )
    )
      ),Positioned(
        top: 0,
        left: 31,
        child: Container(
      width: 20,
      height: 21.48147964477539,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Image.asset('assets/help.png')
      ),Positioned(
        top: 6.0848212242126465,
        left: 0.98046875,
        child: Image.asset('assets/help.png')
      ),
        ]
      )
    )
      ),Positioned(
        top: 21.482980728149414,
        left: 26,
        child: Transform.rotate(
        angle: -90.00000433040753 * (math.pi / 180),
        child: Image.asset('assets/help.png'),
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 175,
        left: 283,
        child: Container(
        width: 30,
        height: 38.979549407958984,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/Stretching1.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 346,
        left: 49,
        child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/Swimming2.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),
      
      Positioned(
        top: 79,
        left: 15,
        child: Text('Choose Activity', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Montserrat',
        fontSize: 24,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 680,
        left: 107,
        child: Container(
      width: 161,
      height: 36.11111068725586,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
      decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
      boxShadow : [BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.0430000014603138),
          offset: Offset(0,2),
          blurRadius: 0
      )],
      color : Color.fromRGBO(55, 150, 111, 0.25),
  ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6.400000095367432),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
      decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 0.000009999999747378752),
  ),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
          
  ),
     
    ),
],
      ),
    ), SizedBox(width : 10),
Text('Next', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'Roboto',
        fontSize: 16,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1.5
      ),),

        ],
      ),
    )
      ),
        ]
      )
    )
      ),
      
      Positioned(
        top: 791,
        left: 0,
        child: Container(
      width: 375,
      height: 21,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 375,
        height: 21,
        decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
  )
      )
      ),
      
    
        ]
      )
    )
      ),
        ]
      )
    );
        }
        }
        