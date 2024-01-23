import 'package:flutter/material.dart';
import 'package:login_signup_app_flutter/sign_up_page.dart';
import 'package:login_signup_app_flutter/welcome_page.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final minLength = 8;
  bool isPassHidden = true;
  String? invalidPassResult;

  String? invalidPass(String pass) {
    if (pass.length < minLength) {
      return "Password must be minimum $minLength characters";
    }
    if (!RegExp(r'[A-Z]').hasMatch(pass)||
        !RegExp(r'\d').hasMatch(pass) ||
        !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(pass)) {
      return "PLEASE ENTER VALID PASSWORD!!";
    }
    return null;
  }

  bool emailFormat(String email){
    return RegExp(r'^[a-zA-Z0-9.-]+@[a-z]+.[in|com]').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF93D5F6),
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xFFB9D221),
          ),
        ),
        backgroundColor: const Color(0xFF02213D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  prefixIcon: const Icon(Icons.verified_user_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: TextField(
                  controller: passController,
                  maxLength: 20,
                  obscureText: isPassHidden,
                  onChanged: (pass) {
                    setState(() {
                      invalidPassResult = invalidPass(pass);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPassHidden
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isPassHidden = !isPassHidden;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 50),

            ElevatedButton(
              onPressed: () {
                if (emailController.text.isEmpty || passController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill in all fields'),
                    ),
                  );
                }
                else if(!emailFormat(emailController.text)){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid Email Format'
                      )
                      )
                      );
                }
                else {
                  if (invalidPassResult != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(invalidPassResult!),
                      ),
                    );
                  }

                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login Successful'),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 2),() {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (
                            context) => const WelcomePage()
                        ),
                      );
                    });
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, foregroundColor: Colors.lime),
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, foregroundColor: Colors.lime),
              child: const Text('Go to Sign Up'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ForgotPass()),
                );
              },
              child: const Text('Forgot Password?',style: TextStyle(color: Color(
                  0xFFFF6002)
              )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

