import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

class SignInvalidation extends StatefulWidget {
  const SignInvalidation({super.key});

  @override
  _SignInvalidationState createState() => _SignInvalidationState();
}

class _SignInvalidationState extends State<SignInvalidation> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String _message = '';
  late EmailAuth emailAuth;

  @override
  void initState() {
    super.initState();
    emailAuth = EmailAuth(sessionName: "Test Session");
  }

  void sendOTP() async {
    bool res = await emailAuth.sendOtp(
      recipientMail: _emailController.text,
    );
    setState(() {
      _message = res ? 'OTP Sent' : 'Unable to send OTP';
    });
  }

  void verifyOTP() async {
    bool res = emailAuth.validateOtp(
      recipientMail: _emailController.text,
      userOtp: _otpController.text,
    );
    setState(() {
      _message = res ? 'OTP Verified' : 'Invalid OTP';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Stickl3r"),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Stickl3r",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 500,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'MOBILE',
                      hintText: 'Enter Your  Number',
                      suffixIcon: TextButton(
                        onPressed: sendOTP,
                        child: const Text('Send OTP'),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 500,
                  child: TextField(
                    controller: _otpController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'OTP',
                      hintText: 'Enter Your OTP',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: verifyOTP,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(250, 60),
                ),
                child: const Text('Verify OTP'),
              ),
              const SizedBox(height: 20),
              Text(
                _message,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "OR",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the dashboard
                  Navigator.pushNamed(context, '/addkid');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(250, 60),
                ),
                child: const Text('Sign In with Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SignInvalidation(),
  ));
}
