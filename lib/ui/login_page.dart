import 'package:flutter/material.dart';
import 'package:responsi2mobile_paket3_h1d023035/bloc/login_bloc.dart';
import 'package:responsi2mobile_paket3_h1d023035/helpers/user_info.dart';
import 'package:responsi2mobile_paket3_h1d023035/ui/buku_page.dart';
import 'package:responsi2mobile_paket3_h1d023035/ui/registrasi_page.dart';
import 'package:responsi2mobile_paket3_h1d023035/widget/warning_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.brown[400]!, Colors.brown[700]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.library_books_rounded,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Inventaris Buku Dzaky',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 40),
                _emailTextField(),
                const SizedBox(height: 20),
                _passwordTextField(),
                const SizedBox(height: 30),
                _buttonLogin(),
                const SizedBox(height: 30),
                _menuRegistrasi(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Membuat Textbox email
  Widget _emailTextField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Email",
          prefixIcon: const Icon(Icons.email_rounded, color: Colors.brown),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.emailAddress,
        controller: _emailTextboxController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Email harus diisi';
          }
          return null;
        },
      ),
    );
  }

  //Membuat Textbox password
  Widget _passwordTextField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Password",
          prefixIcon: const Icon(Icons.lock_rounded, color: Colors.brown),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.text,
        obscureText: true,
        controller: _passwordTextboxController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Password harus diisi";
          }
          return null;
        },
      ),
    );
  }

  //Membuat Tombol Login
  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.brown[600]!, Colors.brown[800]!],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: _isLoading
            ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
            : const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if (validate) {
            if (!_isLoading) _submit();
          }
        },
      ),
    );
  }

  void _submit() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    LoginBloc.login(
      email: _emailTextboxController.text,
      password: _passwordTextboxController.text,
    ).then(
      (value) async {
        if (value.code == 200) {
          await UserInfo().setToken(value.token!);
          await UserInfo().setUserID(value.userID!);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BukuPage(),
            ),
          );
        } else {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => WarningDialog(
              description: "Login gagal, silahkan coba lagi",
            ),
          );
        }
      },
      onError: (error) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => WarningDialog(
            description: "Login gagal, silahkan coba lagi",
          ),
        );
      },
    );
    setState(() {
      _isLoading = false;
    });
  }

  // Membuat menu untuk membuka halaman registrasi
  Widget _menuRegistrasi() {
    return Center(
      child: InkWell(
        child: const Text(
          "Registrasi",
          style: TextStyle(color: Colors.blue),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegistrasiPage(),
            ),
          );
        },
      ),
    );
  }
}