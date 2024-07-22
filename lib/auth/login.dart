import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:perpus_mobile/auth/forgotpass1.dart';
import 'package:perpus_mobile/auth/register.dart';
import 'package:perpus_mobile/screen/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _login() async {
    setState(() {
      _emailError = _emailController.text.isEmpty ? 'Email cannot be empty' : null;
      _passwordError = _passwordController.text.isEmpty ? 'Password cannot be empty' : null;
    });

  if (_emailError == null && _passwordError == null) {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login'),
        body: {
          'email': _emailController.text,
          'password': _passwordController.text,
        },
      );

   if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data['token']);
        await prefs.setString('email', _emailController.text); // Save email to SharedPreferences
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Nav()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 156, 1, 143),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 8, 19),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'images/velook_logo.jpg',
                          ),
                        ),
                      ),
                      child: Container(
                        width: 307,
                        height: 291,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(32, 32, 32, 0),
                    width: 250,
                    height: 52,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFDAAA63)),
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFF8F3ED),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xFFABA39F),
                          ),
                          border: InputBorder.none,                          
                        ),
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  if (_emailError != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 65, 0),
                      child: Text(
                        _emailError!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 18, 0, 2),
                    width: 250,
                    height: 52,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFDAAA63)),
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFF8F3ED),
                    ),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 12, 40, 12),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: _obscureText,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color(0xFFABA39F),
                              ),
                              border: InputBorder.none,                              
                            ),
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 12,
                          child: IconButton(
                            onPressed: _toggleVisibility,
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_passwordError != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 32, 0),
                      child: Text(
                        _passwordError!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 22, 0, 10),
                    width: 120,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xE8DAAA63),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => forgotPage()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 4.4, 4),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          color: Color(0x941E1E1E),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 5.7, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 3.5, 0),
                          child: Text(
                            'No account? ',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              color: Color(0x941E1E1E),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterPage()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
                            child: Text(
                              'Create One',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                fontSize: 11,
                                color: Color(0x8C00B3FF),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: SizedBox(
                      width: 93,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 6, 13, 4),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                                  ),
                                ),
                              ),
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),    
    );
  }
}