import 'package:flutter/material.dart';

class Journey1 extends StatefulWidget {
  const Journey1({Key? key}) : super(key: key);

  @override
  State<Journey1> createState() => _Journey1State();
}


class _Journey1State extends State<Journey1> {
  int _currentStep = 0;
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
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                ),
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
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                ),
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
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                ),
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
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                ),
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
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                ),
                                color: Color.fromRGBO(233, 97, 55, 1),
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
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                ),
                                color: Color.fromRGBO(233, 97, 55, 1),
                              ),
                            ),
                          ),
                          // Other Positioned widgets for your design...
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          
              SingleChildScrollView(
                child: Stepper(
                  controlsBuilder: (BuildContext context, ControlsDetails details) {
                    return Container(); 
                  },
                  physics: NeverScrollableScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (int index) {
                    setState(() {
                      _currentStep = index;
                    });
                  },
                  
                  steps: [
                    Step(
                      title: Text('Week 1'),
                      content: Container(
                        
                        child: Text('Information about benefits of physical activity.\nOverview of Journey map'),
                      ),
                    ),
                    Step(
                      title: Text('Week 2'),
                      content: Container(
                
                        child: Text('Information about benefits of physical activity.\nOverview of Journey map'),
                      ),
                    ),
                    Step(
                      title: Text('Week 3'),
                      content: Container(
                       
                        child: Text('Physical activity time- Brisk walk for\n20 minutes'),
                      ),
                    ),
                    Step(
                      title: Text('Week 4'),
                      content: Container(
                 
                        child: Text('Physical activity time- Brisk walk for\n45 minutes '),
                      ),
                    ),
                    Step(
                      title: Text('Week 5'),
                      content: Container(
                       
                        child: Text('Physical activity time- Brisk walk for\n55 minutes '),
                      ),
                    ),
                    Step(
                      title: Text('Week 6'),
                      content: Container(
                     
                        child: Text('Physical activity time- Brisk walk for\n55 minutes'),
                      ),
                    ),
                  ],
                ),
              ),
            
            ],
            
          ),
          
        )
         
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      Navigator.pushNamed(context, '/eight', arguments: username);
    },
    child: Icon(Icons.navigate_next),
  ),
     
       
    );
  }
}


