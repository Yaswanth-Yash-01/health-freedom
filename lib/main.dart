



import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_application_2/AuthProvider.dart';
import 'package:flutter_application_2/Journal_menu1.dart';
import 'package:flutter_application_2/avatar.dart';
import 'package:flutter_application_2/community.dart';
import 'package:flutter_application_2/goalsPage.dart';
import 'package:flutter_application_2/journey.dart';
import 'package:flutter_application_2/journey1.dart';
import 'package:flutter_application_2/login.dart';
import 'package:flutter_application_2/contestform.dart';
import 'package:flutter_application_2/msgcof.dart';
import 'package:flutter_application_2/register.dart';
import 'package:provider/provider.dart';
import 'chooseactivity.dart';
import 'habitsPage.dart';
import 'stepper.dart';
import 'onboarding.dart';
import 'history.dart';
import 'activity.dart';
import 'avatar.dart';
import 'overview.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(), 
       // Provide an instance of AuthProvider
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Health',
        initialRoute: '/',
        routes: {
          '/': (context) => const onboradscreen(),
          '/second': (context) => const onboarding(),
          '/login': (context) => const login(), 
          '/contest': (context) => const contestform(),
          '/msgof': (context) => const msgcof(),
          '/habits': (context) => const HabitsPage(),
          '/community': (context) => const community(),
          '/journey': (context) => const Journey(),
          '/journey1': (context) => Journey1(),
          '/six1': (context) => const GoalsPage(),
          '/avatar': (context) => const ChooseAvatarPage(),
          '/stepper': (context) => StepperControllerDemo(),
          '/register': (context) => register(),
          '/journal_menu':(context) => Mainhome(),
          '/journal_menu1': (context) => journal_menu1(),
          '/bloodpressure': (context) => bloodpressure(),
          '/profile': (context) => profile(),
          '/bloodpressurehistory':(context) => const bloodpressurehistory(),
          '/historybloodpressure': (context)=> bloodpressurehistory(),
          '/historyglucoselevel' :(context) => gulcoselevelhistory(),
          '/chooseavatar': (context) => ChooseAvatarPage(),
          '/activity':(context) => activity(),
          '/overview':(context) => overview(),
        },
      ),
    ),
  );
}

class onboradscreen extends StatefulWidget {
  const onboradscreen({Key? key}) : super(key: key);

  @override
  State<onboradscreen> createState() => _onboradscreenState();
}

class _onboradscreenState extends State<onboradscreen> with TickerProviderStateMixin {
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
                'assets/screen1.png',
                width: double.infinity,
                fit: BoxFit.cover, 
              ),
            ),
            SizedBox(height: 50),
            FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                
                  
                      child: const Text(
                        "Start your journey \ntowards health \nfreedom here",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 34,letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,color: Color(0xFF37966F)),
                      ), 
              
              ),
            ),
            SizedBox(height: 50),
    
       Container(
    padding: EdgeInsets.all(20),
    alignment: Alignment.bottomRight,
    child: FloatingActionButton(
      backgroundColor: const Color(0xFF37966F),
      
     onPressed: () { 
      
      Navigator.pushNamed(context, '/second');
      
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

// import 'package:dhttpd/dhttpd.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/animation.dart';
// import 'package:flutter_application_2/AuthProvider.dart';
// import 'package:flutter_application_2/Journal_menu1.dart';
// import 'package:flutter_application_2/avatar.dart';
// import 'package:flutter_application_2/community.dart';
// import 'package:flutter_application_2/goalsPage.dart';
// import 'package:flutter_application_2/journey.dart';
// import 'package:flutter_application_2/journey1.dart';
// import 'package:flutter_application_2/knowledgemap.dart';
// import 'package:flutter_application_2/login.dart';
// import 'package:flutter_application_2/contestform.dart';
// import 'package:flutter_application_2/msgcof.dart';
// import 'package:flutter_application_2/register.dart';
// import 'package:provider/provider.dart';
// import 'chooseactivity.dart';
// import 'habitsPage.dart';
// import 'stepper.dart';
// import 'onboarding.dart';
// import 'history.dart';
// import 'activity.dart';
// import 'avatar.dart';
// import 'overview.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => AuthProvider(), 
//        // Provide an instance of AuthProvider
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Health',
//         initialRoute: '/',
//         routes: {
//           '/': (context) => const onboradscreen(),
//           '/second': (context) => const onboarding(),
//           '/login': (context) => const login(), 
//           '/contest': (context) => const contestform(),
//           '/msgof': (context) => const msgcof(),
//           '/habits': (context) => const HabitsPage(),
//           '/community': (context) => const community(),
//           '/journey': (context) => const Journey(),
//           '/journey1': (context) => Journey1(),
//           '/six1': (context) => const GoalsPage(),
//           '/avatar': (context) => const ChooseAvatarPage(),
//           '/stepper': (context) => StepperControllerDemo(),
//           '/register': (context) => register(),
//           '/journal_menu':(context) => Mainhome(),
//           '/knowledgemap':(context) =>  Knowledgemap(pdfFiles: [], url: '',),
//           '/journal_menu1': (context) => const journal_menu1(),
//           '/bloodpressure': (context) => const bloodpressure(),
//           '/profile': (context) => profile(),
//           '/bloodpressurehistory':(context) => const bloodpressurehistory(),
//           '/historybloodpressure': (context)=> bloodpressurehistory(),
//           '/historyglucoselevel' :(context) => gulcoselevelhistory(),
//           '/chooseavatar': (context) => ChooseAvatarPage(),
//           '/activity':(context) => activity(),
//           '/overview':(context) => overview(),
//         },
//       ),
//     ),
//   );
// }

// class onboradscreen extends StatefulWidget {
//   const onboradscreen({Key? key}) : super(key: key);

//   @override
//   State<onboradscreen> createState() => _onboradscreenState();
// }

// class _onboradscreenState extends State<onboradscreen> with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _opacityAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
//     _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
//     _controller.forward(); 
//   }


//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 515,
//               child: Image.asset(
//                 'assets/screen1.png',
//                 width: double.infinity,
//                 fit: BoxFit.cover, 
//               ),
//             ),
//             SizedBox(height: 50),
//             FadeTransition(
//               opacity: _opacityAnimation,
//               child: Container(
                
                  
//                       child: const Text(
//                         "Start your journey \ntowards health \nfreedom here",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(fontSize: 34,letterSpacing: 0,
//                 fontWeight: FontWeight.normal,
//                 height: 1,color: Color(0xFF37966F)),
//                       ), 
              
//               ),
//             ),
//             SizedBox(height: 50),
    
//        Container(
//     padding: EdgeInsets.all(20),
//     alignment: Alignment.bottomRight,
//     child: FloatingActionButton(
//       backgroundColor: const Color(0xFF37966F),
      
//      onPressed: () { 
      
//       Navigator.pushNamed(context, '/second');
      
//      },
//       child: Icon(Icons.arrow_right),
      
//   ),
//   ),
          
//           ],
//         ),
        
//       ),
//     );
//   }
// }
