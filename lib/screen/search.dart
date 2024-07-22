import 'package:flutter/material.dart';
import 'package:perpus_mobile/screen/bookdetailpage.dart';
import 'package:perpus_mobile/screen/navbar.dart';
import 'package:perpus_mobile/screen/profile.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isSelectedEducation = false;
  bool isSelectedAction = false;
  bool isSelectedRomance = false;
  bool isSelectedComedy = false;

  final List<String> bookAuthors = [
    "Masashi Kishimoto",
    "Chugong",
    "Gege Akutami",
    "Adachitoka",
  ];
  
  final List<String> bookImages = [
    "https://upload.wikimedia.org/wikipedia/id/thumb/9/94/NarutoCoverTankobon1.jpg/220px-NarutoCoverTankobon1.jpg",
    "https://upload.wikimedia.org/wikipedia/id/thumb/9/99/Solo_Leveling_Webtoon.png/330px-Solo_Leveling_Webtoon.png",
    "https://upload.wikimedia.org/wikipedia/id/4/46/Jujutsu_kaisen.jpg",
    "https://upload.wikimedia.org/wikipedia/id/1/12/BerkasNoragami_volume_1_cover.jpg",
  ];

  final List<String> bookTitles = [
    "Naruto",
    "Solo Leveling",
    "Jujutsu Kaisen",
    "Noragami",
  ];
  
  final List<double> bookRatings = [
    4.5,
    4.8,
    4.7,
    4.6,
  ];
  
  final List<List<String>> bookGenres = [
    ['Action', 'Supernatural', 'Psychological'],
    ['Ninja', 'Fantasy', 'Action'],
    ['Action', 'Monster', 'Supranatural'],
    ['School', 'Action', 'Horror'],    
  ];

  final List<String> synopsisBook = [
    "Naruto (ナルト) adalah sebuah serial manga karya Masashi Kishimoto yang diadaptasi menjadi serial anime. Manga Naruto bercerita seputar kehidupan tokoh utamanya, Naruto Uzumaki, seorang ninja yang hiperaktif, periang, dan ambisius yang ingin mewujudkan keinginannya untuk mendapatkan gelar Hokage, pemimpin dan ninja terkuat di desanya. Serial ini didasarkan pada komik one-shot oleh Kishimoto yang diterbitkan dalam edisi Akamaru Jump pada Agustus 1997.",
    'Dunia diserang monster! Muncullah "hunter" untuk menyerang monster-monster itu. Di kalangan hunter, ada yang disebut hunter terlemah di dunia. Itulah julukan Seong Jin-woo. Masuk rumah sakit adalah kebiasaannya setelah masuk ke dungeon. Suatu hari, saat melakukan raid, suatu peristiwa tragis menimpanya. Peristiwa itu hampir merenggut nyawanya. Namun, saat tersadar, dia mendapati dirinya masih hidup dan melihat sesuatu yang tidak bisa dilihat orang lain. Sejak saat itu, kehidupan Seong Jin-woo berubah. Inilah perjalanan Seong Jin-woo untuk menjadi hunter terkuat di dunia!',
    "Manga ini mengisahkan Yuji yang masuk ke Klub Penelitian Ilmu Gaib, agar bisa bersantai dan bergaul dengan para senior. Sayang, senior-seniornya telah membuka segel dari jimat kutukan tingkat tinggi di sekolahnya, dan menarik roh kutukan muncul. Jimat tersebut menarik Jurei, yaitu makhluk mirip monster yang muncul melalui emosi negatif manusia.",
    "Hiyori Iki adalah seorang siswi SMP biasa hingga dirinya tertabrak sebuah bus saat hendak menyelamatkan nyawa seseorang yang mengenakan jaket olahraga bernama Yato. Insiden ini mengubah dirinya menjadi setengah-hantu. Segera setelah ia tahu bahwa Yato adalah dewa. Ia akhirnya terseret ke dunia para Dewa dan di saat yang sama harus mempertahankan keberadaannya di dunia manusia.",
  ];

