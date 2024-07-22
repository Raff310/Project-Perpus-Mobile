import 'package:flutter/material.dart';
import 'package:perpus_mobile/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String nama = ""; // Variabel untuk menyimpan nama pengguna
  String email = ""; // Variabel untuk menyimpan email pengguna
 
  @override
  void initState() {
    super.initState();
    _loadProfileData(); 
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Mengambil data dari SharedPreferences dan menyimpannya ke dalam variabel state
      nama = prefs.getString('nama') ?? "";
      email = prefs.getString('email') ?? ""; 
    });
  }

  void _editProfile(BuildContext context) {
    TextEditingController namaController = TextEditingController(text: nama);
    TextEditingController emailController = TextEditingController(text: email);    

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          iconColor: Color(0xFFF8F3ED),
          title: Text("Edit Profile"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),              
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nama = namaController.text;
                  email = emailController.text;                  
                });

                // Simpan perubahan ke SharedPreferences setelah disimpan
                _saveProfileChanges();

                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
          backgroundColor: Color(0xFFF8F3ED),
        );
      },
    );
  }

  Future<void> _saveProfileChanges() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', nama);
    await prefs.setString('email', email);    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F3ED),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F3ED),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Profile"),
          ],
        ),
        actions: [
          SizedBox(width: 55),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              SizedBox(
                width: 154,
                height: 154,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Image.asset('assets/images/gwe.jpg', fit: BoxFit.cover, width: 154, height: 154),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          // Implement logic to change profile picture
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xffdaaa63),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                nama,
                style: TextStyle(fontSize: 23, fontFamily: 'Montserrat'),
              ),
              Text(
                email,
                style: TextStyle(fontSize: 19, fontFamily: 'Montserrat'),
              ),
              SizedBox(height: 40),
              Divider(color: Color(0XFFDAAA63)),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromARGB(0, 0, 0, 0),
                  ),
                  child: const Icon(Icons.person),
                ),
                title: Text(
                  nama,
                  style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
                ),
                trailing: GestureDetector(
                  onTap: () => _editProfile(context),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(0, 0, 0, 0),
                    ),
                    child: Icon(Icons.edit),
                  ),
                ),
              ),
              Divider(color: Color(0XFFDAAA63)),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromARGB(0, 0, 0, 0),
                  ),
                  child: const Icon(Icons.mail_outline),
                ),
                title: Text(
                  email,
                  style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
                ), 
              ), 
              Divider(color: Color(0XFFDAAA63)),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Log Out"),
                        content: Text("Are you sure want to log out?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
                            child: Text("Yes"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 1, 0, 1),
                  child: const ListTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.logout, color: Colors.red,),
                        SizedBox(width: 25),
                        Text("Log Out", style: TextStyle(fontFamily: "Montserrat", fontSize: 15, color: Colors.red),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
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
                  width: 200,
                  height: 184,
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
