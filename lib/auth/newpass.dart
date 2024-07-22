import 'package:flutter/material.dart';
import 'package:perpus_mobile/auth/login.dart';

class newPass extends StatefulWidget {
  @override
  _newPassState createState() => _newPassState();
}

class _newPassState extends State<newPass> {
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          const Padding(
            padding: const EdgeInsets.only(left: 45.0),
            child: Text(
              'Create New Password',
              style: TextStyle(
                fontFamily: 'Abyssinica SIL',
                fontWeight: FontWeight.w400,
                fontSize: 28,
                color: Color(0xFF000000),
              ),
            ),
          ),
          SizedBox(height: 20),
          const Padding(
            padding: const EdgeInsets.only(left: 45.0, right: 70),
            child: Text(
              'Your new password must be different from previous used password ',
              style: TextStyle(
                fontFamily: 'Abyssinica SIL',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color.fromARGB(100, 0, 0, 0),
              ),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              width: 340,
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
                      textAlign: TextAlign.start,
                      obscureText: _isObscurePassword,
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
          SizedBox(height: 10),
          const Padding(
            padding: const EdgeInsets.only(left: 45.0, right: 70),
            child: Text(
              '! Insert at least 6 Character',
              style: TextStyle(
                fontFamily: 'Abyssinica SIL',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color.fromARGB(100, 0, 0, 0),
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              width: 340,
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
                      textAlign: TextAlign.start,
                      obscureText: _isObscureConfirmPassword,
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
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
              width: 180,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xE8DAAA63),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Confirm',
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
          SizedBox(height: 140),
          Container(
            alignment: Alignment.center,
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
                width: 240,
                height: 224,
              ),
            ),
          ),
        ],
      ),
    );
  }
}