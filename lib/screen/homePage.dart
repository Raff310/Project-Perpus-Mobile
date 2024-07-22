import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:perpus_mobile/screen/bookdetailpage.dart';
import 'package:perpus_mobile/screen/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  final List<List<String>> bookGenres = [
    ['Ninja', 'Fantasy', 'Action'],
    ['Action', 'Monster', 'Supranatural'],
    ['School', 'Action', 'Horror'],
    ['Action', 'Supernatural', 'Psychological'],
  ];

  final List<List<String>> lastreadGenres = [
    ['Romance', 'School', 'Slice of Life'],
    ['Slice of Life', 'Fantasy', 'Magic'],
    ['Ninja', 'Fantasy', 'Action'],
    ['Action', 'Monster', 'Supranatural'],
  ];

  final List<String> bookAuthors = [
    "Masashi Kishimoto",
    "Chugong",
    "Gege Akutami",
    "Adachitoka",
  ];

  final List<String> lastReadAuthors = [
    "Saekisan",
    "Kanehito Yamada",
    "Masashi Kishimoto",
    "Chugong",
  ];

  final List<String> carouselImages = [
    "https://upload.wikimedia.org/wikipedia/id/thumb/9/94/NarutoCoverTankobon1.jpg/220px-NarutoCoverTankobon1.jpg",
    "https://elements-video-cover-images-0.imgix.net/files/221370162/Image+Preview.jpg?auto=compress&h=630&w=1200&fit=crop&crop=edges&fm=jpeg&s=8b52243a342883dbcf93d42b4b81403d",
    "https://elements-video-cover-images-0.imgix.net/files/382689157/Book+Promo+Image.jpg?auto=compress%2Cformat&h=394&w=700&fit=min&s=6ed1c4d093dbad9e9eec1be6365408f9",
    "https://elements-video-cover-images-0.imgix.net/files/357884170/Image_Preview_BookPromoMockUp.jpg?auto=compress&h=800&w=1200&fit=crop&crop=edges&fm=jpeg&s=5d4f96664d424821a93eee68c3ff105a",
    "https://elements-video-cover-images-0.imgix.net/files/414265414/Preview+Image+1440P+%280-00-00-00%29.jpg?auto=compress%2Cformat&h=281&w=500&fit=min&s=dd33b0abbf5271ed1a88cf2748c12185",
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

  final List<String> lastReadImages = [
    "https://upload.wikimedia.org/wikipedia/id/8/82/The_Angel_Next_Door_Spoils_Me_Rotten_volume_1_cover.jpg",
    "https://upload.wikimedia.org/wikipedia/id/2/29/FRIEREN_1_COV_Ina_%282%29.jpg",
    "https://upload.wikimedia.org/wikipedia/id/thumb/9/94/NarutoCoverTankobon1.jpg/220px-NarutoCoverTankobon1.jpg",
    "https://upload.wikimedia.org/wikipedia/id/thumb/9/99/Solo_Leveling_Webtoon.png/330px-Solo_Leveling_Webtoon.png",
  ];

  final List<String> lastReadTitles = [
    "Next door",
    "Frieren",
    "Naruto",
    "Solo Leveling",
  ];

  final List<double> lastReadRatings = [
    4.7,
    4.6,
    4.5,
    4.8,
  ];

  final List<String> synopsisBook = [
    "Naruto (ナルト) adalah sebuah serial manga karya Masashi Kishimoto yang diadaptasi menjadi serial anime. Manga Naruto bercerita seputar kehidupan tokoh utamanya, Naruto Uzumaki, seorang ninja yang hiperaktif, periang, dan ambisius yang ingin mewujudkan keinginannya untuk mendapatkan gelar Hokage, pemimpin dan ninja terkuat di desanya. Serial ini didasarkan pada komik one-shot oleh Kishimoto yang diterbitkan dalam edisi Akamaru Jump pada Agustus 1997.",
    'Dunia diserang monster! Muncullah "hunter" untuk menyerang monster-monster itu. Di kalangan hunter, ada yang disebut hunter terlemah di dunia. Itulah julukan Seong Jin-woo. Masuk rumah sakit adalah kebiasaannya setelah masuk ke dungeon. Suatu hari, saat melakukan raid, suatu peristiwa tragis menimpanya. Peristiwa itu hampir merenggut nyawanya. Namun, saat tersadar, dia mendapati dirinya masih hidup dan melihat sesuatu yang tidak bisa dilihat orang lain. Sejak saat itu, kehidupan Seong Jin-woo berubah. Inilah perjalanan Seong Jin-woo untuk menjadi hunter terkuat di dunia!',
    "Manga ini mengisahkan Yuji yang masuk ke Klub Penelitian Ilmu Gaib, agar bisa bersantai dan bergaul dengan para senior. Sayang, senior-seniornya telah membuka segel dari jimat kutukan tingkat tinggi di sekolahnya, dan menarik roh kutukan muncul. Jimat tersebut menarik Jurei, yaitu makhluk mirip monster yang muncul melalui emosi negatif manusia.",
    "Hiyori Iki adalah seorang siswi SMP biasa hingga dirinya tertabrak sebuah bus saat hendak menyelamatkan nyawa seseorang yang mengenakan jaket olahraga bernama Yato. Insiden ini mengubah dirinya menjadi setengah-hantu. Segera setelah ia tahu bahwa Yato adalah dewa. Ia akhirnya terseret ke dunia para Dewa dan di saat yang sama harus mempertahankan keberadaannya di dunia manusia.",
  ];

  final List<String> lastreadSynopsis = [
    "Amane tinggal sendiri di sebuah apartemen, dan gadis tercantik di sekolah, Mahiru, menjadi tetangganya. Mereka hampir tidak pernah berbicara meskipun berada di kelas yang sama, sampai suatu hari Amane melihat Mahiru dalam kesusahan di tengah hujan dan meminjamkan payungnya. Untuk membalas budi, Mahiru menawarkan bantuan untuk mengurus rumahnya, dan hubungan mereka perlahan berkembang saat jarak di antara keduanya semakin dekat.",
    "Sousou no Frieren bercerita tentang Frieren, mage dari ras elf yang melakukan petualangan demi mempelajari sihir dan lebih mengenal manusia. Sebelumnya, Frieren adalah bagian dari The Hero Party, kelompok pahlawan beranggotakan 4 orang yang berhasil mengalahkan Raja Iblis.",
    "Naruto (ナルト) adalah sebuah serial manga karya Masashi Kishimoto yang diadaptasi menjadi serial anime. Manga Naruto bercerita seputar kehidupan tokoh utamanya, Naruto Uzumaki, seorang ninja yang hiperaktif, periang, dan ambisius yang ingin mewujudkan keinginannya untuk mendapatkan gelar Hokage, pemimpin dan ninja terkuat di desanya. Serial ini didasarkan pada komik one-shot oleh Kishimoto yang diterbitkan dalam edisi Akamaru Jump pada Agustus 1997.",
    'Dunia diserang monster! Muncullah "hunter" untuk menyerang monster-monster itu. Di kalangan hunter, ada yang disebut hunter terlemah di dunia. Itulah julukan Seong Jin-woo. Masuk rumah sakit adalah kebiasaannya setelah masuk ke dungeon. Suatu hari, saat melakukan raid, suatu peristiwa tragis menimpanya. Peristiwa itu hampir merenggut nyawanya. Namun, saat tersadar, dia mendapati dirinya masih hidup dan melihat sesuatu yang tidak bisa dilihat orang lain. Sejak saat itu, kehidupan Seong Jin-woo berubah. Inilah perjalanan Seong Jin-woo untuk menjadi hunter terkuat di dunia!',
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
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F3ED),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Velook",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 20),
                  ),
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
            const SizedBox(height: 60),
            CarouselSlider.builder(
              carouselController: _carouselController,
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                viewportFraction: 0.945,
                enlargeCenterPage: true,
              ),
              itemCount: carouselImages.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: screenWidth * 0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(carouselImages[index]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(17),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                carouselImages.length,
                (index) {
                  return Container(
                    width: 9.0,
                    height: 9.0,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? const Color(0xFFDAAA63)
                          : const Color(0xFFD9D9D9),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Trending Books",
                  style: TextStyle(fontFamily: "Montserrat", fontSize: 15),
                ),
              ),
            ),
            const SizedBox(height: 30),
            LayoutBuilder(
              builder: (context, constraints) {
                final double itemWidth = constraints.maxWidth * 0.25;
                final double itemHeight = itemWidth * 1.5;
                return Container(
                  height: itemHeight + 40,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                  boxShadow: const [
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
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(height: 3, color: Color(0xffDAAA63)),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Last Read",
                  style: TextStyle(fontFamily: "Montserrat", fontSize: 15),
                ),
              ),
            ),
            const SizedBox(height: 30),
            LayoutBuilder(
              builder: (context, constraints) {
                final double itemWidth = constraints.maxWidth * 0.25;
                final double itemHeight = itemWidth * 1.5;
                return Container(
                  height: itemHeight + 40,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: lastReadImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => _navigateToBookDetail(
                          lastReadTitles[index],
                          lastReadImages[index],
                          lastReadRatings[index],
                          lastReadAuthors[index],
                          lastreadSynopsis[index],
                          lastreadGenres[index],
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
                                    image: NetworkImage(lastReadImages[index]),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
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
                                lastReadTitles[index],
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
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}