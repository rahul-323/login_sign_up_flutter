
import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController emailController= TextEditingController();
  bool emailFormat(String email){
    return RegExp(r'^[a-zA-Z0-9.-]+@[a-z]+.[in|com]').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF93D5F6),
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xFFB9D221),
          ),
        ),
        backgroundColor: const Color(0xFF02213D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Enter Email',
                icon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if(!emailFormat(emailController.text)){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid email format'),
                    ),
                  );
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content:
                      Text('Verification code send to E-mail'
                      )
                      )
                  );
                }

              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.lime,
              ),
              child: const Text('Reset Password',
              ),
            ),
          ],
        ),
      ),
    );
  }
}