import 'package:api_explorer/model/age.dart';
import 'package:api_explorer/model/gender.dart';
import 'package:api_explorer/model/nationality.dart';
import 'package:api_explorer/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ApiService apiService;

  Nationality? nationalities;
  Gender? gender;
  Age? age;
  bool isLoading = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  Future<void> getData(String name) async {
    setState(() {
      isLoading = true;
    });

    final nationalityResponse = await apiService.getNationality(name);
    final genderResponse = await apiService.getGender(name);
    final ageResponse = await apiService.getAge(name);

    setState(() {
      nationalities = nationalityResponse;
      gender = genderResponse;
      age = ageResponse;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
              ),
            ),
            SizedBox(height: 20),
            if (isLoading)
              Center(child: CircularProgressIndicator())
            else
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
                    if (nationalities != null && nationalities!.country.isNotEmpty)
                      ...nationalities!.country.map((n) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            '${n.countryId} : ${(n.probability * 100).toStringAsFixed(2)}%',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList()
                    else
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          'Country not available',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    SizedBox(height: 20),
                    Text(
                      'Gender:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${gender?.gender == 'male' ? 'Male' : gender?.gender == 'female' ? 'Female' : 'Gender not available'} : ${gender?.probability != null ? (gender!.probability * 100).toStringAsFixed(2) + '%' : 'N/A'}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Age:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${age?.age ?? 'Age not available'} years',
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
                    getData(_controller.text);
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
