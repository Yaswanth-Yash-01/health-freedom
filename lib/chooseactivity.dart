import 'package:flutter/material.dart';

class ChooseActivity extends StatefulWidget {
  const ChooseActivity({Key? key}) : super(key: key);

  @override
  State<ChooseActivity> createState() => _ChooseActivity();
}

class CellData {
  final String imagePath;
  final String labelText;
  bool isSelected = false;

  CellData(this.imagePath, this.labelText);
}

TableCell _buildEllipseCell(CellData cellData, Function updateCellState) {
  return TableCell(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0), // Reduced gap
      child: GestureDetector(
        onTap: () {
          updateCellState(cellData);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 68.94,
              height: 68.94,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: cellData.isSelected
                    ? Color.fromRGBO(233, 97, 55, 1)
                    : Color.fromRGBO(55, 150, 111, 0.35),
              ),
              child: Image.asset(cellData.imagePath),
            ),
            SizedBox(height: 5), // Reduced gap between ellipse and label
            Text(
              cellData.labelText,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: cellData.isSelected ? Color.fromRGBO(233, 97, 55, 1) : Colors.black,
              ),
            ),
            SizedBox(height: 10), // Reduced gap between label and bottom
          ],
        ),
      ),
    ),
  );
}
// Widget _buildTextBoxCell(String text) {
//   return TableCell(
//     child: Padding(
//       padding: const EdgeInsets.all(0.0),
//       child: Text(
//         text,
//         style: TextStyle(fontSize: 2.0),
//       ),
//     ),
//   );
// }

class _ChooseActivity extends State<ChooseActivity> {
  List<CellData> cells = [
    CellData('assets/healthy-food 1.png', 'Eat Healthy'),
    CellData('assets/sleep 1.png', 'Get Rest'),
    CellData('assets/stretching 1.png', 'Stretch'),
    CellData('assets/connection 1.png', 'Socialize'),
    CellData('assets/public-service 1.png', 'Community Service'),
    CellData('assets/reduce-stress 1.png', 'Destress'),
    CellData('assets/success 1.png', 'Be Confident'),
    CellData('assets/goals 2.png', 'Goal'),
    CellData('assets/goals 2.png', 'Goal'),
  ];
  bool _hasNextButtonDisabled = true;

  void updateCellSelection(CellData cell) {
    setState(() {
      cell.isSelected = !cell.isSelected;
      _hasNextButtonDisabled = !cells.any((c) => c.isSelected); // Update button state
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(

          children: [
            // Rectangle bars
            Positioned(
              top: 28,
              left: 16,
              child: Container(
                width: 45,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            // ... other positioned elements for remaining rectangle bars
            Positioned(
              top: 28,
              left: 65,
              child: Container(
                width: 45,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),          

            // Vector box
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/vector.png'),
                  ),
                ),
              ),
            ),

            // Center content
            //Center(
              //child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                //children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0, left: 16.0, right: 75.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Choose Activity',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        SizedBox(height:15, width:450),
                        // Text(
                        //   'Most Recent Activities',
                        //   style: TextStyle(
                        //     fontSize: 14.0,
                        //     fontWeight: FontWeight.w400,
                        //     fontFamily: 'Roboto',
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                //],
             // ),
            //),
            
Positioned(
  top: 85.0, 
  left: 16.0,
  right: 16.0,
  bottom: 80.0, 
  child: SingleChildScrollView(
    child: Column(
      children: [
        
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0), 
          child: Row(
            children: [
              Text(
                "Most Recent Activities",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Spacer(), 
            ],
          ),
        ),
       
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0), 
          child: Table(
            children: [
              TableRow(children: [
                _buildEllipseCell(cells[0], updateCellSelection),
                _buildEllipseCell(cells[1], updateCellSelection),
                _buildEllipseCell(cells[2], updateCellSelection),
              ]),
            ],
          ),
        ),

       
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Text(
                "All Activities",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Spacer(), 
            ],
          ),
        ),
       
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0), 
          child: Table(
            children: [
              TableRow(children: [
                _buildEllipseCell(cells[3], updateCellSelection),
                _buildEllipseCell(cells[4], updateCellSelection),
                _buildEllipseCell(cells[5], updateCellSelection),
              ]),
              TableRow(children: [
                _buildEllipseCell(cells[6], updateCellSelection),
                _buildEllipseCell(cells[7], updateCellSelection),
                _buildEllipseCell(cells[8], updateCellSelection),
              ]),
            ],
          ),
        ),

       
Container(
  
  constraints: BoxConstraints(
    maxWidth: MediaQuery.of(context).size.width,
  ),

  child: Center(
    child: Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(254, 250, 232, 1),
        borderRadius: BorderRadius.circular(4), 
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        children: [
          
          Row(
            children: [
          
              Spacer(flex: 2), 
              
              Container(
                width: (MediaQuery.of(context).size.width - 80),
                height: 25,
                child: Text(
                  "Don't see your activity in the list? Click below to add",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        
          SizedBox(height: 10), 
          TextButton(
            onPressed: () {
     
              Navigator.pushNamed(context, '/addActivity'); 
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4), 
                side: BorderSide(
                  color: Color.fromRGBO(55, 150, 111, 1),
                  width: 1.0,
                ),
              ),
            ),
            child: Text(
              "Other activity",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(55, 150, 111, 1), 
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),


      ],
    ),
  ),
),

// Bottom next button container
    Positioned(
      bottom: 25, // Adjust position as needed
      left: 0,
      right: 0,
      child: Container(
        height: 80, 
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, 
          children: [
   
            Positioned(
              bottom: 0, 
              left: (MediaQuery.of(context).size.width - 161) / 2, 
              child: Container(
                width: 161, 
                height: 36.11, 
                decoration: BoxDecoration(
                  color: _hasNextButtonDisabled
                      ? Colors.grey[200] 
                      : Color.fromRGBO(55, 150, 111, 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextButton(
                  onPressed: _hasNextButtonDisabled
                      ? null // Disable button
                      : () {
                         
                          Navigator.pushNamed(context, '/details ');
                        },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, 
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
          ]
        ),
      ),
    );
  }
}