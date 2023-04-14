import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/page/menu_page.dart';
import 'package:flutter_application_1/page/register_page.dart';
import 'package:flutter_application_1/shared/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
// ===============================================

  var email = TextEditingController();

  String password = '';
  var pass = TextEditingController();
  bool isPasswordVisible = true;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    email.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var namaValid = data?['nama'];
    var emailValid = data?['email'];
    var passValid = data?['pass'];

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Column(
                children: const [
                  Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 55.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Welcome back!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              /*email*/ textField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                hinttext: 'Email or Phone number',
                suffixIcon: email.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                        icon: const Icon(Icons.close,
                            size: 20.0, color: Colors.black),
                        onPressed: () => email.clear(),
                      ),
              ),
              const SizedBox(height: 10),
              /*password*/ textField(
                keyboardType: TextInputType.emailAddress,
                controller: pass,
                hinttext: 'Password',
                isPassword: true,
                suffixIcon: pass.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                        icon: isPasswordVisible
                            ? const Icon(Icons.visibility_off,
                                size: 20.0, color: Colors.black)
                            : const Icon(Icons.visibility,
                                size: 20.0, color: Colors.black),
                        onPressed: () => setState(
                          () => isPasswordVisible = !isPasswordVisible,
                        ),
                      ),
                onChange: (value) => setState(() => password = value),
                isPasswordVisible: isPasswordVisible,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              /*login*/ ElevatedButton(
                child: Text('Login'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (email.text != emailValid || pass.text != passValid) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                ' Email atau password Salah!! ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          });
                    } else {
                      Navigator.pushNamed(context, '/menu',
                          arguments: {'username': namaValid});
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 40), // Mengatur ukuran padding tombol
                  backgroundColor:
                      Colors.black, // Mengatur warna latar belakang tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        25), // Mengatur radius sudut tombol
                  ),
                ),
                //fontsize: 25.0,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
