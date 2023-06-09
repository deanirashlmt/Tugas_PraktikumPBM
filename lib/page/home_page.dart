import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/login_page.dart';
import 'package:flutter_application_1/shared/components.dart';
import 'package:flutter_application_1/page/register_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                // image: NetworkImage('https://cdn-icons-png.flaticon.com/512/6422/6422210.png'),
                //   image: NetworkImage(
                //       'https://icon-library.com/images/facebook-icon-black/facebook-icon-black-12.jpg'),
                image: NetworkImage(
                  'https://iconape.com/wp-content/files/kz/12312/png/weight.png',
                ),
                // ,Image(
                //   'https://www.freepnglogos.com/uploads/google-plus-png-logo/plus-original-google-solid-google-world-brand-png-logo-21.png',
                // ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Id',
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'e',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'aL',
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Let\'s make happiness',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              commonButton(
                text: 'Log In',
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                color: Colors.amber,
                textcolor: Colors.black,
                fontsize: 40.0,
                border: 3.0,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              commonButton(
                text: 'Sign Up',
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                fontsize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
