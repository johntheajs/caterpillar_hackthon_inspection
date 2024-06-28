import 'package:flutter/material.dart';


class CarPartsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Parts Inspection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarPartsScreen(),
    );
  }
}

class CarPartsScreen extends StatefulWidget {
  @override
  _CarPartsScreenState createState() => _CarPartsScreenState();
}

class _CarPartsScreenState extends State<CarPartsScreen> {
  bool _showTiresForm = false;
  bool _showBatteryForm = false;
  bool _showExteriorForm = false;
  bool _showBrakesForm = false;
  bool _showEngineForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Car Parts Inspection',
                style: TextStyle(color: Colors.black))),
        backgroundColor: Color(0xFFFDB813), // Yellow background
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildHeader('Tires', () {
                setState(() {
                  _showTiresForm = !_showTiresForm;
                });
              }),
              if (_showTiresForm) TiresForm(),
              _buildHeader('Battery', () {
                setState(() {
                  _showBatteryForm = !_showBatteryForm;
                });
              }),
              if (_showBatteryForm) BatteryForm(),
              _buildHeader('Exterior', () {
                setState(() {
                  _showExteriorForm = !_showExteriorForm;
                });
              }),
              if (_showExteriorForm) ExteriorForm(),
              _buildHeader('Brakes', () {
                setState(() {
                  _showBrakesForm = !_showBrakesForm;
                });
              }),
              if (_showBrakesForm) BrakesForm(),
              _buildHeader('Engine', () {
                setState(() {
                  _showEngineForm = !_showEngineForm;
                });
              }),
              if (_showEngineForm) EngineForm(),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SummaryPage()),
                  );
                },
                child: Text('Generate Summary'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Icon(
        _showTiresForm ? Icons.arrow_drop_up : Icons.arrow_drop_down,
      ),
      onTap: onTap,
    );
  }
}

class TiresForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration:
              InputDecoration(labelText: 'Tire Pressure for Left Front'),
        ),
        TextField(
          decoration:
              InputDecoration(labelText: 'Tire Pressure for Right Front'),
        ),
        DropdownButtonFormField<String>(
          decoration:
              InputDecoration(labelText: 'Tire Condition for Left Front'),
          items: ['Good', 'Ok', 'Needs Replacement']
              .map((condition) => DropdownMenuItem(
                    value: condition,
                    child: Text(condition),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        DropdownButtonFormField<String>(
          decoration:
              InputDecoration(labelText: 'Tire Condition for Right Front'),
          items: ['Good', 'Ok', 'Needs Replacement']
              .map((condition) => DropdownMenuItem(
                    value: condition,
                    child: Text(condition),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Tire Pressure for Left Rear'),
        ),
        TextField(
          decoration:
              InputDecoration(labelText: 'Tire Pressure for Right Rear'),
        ),
        DropdownButtonFormField<String>(
          decoration:
              InputDecoration(labelText: 'Tire Condition for Left Rear'),
          items: ['Good', 'Ok', 'Needs Replacement']
              .map((condition) => DropdownMenuItem(
                    value: condition,
                    child: Text(condition),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        DropdownButtonFormField<String>(
          decoration:
              InputDecoration(labelText: 'Tire Condition for Right Rear'),
          items: ['Good', 'Ok', 'Needs Replacement']
              .map((condition) => DropdownMenuItem(
                    value: condition,
                    child: Text(condition),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        ElevatedButton(
          onPressed: () {
            // Implement image upload
          },
          child: Text('Attach images of each tire'),
        ),
      ],
    );
  }
}

class BatteryForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Battery Make'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Battery Replacement Date'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Battery Voltage'),
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: 'Battery Water Level'),
          items: ['Good', 'Ok', 'Low']
              .map((level) => DropdownMenuItem(
                    value: level,
                    child: Text(level),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        CheckboxListTile(
          title: Text('Condition of Battery (Any damage)'),
          value: false,
          onChanged: (value) {},
        ),
        CheckboxListTile(
          title: Text('Any Leak / Rust in Battery'),
          value: false,
          onChanged: (value) {},
        ),
        ElevatedButton(
          onPressed: () {
            // Implement image upload
          },
          child: Text('Attach images'),
        ),
      ],
    );
  }
}

class ExteriorForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          title: Text('Rust, Dent or Damage to Exterior'),
          value: false,
          onChanged: (value) {},
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Explain in notes'),
        ),
        CheckboxListTile(
          title: Text('Oil leak in Suspension'),
          value: false,
          onChanged: (value) {},
        ),
        ElevatedButton(
          onPressed: () {
            // Implement image upload
          },
          child: Text('Attach images'),
        ),
      ],
    );
  }
}

class BrakesForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: 'Brake Fluid Level'),
          items: ['Good', 'Ok', 'Low']
              .map((level) => DropdownMenuItem(
                    value: level,
                    child: Text(level),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: 'Brake Condition for Front'),
          items: ['Good', 'Ok', 'Needs Replacement']
              .map((condition) => DropdownMenuItem(
                    value: condition,
                    child: Text(condition),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: 'Brake Condition for Rear'),
          items: ['Good', 'Ok', 'Needs Replacement']
              .map((condition) => DropdownMenuItem(
                    value: condition,
                    child: Text(condition),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: 'Emergency Brake'),
          items: ['Good', 'Ok', 'Low']
              .map((condition) => DropdownMenuItem(
                    value: condition,
                    child: Text(condition),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        ElevatedButton(
          onPressed: () {
            // Implement image upload
          },
          child: Text('Attach images'),
        ),
      ],
    );
  }
}

class EngineForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          title: Text('Rust, Dents or Damage in Engine'),
          value: false,
          onChanged: (value) {},
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Explain in notes'),
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: 'Engine Oil Condition'),
          items: ['Good', 'Bad']
              .map((condition) => DropdownMenuItem(
                    value: condition,
                    child: Text(condition),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: 'Engine Oil Color'),
          items: ['Clean', 'Brown', 'Black']
              .map((color) => DropdownMenuItem(
                    value: color,
                    child: Text(color),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: 'Brake Fluid Condition'),
          items: ['Good', 'Bad']
              .map((condition) => DropdownMenuItem(
                    value: condition,
                    child: Text(condition),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: 'Brake Fluid Color'),
          items: ['Clean', 'Brown', 'Black']
              .map((color) => DropdownMenuItem(
                    value: color,
                    child: Text(color),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        CheckboxListTile(
          title: Text('Any oil leak in Engine'),
          value: false,
          onChanged: (value) {},
        ),
        ElevatedButton(
          onPressed: () {
            // Implement image upload
          },
          child: Text('Attach images'),
        ),
      ],
    );
  }
}

class SummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: Center(
        child: Text('Summary Page'),
      ),
    );
  }
}