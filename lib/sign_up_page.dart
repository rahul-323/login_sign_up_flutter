import 'package:flutter/material.dart';
import 'package:login_signup_app_flutter/welcome_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController userController= TextEditingController();

  final minLength = 8;
  bool isPassHidden=true;
  String? invalidPassResult;

  String? invalidPass(String pass) {
    if (pass.length < minLength) {
      return "Password must be minimum $minLength characters";
    }
    if(!RegExp(r'\d').hasMatch(pass)||!RegExp(r'[A-Z]').hasMatch(pass)||!RegExp(r'[@#$%^&*()]').hasMatch(pass))
    {
      return"Password must contain at least one Capital letter or One Number  and Special Character";
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
          'Sign-Up Page',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color:Color(0xFFB9D221),

          ),
        ),
        backgroundColor: const Color(0xFF02213D),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: userController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Enter UserName',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.safety_check_sharp),
                  hintText: 'Enter Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
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
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'Enter password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPassHidden
                            ? Icons.visibility_off
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          isPassHidden = !isPassHidden;
                        });

                      },

                    ),
                    suffix: const Text(
                      'Must contain 1 cap,1 number,1 special',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
        ElevatedButton(
        onPressed: () {
          // Check if email or password is empty
          if (emailController.text.isEmpty || passController.text.isEmpty||userController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please fill in all fields'),
              ),
            );
          }
          else if(!emailFormat(emailController.text)){
                    ScaffoldMessenger.of(context).
                    showSnackBar(const SnackBar(content: Text('Invalid email format'
                    )
                    )
                    );
          }else {

            if (invalidPassResult != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(invalidPassResult!),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('SignUp Successful'),
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
            primary: Colors.black,
            foregroundColor: Colors.lime
        ),
        child: const Text('Sign-Up'),
      ),

          ],
        ),
      ),
    );
  }
}

