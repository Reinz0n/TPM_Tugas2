import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tugas2_tpm2024/ganjilgenap.dart';
import 'package:tugas2_tpm2024/main.dart';

class HitungPage extends StatelessWidget {
  const HitungPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Hitung(title: 'Kalkulator'),
    );
  }
}

class Hitung extends StatefulWidget {
  const Hitung({super.key, required this.title});

  final String title;

  @override
  State<Hitung> createState() => _HitungState();
}

class _HitungState extends State<Hitung> {
  final _formkey = GlobalKey<FormState>(); // key login
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                // logo flutter
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: num1Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.numbers),
                    border: OutlineInputBorder(),
                    labelText: "Angka Pertama",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan Angka Pertama';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                //Form Angka Kedua
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: num2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.numbers),
                    border: OutlineInputBorder(),
                    labelText: "Angka Kedua",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon Masukkan Angka Kedua';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          calculate('+');
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            // jika ada data yang kosong
                            const SnackBar(content: Text('Data Masih Kosong')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text('Tambah', style: TextStyle(color: Colors.white))),
                  ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          calculate('-');
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            // jika ada data yang kosong
                            const SnackBar(content: Text('Data Masih Kosong')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text('Kurang', style: TextStyle(color: Colors.white)))
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 8, vertical: 4),
                child: Text(
                  "Hasil : $result",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GanjilGenapPage())),
                    child: Text('Halaman Ganjil Genap')),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => Login(title: 'Demo Tugas 2')))),
        },
        child: Icon(Icons.logout_rounded),
      ),
    );
  }

  void calculate(String operation) {
    double num1 = double.tryParse(num1Controller.text) ?? 0.0;
    double num2 = double.tryParse(num2Controller.text) ?? 0.0;

    double resultValue = 0.0;

    if (operation == '+') {
      resultValue = num1 + num2;
    } else if (operation == '-') {
      resultValue = num1 - num2;
    }
    setState(() {
      result = resultValue.toString();
    });
  }
}
