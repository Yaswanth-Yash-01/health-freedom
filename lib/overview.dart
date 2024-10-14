import 'package:flutter/material.dart';
import 'package:flutter_application_2/activity.dart';

class overview extends StatefulWidget {
  const overview({super.key});

  @override
  State<overview> createState() => _overviewState();
}

List <Map<String,dynamic>> Weekdata =[
{'week': 'Week 1','description':'Information about benefits of physical activity.'},
{'week': 'Week 2','description':'Information about benifits of physical activity.'},
{'week': 'Week 3','description': 'Physical activity time - Brisk walk for 20 minutes.'},
{'week': 'Week 4','description':'Physical activity time - Brisk walk for 45 minutes.'},
{'week': 'Week 5','description': 'Physical activity time - Brisk walk for 55 minutes.'},
{'week': 'Week 6','description': 'Physical activity time - Brisk walk for 65 minutes.'},
];

class _overviewState extends State<overview> {

  @override
 Widget build(BuildContext context) {
  username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
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
      color : Color.fromRGBO(233, 97, 55, 1),
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
      color : Color.fromRGBO(233, 97, 55, 1),
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
      
            
            const SizedBox(height: 20.0), 
            Row(
              children: [
                Text(
                  'Welcome, $username', 
                  style: TextStyle(fontSize: 24,letterSpacing: 0.2,
        fontWeight: FontWeight.normal,
        height: 1.2,color:Color.fromARGB(255, 0, 124, 72) ),
                ),
               
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: Row(
                children: [
                   Text('Here’s a look at outline of the preparation of \nyour journey')
                ],
              ),
            ),
      
            Container(
              height: 600,
              width: 500,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,top: 30),
                  child: Column(
                    
                        
                          children: List.generate(6, (index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical:0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                           Positioned(
                            left: 34,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width: 2,
                           
                              color: Colors.grey,
                            ),
                          
                          ),
                          
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(vertical: 8),
                                              width: 30,
                                              height: 30,
                                              
                                              decoration: BoxDecoration(
                                                image: DecorationImage(image:AssetImage('assets/circle.png'),fit: BoxFit.fill),
                                                
                                                shape: BoxShape.circle,
                                               color: Colors.amber
                                              ),
                                            ),
                                          ),
                                          
                                        ],
                                      ),
                                    
                                      
                                       
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(top:25),
                                      
                                      
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${Weekdata[index]['week']}",
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 0, 0, 0)),
                                          ),
                                          Text("Week ${Weekdata[index]['description']}",style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                       
                    
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/journal_menu1',arguments: username);
            }, child: Text('Next'),style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF37966F)),)
       
      
            
       
      
     
      
      
      
   
       
      
      
           
          ],
          
          
        ),
        
        
      ),
      
    );
  }
}