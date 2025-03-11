import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/network_listener.dart';

import '../home.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _passwordHasError = false; // Flag for password error state
  bool _emailHasError = false; // Flag for password error state

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _login() {
    setState(() {
      _passwordHasError = _passwordController.text.isEmpty; // Update error state
      _emailHasError = _emailController.text.isEmpty; // Update error state
    });

    if (_formKey.currentState!.validate()) {
      // ScaffoldMessenger.of(context).showSnackBar(
      // const SnackBar(content: Text("Logging in...")),
      // );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NetworkListener(child: HomePage())),
      );
      // Future.delayed(const Duration(seconds: 0), () {
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  SvgPicture.asset("assets/images/logo.svg", height: 80), // App Logo
                  const SizedBox(height: 10),
                  Text("Adhicine", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF7185ce))),
                  const SizedBox(height: 40),
                  Text("Sign In", style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),

                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      // prefixIcon: const Icon(Icons.alternate_email, color: Color(0xFF46d0c3)),
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: _emailHasError ? Colors.red : Color(0xFF46d0c3), // Change color if empty
                      ),
                      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                        return "Incorrect email address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: _passwordHasError ? Colors.red : Color(0xFF46d0c3), // Change color if empty
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                        onPressed: _togglePasswordVisibility,
                      ),
                      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Forgot password action
                      },
                      child: Text("Forgot Password?", style: GoogleFonts.poppins(fontSize: 14, color: Colors.blue)),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Sign In Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6f8bef),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      ),
                      child: Text("Sign In", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // OR Divider
                  Row(
                    children: [
                      Expanded(child: Divider(thickness: 1, color: Colors.grey[300])),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("OR"),
                      ),
                      Expanded(child: Divider(thickness: 1, color: Colors.grey[300])),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Google Sign-In Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Google sign-in action
                      },
                      icon: SvgPicture.asset("assets/images/google_logo.svg", height: 24),
                      label: Text("Continue with Google", style: GoogleFonts.poppins(fontSize: 16, color: Colors.black)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Sign Up Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New to Adhicine?", style: GoogleFonts.poppins(fontSize: 14)),
                      TextButton(
                        onPressed: () {
                          // Navigate to Sign Up
                        },
                        child: Text("Sign Up", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF6f8bef))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
