import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perpus_mobile/auth/newpass.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

void main() {
  runApp(forgotPage2());
}

class forgotPage2 extends StatelessWidget {
  const forgotPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF8F3ED),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xFFF8F3ED),
          surfaceTintColor: Color(0xFFF8F3ED),
        ),
        body: Center(
          child: CustomContainer(),
        ),
      ),
    );
  }
}

class CustomContainer extends StatefulWidget {
  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
          child: Column(
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
                margin: EdgeInsets.fromLTRB(32, 32, 32, 32),
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
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                        textAlign: TextAlign.start,
                        obscureText: _obscureText,
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
              Container(
                padding: EdgeInsetsDirectional.only(bottom: 0, top: 20, start: 20, end: 20),
                width: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Verification code",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Montserrat",
                              color: const Color.fromARGB(100, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            "Please type the verification code sent to your email.",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              color: const Color.fromARGB(100, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(32, 25, 32, 10),
                      width: 280,
                      child: PinCodeTextField(
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(15),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Color(0xFFF8F3ED),
                          selectedFillColor: Color(0xFFF8F3ED),
                          inactiveFillColor: Color(0xFFF8F3ED),
                          activeColor: Color(0xFFDAAA63),
                          selectedColor: Color(0xFFDAAA63),
                          inactiveColor: Color(0xFFDAAA63),
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: Colors.white,
                        enableActiveFill: true,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        onChanged: (value) {
                          print(value);
                        },
                        onCompleted: (value) {                          
                          print("Completed: $value");
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 26),
                      width: 280,
                      height: 47,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => newPass()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xE8DAAA63),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}