import 'package:clima/screen/loading_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

import '../homeScreen/home.dart';

class UnitChangePage extends StatefulWidget {
  @override
  _UnitChangePageState createState() => _UnitChangePageState();
}

class _UnitChangePageState extends State<UnitChangePage> {
  late String selectedUnit;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    selectedUnit = 'metric'; // Default unit is set to metric
  }

  String getUnit() {
    return selectedUnit;
  }

  void updateWeatherData() async {
    // Call the method to fetch new weather data based on the selected unit
    await weatherModel.getLocationWeather(selectedUnit);
  }

  @override
  Widget build(BuildContext context) {
    // print(selectedUnit); // Print selectedUnit whenever it changes
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Unit'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Unit:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('Imperial'),
              leading: Radio(
                value: 'imperial',
                groupValue: selectedUnit,
                onChanged: (value) {
                  setState(() {
                    selectedUnit = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Metric'),
              leading: Radio(
                value: 'metric',
                groupValue: selectedUnit,
                onChanged: (value) {
                  setState(() {
                    selectedUnit = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Standard'),
              leading: Radio(
                value: 'standard',
                groupValue: selectedUnit,
                onChanged: (value) {
                  setState(() {
                    selectedUnit = value.toString();
                  });
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              // onPressed: () async {
                        // String unit = await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => UnitChangePage()),
                        // );
              onPressed: () async {
                // Pass the selected unit back to the previous page
                updateWeatherData();
                // await LocationScreen();
                Navigator.pop(context, selectedUnit);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
