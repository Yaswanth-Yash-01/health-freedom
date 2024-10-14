import 'package:flutter/material.dart';

class help extends StatefulWidget {
  const help({super.key});

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  bool _showTip = false;
  void _toggleTipVisibility() {
    setState(() {
      _showTip = !_showTip;
    });
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Example'),
      ),
      body: Stack(
        children: [
      
          Center(
            child: Text(
              'Main Content Here',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
         
          if (_showTip)
            Positioned(
              bottom: 20.0,
              left: 20.0,
              right: 20.0,
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Your helpful tip goes here!',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
       
          Positioned(
            top: 20.0,
            right: 20.0,
            child: GestureDetector(
              onTap: _toggleTipVisibility,
              child: Icon(
                Icons.help_outline,
                size: 30.0,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
