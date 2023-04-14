import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/components.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double _height = 160.0;
  double _weight = 60.0;
  double _bmi = 0.0;
  String _result = '';

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));
      if (_bmi < 18.5) {
        _result = 'Kekurangan berat badan';
      } else if (_bmi >= 18.5 && _bmi < 24.9) {
        _result = 'Normal';
      } else if (_bmi >= 25.0 && _bmi < 29.9) {
        _result = 'Kelebihan berat badan';
      } else {
        _result = 'Kegemukan(Obesitas)';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? argumets =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var nama = argumets?['username'];

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI kalkulator'),
        backgroundColor: Colors.amber, // Mengatur warna latar belakang judul
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  'Hello, ${nama}',
                  style: TextStyle(
                    fontSize: 24.0, // Ukuran teks
                    fontWeight: FontWeight.bold, // Ketebalan teks
                    color: Colors.amber, // Warna teks
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Expanded(
                  child: Text(
                    'Yuk Cek Body Mass Index!',
                    style: TextStyle(
                      fontSize: 24.0, // Ukuran teks
                      fontWeight: FontWeight.normal, // Ketebalan teks
                      color: Colors.black, // Warna teks
                    ),
                  ),
                ),
              ),
              Text(
                'Height (cm): ${_height.toStringAsFixed(1)}',
                style: TextStyle(fontSize: 18.0),
              ),
              SliderTheme(
                  data: SliderThemeData(
                    thumbColor: Colors
                        .amber, // Mengatur warna ibu jari (thumb) saat di dalam area aktif (active)
                    activeTrackColor: Colors
                        .amber, // Mengatur warna lintasan aktif (active track)
                    inactiveTrackColor: Color.fromARGB(255, 250, 230,
                        169), // Mengatur warna lintasan tidak aktif (inactive track)
                  ),
                  child: Slider(
                    min: 100.0,
                    max: 300.0,
                    value: _height,
                    onChanged: (value) {
                      setState(() {
                        _height = value;
                      });
                    },
                  )),
              SizedBox(height: 16.0),
              Text(
                'Weight (kg): ${_weight.toStringAsFixed(1)}',
                style: TextStyle(fontSize: 18.0),
              ),
              SliderTheme(
                  data: SliderThemeData(
                    thumbColor: Colors
                        .amber, // Mengatur warna ibu jari (thumb) saat di dalam area aktif (active)
                    activeTrackColor: Colors
                        .amber, // Mengatur warna lintasan aktif (active track)
                    inactiveTrackColor: Color.fromARGB(255, 250, 230,
                        169), // Mengatur warna lintasan tidak aktif (inactive track)
                  ),
                  child: Slider(
                    min: 30.0,
                    max: 200.0,
                    value: _weight,
                    onChanged: (value) {
                      setState(() {
                        _weight = value;
                      });
                    },
                  )),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _calculateBMI,
                child: Text('Hitung BMI'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30), // Mengatur ukuran padding tombol
                  backgroundColor:
                      Colors.amber, // Mengatur warna latar belakang tombol
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'BMI: ${_bmi.toStringAsFixed(1)}',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                'Result: $_result',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
