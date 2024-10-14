import 'package:flutter/material.dart';

class msgcof extends StatefulWidget {
  const msgcof({super.key});

  @override
  State<msgcof> createState() => _msgcofState();
}

class _msgcofState extends State<msgcof> {
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/cof.png',
                  width: double.infinity,
                  height: 600,
                ),
              ),
                            Padding(padding: EdgeInsets.only(top:20)),
SizedBox(
  width: 120,
  child:   ElevatedButton(

    onPressed:(){
  
    Navigator.pushNamed(context, '/avatar',arguments:username);
  } , child: Text("Next",style:TextStyle(fontSize: 17) ,),
    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF37966F))),
)
               

            ]))));
    
  }
}