import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// TODO: add API
    // Hard-coded details
    final nationalities = [
      {'country': 'United States', 'probability': 0.8},
      {'country': 'Canada', 'probability': 0.15},
    ];
    final gender = {'gender': 'Male', 'probability': 0.95};
    final age = 30;

    return Scaffold(
      appBar: AppBar(
        title: Text('API Explorer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your name:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[100],
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nationality:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ...nationalities.map((n) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '${n['country']} (Probability: ${n['probability']})',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                  SizedBox(height: 20),
                  Text(
                    'Gender:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${gender['gender']} (Probability: ${gender['probability']})',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Age:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$age years',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: () {
                    print('Button Pressed');
                  },
                  child: Text('Submit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
