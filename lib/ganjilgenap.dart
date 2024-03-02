import 'package:flutter/material.dart';
import 'package:tugas2_tpm2024/hitung.dart';
import 'package:tugas2_tpm2024/main.dart';

void main() {
  runApp(const GanjilGenapPage());
}

class GanjilGenapPage extends StatelessWidget {
  const GanjilGenapPage({super.key});

  // This widget is the root of your application.
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ganjil atau Genap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GanjilGenapScreen(title: 'Ganjil atau Genap'),
    );
  }
}

class GanjilGenapScreen extends StatefulWidget {
  const GanjilGenapScreen({super.key, required this.title});

  final String title;

  @override
  _GanjilGenapScreenState createState() => _GanjilGenapScreenState();
}

class _GanjilGenapScreenState extends State<GanjilGenapScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              TextFormField(
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan angka',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mohon masukkan Angka';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      int angka = int.tryParse(numberController.text) ?? 0;
                      if (angka % 2 == 0) {
                        result = 'Genap';
                      } else {
                        result = 'Ganjil';
                      }
                    });
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
                child: Text('Cek', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 20.0),
              Text(
                'Hasil : $result',
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: ((context) => HitungPage())),
                    ),
                    child: Text('Halaman Kalkulator'),
                  )
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
                  builder: ((context) => Login(
                        title: 'Demo Tugas 2',
                      )))),
        },
        child: Icon(Icons.logout_rounded),
      ),
    );
  }
}