void _navigateToProfile() {    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }

void _navigateToBookDetail(String title, String imageUrl, double rating, String author, String synopsis, List<String> bookGenres) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          bookTitle: title,
          bookImageUrl: imageUrl,
          bookRating: rating,
          bookStock: 10,
          author: author,
          genres: bookGenres,
          synopsisBook: synopsis,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3ED),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Nav();
                        }));
                  }, icon: Icon(Icons.arrow_back)),
                  // const Material(
                  //   child: Text(
                  //     "Hello", 
                  //     style: TextStyle(fontFamily: "Montserrat", fontSize: 20),
                  //   ),
                  // ),
                  InkWell(
                    onTap: _navigateToProfile,
                    child: const CircleAvatar(
                      radius: 20, 
                      backgroundImage: AssetImage("images/gwe.jpg"),
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [                
                const SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffDAAA63)),
                      borderRadius: BorderRadius.all(Radius.circular(19)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffDAAA63)),
                      borderRadius: BorderRadius.all(Radius.circular(19)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(19)),
                    ),
                    hintText: 'Book, Authors, Novel',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color.fromARGB(66, 0, 0, 0),
                    ),
                    suffixIcon: Icon(Icons.search, color: Colors.black),
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.only(right: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(fontFamily: "Montserrat", fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputChip(
                    side: BorderSide(color: Color(0xFFDAAA63)),
                    selectedColor: Color(0xFFDAAA63).withOpacity(0.5),
                    showCheckmark: false,
                    avatar: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://cdn-icons-png.freepik.com/512/4729/4729436.png',
                      ),
                    ),
                    label: const Text('Education'),
                    selected: isSelectedEducation,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        isSelectedEducation = selected;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  InputChip(
                    side: BorderSide(color: Color(0xFFDAAA63)),
                    selectedColor: Color(0xFFDAAA63).withOpacity(0.5),
                    showCheckmark: false,
                    avatar: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://cdn-icons-png.freepik.com/256/599/599523.png?semt=ais_hybrid',
                      ),
                    ),
                    label: const Text('Action'),
                    selected: isSelectedAction,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        isSelectedAction = selected;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  InputChip(
                    side: BorderSide(color: Color(0xFFDAAA63)),
                    selectedColor: Color(0xFFDAAA63).withOpacity(0.5),
                    showCheckmark: false,
                    avatar: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://cdn-icons-png.freepik.com/512/2926/2926754.png',
                      ),
                    ),
                    label: const Text('Romance'),
                    selected: isSelectedRomance,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        isSelectedRomance = selected;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  InputChip(
                    side: BorderSide(color: Color(0xFFDAAA63)),
                    selectedColor: Color(0xFFDAAA63).withOpacity(0.5),
                    showCheckmark: false,
                    avatar: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/3658/3658528.png',
                      ),
                    ),
                    label: const Text('Comedy'),
                    selected: isSelectedComedy,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        isSelectedComedy = selected;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          const Padding(
            padding: EdgeInsets.only(right: 180),
              child: Column(                  
                children: [
                  Text(
                  "Newest",
                  style: TextStyle(fontFamily: "Montserrat", fontSize: 17),
                  ),
                ],
              ),
            ),
            SizedBox(height: 27),
            LayoutBuilder(
              builder: (context, constraints) {
                final double itemWidth = constraints.maxWidth * 0.30;
                final double itemHeight = itemWidth * 1.5;
                return Container(
                  height: itemHeight + 40,
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bookImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => _navigateToBookDetail(
                          bookTitles[index],
                          bookImages[index],
                          bookRatings[index],
                          bookAuthors[index],
                          synopsisBook[index],
                          bookGenres[index],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: itemWidth,
                                height: itemHeight,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(bookImages[index]),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(1, 1),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                bookTitles[index],
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
