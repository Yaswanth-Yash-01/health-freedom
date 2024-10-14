import 'package:flutter/material.dart';

class HabitsPage extends StatefulWidget {
  const HabitsPage({Key? key}) : super(key: key);

  @override
  State<HabitsPage> createState() => _HabitsPage();
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
        child: cellData.imagePath.isEmpty && cellData.labelText.isEmpty
            ? SizedBox() // Empty container for empty cells
            : Column(
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
                    child: Image.asset(
                      cellData.imagePath, // Check for empty image path here
                    ),
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

class _HabitsPage extends State<HabitsPage> {
  List<CellData> cells = [
    CellData('assets/healthy-food 1.png', 'Eat Healthy'),
    CellData('assets/footprint-fill.png', 'Walk More'),
    CellData('assets/stretching 1.png', 'Stretch'),
    CellData('assets/goals 2.png', 'Habit'),
    CellData('assets/goals 2.png', 'Habit'),
    CellData('assets/goals 2.png', 'Habit'),
    CellData('assets/goals 2.png', 'Habit'),
    CellData('assets/goals 2.png', 'Habit'),
    CellData('assets/goals 2.png', 'Habit'),
  ];

  void updateCellSelection(CellData cell) {
    setState(() {
      cell.isSelected = !cell.isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    late String username;
    username = ModalRoute.of(context)!.settings.arguments as String;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            borderRadius: BorderRadius.circular(4),
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
                            borderRadius: BorderRadius.circular(4),
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
                            borderRadius: BorderRadius.circular(4),
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
                            borderRadius: BorderRadius.circular(4),
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
                            borderRadius: BorderRadius.circular(4),
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
                            borderRadius: BorderRadius.circular(4),
                            color: Color.fromRGBO(55, 150, 111, 0.1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 16.0, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Welcome, $username',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'What are your top three goals for participating in the health freedom program?',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Table container
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15.0), // Adjust margins
                        child: Table(
                          children: [
                            TableRow(children: [
                              _buildEllipseCell(cells[0], updateCellSelection),
                              _buildEllipseCell(cells[1], updateCellSelection),
                              _buildEllipseCell(cells[2], updateCellSelection),
                            ]),
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
                      // "Other Goals" container
                      Container(
                        height: 180.0, // Adjust height as needed
                        child: Column(
                          children: [
                            // Label for "Other Goals"
                            Container(
                              width: (MediaQuery.of(context).size.width - 40),
                              height: 22,
                              child: Text(
                                "Other Habits",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            // Text box
                            Container(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Type description here",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                                ),
                              ),
                            ),
                            Spacer(),
                              Container(
                        width: 161, 
                        height: 36.11, 
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(55, 150, 111, 1), 
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/journey1',arguments: username);
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             
                    

        
      
           ],      
              
             
        
        ),
      ),
      ),
    );
  }
}
