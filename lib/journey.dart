import 'package:flutter/material.dart';

class Journey extends StatefulWidget {
  const Journey({Key? key}) : super(key: key);

  @override
  _JourneyState createState() => _JourneyState();
}

class _JourneyState extends State<Journey> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  late String username;
  @override
  Widget build(BuildContext context) {
     username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Container(
                width: 4,
                height: MediaQuery.of(context).size.height - 96, 
                color: Colors.grey[300], 
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Positioned(
                          top: _animation.value * (MediaQuery.of(context).size.height - 96 - 16),
                          left: 0,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Column(
                      children: List.generate(6, (index) {
                        return Expanded(
                          child: Container(
                            color: index <= _currentStep ? Colors.green : Colors.transparent,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    // Week content
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6, // Number of weeks
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index <= _currentStep ? Colors.green : Colors.grey, // Change color based on current step
                                ),
                                child: Center(
                                  child: Icon(
                                    index <= _currentStep ? Icons.check : Icons.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Week ${index + 1}',
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Content for Week ${index + 1}',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 1000),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
         
          children: [
            FloatingActionButton(
              onPressed: () {
                if (_currentStep < 5) {
                  _controller.forward(from: 0);
                  setState(() {
                    _currentStep++;
                  });
                }
              },
              child: Icon(Icons.navigate_next),
            ),
            SizedBox(width: 20),
            FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/journey1',arguments: username);
          },
          child: Icon(Icons.navigate_next),
        ),
          ],
        ),
      ),
    
      
    );
  }
}

