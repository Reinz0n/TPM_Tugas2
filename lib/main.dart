import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tugas2_tpm2024/hitung.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove debug
      title: 'Tugas 1', // judul window
      theme: ThemeData(
        primarySwatch: Colors.blue, // warna langit2 app
      ),
      home: const Login(title: 'Demo Tugas 2'), // judul app
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>(); // key login
  TextEditingController emailController =
      TextEditingController(); // membaca data email
  TextEditingController passwordController =
      TextEditingController(); // membaca data password

  bool _obscureText = true; // samarkan sandi password

  void _toggle() {
    // fungsi untuk toggle show/hide password
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(widget.title, style: TextStyle(color: Colors.white))),
      body: Form(
        key: _formkey, // kunci login
        child: Padding(
          // setelan dasar app
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // di tengah
            children: [
              Padding(
                // flutter logo
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              Padding(
                // form email
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.mail),
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  validator: (value) {
                    // validasi data
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan email anda';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                // form password
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    suffixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: TextButton(
                        onPressed: _toggle,
                        child: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  validator: (value) {
                    // validasi data
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan password anda';
                    }
                    return null;
                  },
                  obscureText: _obscureText, // tampil/sembunyikan sandi
                ),
              ),
              Padding(
                // button login
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HitungPage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          // jika ada data yang kosong
                          const SnackBar(content: Text('Data Masih Kosong')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                // forgot password
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        // jika ada data yang kosong
                        const SnackBar(content: Text('Hayoo kok lupa?')),
                      );
                    },
                    child: Text('Lupa Password?'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
                child: Center(
                    child: Text('Dibuat oleh:\n'
                        'Mikhael Rivandio Rekzadianto (123200078)\n'
                        'Muhammad Iqbal Daudi I. (123200076)\n'
                        'Farras Alam Majid (123200044)'
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
