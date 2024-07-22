import 'package:flutter/material.dart';
import 'package:perpus_mobile/screen/bookdetailpage.dart';
import 'package:perpus_mobile/screen/profile.dart';

class libraryPage extends StatefulWidget {
  const libraryPage({super.key});

  @override
  State<libraryPage> createState() => _libraryPageState();
}

class _libraryPageState extends State<libraryPage> {

  final List<String> bookAuthors = [
    "Author 1",
    "Author 2",
    "Author 3",
    "Author 4",
  ];

  final List<String> lastReadAuthors = [
    "Author 3",
    "Author 4",
    "Author 1",
    "Author 2",
  ];

  final List<String> bookImages = [
    "https://marketplace.canva.com/EAFPHUaBrFc/1/0/1003w/canva-black-and-white-modern-alone-story-book-cover-QHBKwQnsgzs.jpg",
    "https://marketplace.canva.com/EAFaQMYuZbo/1/0/1003w/canva-brown-rusty-mystery-novel-book-cover-hG1QhA7BiBU.jpg",
    "https://marketplace.canva.com/EAFtFDV7Ktg/1/0/1003w/canva-biru-hijau-ilustrasi-novel-sampul-buku-3j1ZL8dVlxo.jpg",
    "https://marketplace.canva.com/EAFf0E5urqk/1/0/1003w/canva-blue-and-green-surreal-fiction-book-cover-53S3IzrNxvY.jpg",
  ];

  final List<String> bookTitles = [
    "Naruto",
    "Soul",
    "Jejak Cinta",
    "Hide and Seek",
  ];

  final List<String> lastReadImages = [
    "https://marketplace.canva.com/EAFtFDV7Ktg/1/0/1003w/canva-biru-hijau-ilustrasi-novel-sampul-buku-3j1ZL8dVlxo.jpg",
    "https://marketplace.canva.com/EAFf0E5urqk/1/0/1003w/canva-blue-and-green-surreal-fiction-book-cover-53S3IzrNxvY.jpg",
    "https://marketplace.canva.com/EAFPHUaBrFc/1/0/1003w/canva-black-and-white-modern-alone-story-book-cover-QHBKwQnsgzs.jpg",
    "https://marketplace.canva.com/EAFaQMYuZbo/1/0/1003w/canva-brown-rusty-mystery-novel-book-cover-hG1QhA7BiBU.jpg",
  ];

  final List<String> lastReadTitles = [
    "Jejak Cinta",
    "Hide",
    "Alone",
    "Soul",
  ];

  final List<double> bookRatings = [
    4.5,
    4.8,
    4.7,
    4.6,
  ];

  final List<double> lastReadRatings = [
    4.7,
    4.6,
    4.5,
    4.8,
  ];

  final List<String> synopsisBook = [
    "Naruto (ナルト) adalah sebuah serial manga karya Masashi Kishimoto yang diadaptasi menjadi serial anime. Manga Naruto bercerita seputar kehidupan tokoh utamanya, Naruto Uzumaki, seorang ninja yang hiperaktif, periang, dan ambisius yang ingin mewujudkan keinginannya untuk mendapatkan gelar Hokage, pemimpin dan ninja terkuat di desanya. Serial ini didasarkan pada komik one-shot oleh Kishimoto yang diterbitkan dalam edisi Akamaru Jump pada Agustus 1997.",
    "Novel ini awalnya diterbitkan dalam bentuk novel web di layanan komik dan fiksi digital milik perusahaan Kakao, yaitu KakaoPage pada tanggal 25 Juli 2016. Setelah itu, novel ini diterbitkan dalam bentuk novel ringan dalam media cetak oleh D&C Media di bawah label dagang Papyrus pada tanggal 4 November 2016. Novel ini kemudian dilisensikan dalam bentuk novel web berbahasa Inggris dengan judul Only I Level Up dalam layanan Webnovel dan dalam bentuk novel cetak berbahasa Inggris oleh penerbit Yen On."
    "Manga ini mengisahkan Yuji yang masuk ke Klub Penelitian Ilmu Gaib, agar bisa bersantai dan bergaul dengan para senior. Sayang, senior-seniornya telah membuka segel dari jimat kutukan tingkat tinggi di sekolahnya, dan menarik roh kutukan muncul. Jimat tersebut menarik Jurei, yaitu makhluk mirip monster yang muncul melalui emosi negatif manusia.",
  ];

  void _navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()
      ),
    );
  }

  void _navigateToBookDetail(String title, String imageUrl, double rating, String author, String synopsis) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          bookTitle: title,
          bookImageUrl: imageUrl,
          bookRating: rating,
          bookStock: 10, 
          author: author,
          genres: ['Romance | Fantasy | Horror'],
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
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Material(
                    child: Text(
                      "Library",
                      style: TextStyle(fontFamily: "Montserrat", fontSize: 20),
                    ),
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
            const SizedBox(height: 50),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Favorite",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 15),
                  ),
                  // Icon(Icons.arrow_forward_outlined, size: 25),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bookImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => _navigateToBookDetail(lastReadTitles[index], lastReadImages[index], bookRatings[index], bookAuthors[index], synopsisBook[index]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 25),
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(bookImages[index]),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            bookTitles[index],
                            style: const TextStyle(fontFamily: "Montserrat", fontSize: 15),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(height: 3, color: Color(0xffDAAA63)),
            ),
            const SizedBox(height: 18),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Currentlly Borrowed",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 15),
                  ),
                  // Icon(Icons.arrow_forward_outlined, size: 25),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: lastReadImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => _navigateToBookDetail(lastReadTitles[index], lastReadImages[index], bookRatings[index], bookAuthors[index], synopsisBook[index]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 25),
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(lastReadImages[index]),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            lastReadTitles[index],
                            style: const TextStyle(fontFamily: "Montserrat", fontSize: 15),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}