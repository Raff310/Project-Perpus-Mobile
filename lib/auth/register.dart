import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:perpus_mobile/screen/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController = TextEditingController();

   void _toggleObscurePassword() {
    setState(() {
      _isObscurePassword = !_isObscurePassword;
    });
  }

  void _toggleObscureConfirmPassword() {
    setState(() {
      _isObscureConfirmPassword = !_isObscureConfirmPassword;
    });
  }

  Future<void> _register() async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/register'),
      body: {
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
        'password_confirmation': _passwordConfirmationController.text,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', data['token']);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  Nav()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed')),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F3ED),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFFF8F3ED),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 45.0),
              child: Text(
                'Create New Account',
                style: TextStyle(
                  fontFamily: 'Abyssinica SIL',
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                width: 320,
                height: 52,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFDAAA63)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xFFABA39F),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                width: 320,
                height: 52,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFDAAA63)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xFFABA39F),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                width: 320,
                height: 52,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFDAAA63)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 12, 40, 12),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: _isObscurePassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xFFABA39F),
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
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
                        onPressed: _toggleObscurePassword,
                        icon: Icon(
                          _isObscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                width: 320,
                height: 52,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFDAAA63)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 12, 40, 12),
                      child: TextField(
                        controller: _passwordConfirmationController,
                        obscureText: _isObscureConfirmPassword,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xFFABA39F),
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
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
                        onPressed: _toggleObscureConfirmPassword,
                        icon: Icon(
                          _isObscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 38),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 26),
                width: 120,
                height: 40,
                child: ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xE8DAAA63),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(16, 0, 8, 19),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'images/velook_logo.jpg',
                    ),
                  ),
                ),
                child: Container(
                  width: 240,
                  height: 224,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}