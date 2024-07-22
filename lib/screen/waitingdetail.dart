import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:perpus_mobile/screen/profile.dart';

class WaitingDetailPage extends StatefulWidget {
  const WaitingDetailPage({
    Key? key,
    required this.bookTitle,
    required this.bookImageUrl,
    required this.bookRating,
    required this.bookStock,
    required this.author,
    required this.genres,
    required this.synopsisBook,
  }) : super(key: key);

  final String bookTitle;
  final String bookImageUrl;
  final double bookRating;
  final int bookStock;
  final String author;
  final List<String> genres;
  final String synopsisBook;

  @override
  State<WaitingDetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<WaitingDetailPage> {
  bool _isExpanded = false;
  double _userRating = 0.0;
  bool _isBookmarked = false;
  bool _isBookBorrowed = false;
  final TextEditingController _commentController = TextEditingController();
  final List<Map<String, dynamic>> _reviews = [];

  final List<String> lastReadAuthors = [
    "Author 3",
    "Author 4",
    "Masashi Kishimoto",
    "Author 2",
  ];

  final List<double> bookRatings = [
    4.5,
    4.8,
    4.7,
    4.6,
  ];

  final List<String> lastReadImages = [
    "https://marketplace.canva.com/EAFtFDV7Ktg/1/0/1003w/canva-biru-hijau-ilustrasi-novel-sampul-buku-3j1ZL8dVlxo.jpg",
    "https://marketplace.canva.com/EAFf0E5urqk/1/0/1003w/canva-blue-and-green-surreal-fiction-book-cover-53S3IzrNxvY.jpg",
    "https://upload.wikimedia.org/wikipedia/id/thumb/9/94/NarutoCoverTankobon1.jpg/220px-NarutoCoverTankobon1.jpg",
    "https://upload.wikimedia.org/wikipedia/id/thumb/9/99/Solo_Leveling_Webtoon.png/330px-Solo_Leveling_Webtoon.png",
  ];

  final List<String> lastReadTitles = [
    "Jejak Cinta",
    "Hide and Seek",
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
    "Novel ini awalnya diterbitkan dalam bentuk novel web di layanan komik dan fiksi digital milik perusahaan Kakao, yaitu KakaoPage pada tanggal 25 Juli 2016. Setelah itu, novel ini diterbitkan dalam bentuk novel ringan dalam media cetak oleh D&C Media di bawah label dagang Papyrus pada tanggal 4 November 2016. Novel ini kemudian dilisensikan dalam bentuk novel web berbahasa Inggris dengan judul Only I Level Up dalam layanan Webnovel dan dalam bentuk novel cetak berbahasa Inggris oleh penerbit Yen On.",
    "Manga ini mengisahkan Yuji yang masuk ke Klub Penelitian Ilmu Gaib, agar bisa bersantai dan bergaul dengan para senior. Sayang, senior-seniornya telah membuka segel dari jimat kutukan tingkat tinggi di sekolahnya, dan menarik roh kutukan muncul. Jimat tersebut menarik Jurei, yaitu makhluk mirip monster yang muncul melalui emosi negatif manusia.",
    "Hide and Seek adalah novel fiksi horor yang mengisahkan sekelompok remaja yang terjebak dalam permainan petak umpet mematikan dengan entitas supranatural yang mengerikan. Dalam upaya untuk bertahan hidup, mereka harus mengungkap misteri kelam di balik permainan tersebut dan mencari cara untuk melarikan diri sebelum semuanya terlambat.",
  ];

  void _navigateToBookDetail(String title, String imageUrl, double rating,
      String author, String synopsis) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WaitingDetailPage(
          bookTitle: title,
          bookImageUrl: imageUrl,
          bookRating: rating,
          bookStock: 10,
          author: author,
          genres: ['Romance', 'Fantasy', 'Horror'],
          synopsisBook: synopsis,
        ),
      ),
    );
  }

  void _navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }

  void _submitReview() {
    if (_userRating > 0 && _commentController.text.isNotEmpty) {
      setState(() {
        _reviews.add({
          'rating': _userRating,
          'comment': _commentController.text,
          'author': 'User',
        });
        _userRating = 0.0;
        _commentController.clear();
      });
    }
  }

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
  }

  void _borrowBook() {
    setState(() {
      _isBookBorrowed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    const int maxLength = 180;

    String truncatedSynopsis = widget.synopsisBook;
    if (widget.synopsisBook.length > maxLength && !_isExpanded) {
      truncatedSynopsis = '${widget.synopsisBook.substring(0, maxLength)}...';
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F3ED),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 130,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(widget.bookImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.bookTitle,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          widget.author,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: widget.bookRating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              ignoreGestures: true,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            SizedBox(width: 10),
                            Text(
                              widget.bookRating.toString(),
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Stock: ${widget.bookStock}',
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 35),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 26),
                              width: 140,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Confirmation"),
                                        content: Text(
                                            "Do you want to cancel borrow?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Cancel"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              _borrowBook();
                                            },
                                            child: Text("Yes"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 198, 53, 53),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  _isBookBorrowed ? 'Canceled' : 'Cancel Borrow',
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       bottom: 10.0), 
                            //   child: Row(
                            //     children: [
                            //       SizedBox(width: 10),
                            //       SizedBox(width: 10),
                            //       Container(
                            //         margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                            //         width: 50,
                            //         height: 40,
                            //         child: ElevatedButton(
                            //           onPressed: _toggleBookmark,
                            //           style: ElevatedButton.styleFrom(
                            //             backgroundColor: Color(0xE8DAAA63),
                            //             padding: EdgeInsets.zero,
                            //             shape: RoundedRectangleBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(20),
                            //             ),
                            //           ),
                            //           child: Center(
                            //             child: Icon(
                            //               _isBookmarked
                            //                   ? Icons.bookmark
                            //                   : Icons.bookmark_outline,
                            //               color: Colors.white,
                            //               size: 24,
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: widget.genres
                  .map((genre) => Chip(
                        label: Text(
                          genre,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            const Text(
              "Synopsis",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    truncatedSynopsis,
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 16,
                    ),
                  ),
                  if (widget.synopsisBook.length > maxLength)
                    Text(
                      _isExpanded ? "View less" : "View more",
                      style: const TextStyle(
                        color: Color(0xffdaaa63),
                        fontFamily: "Montserrat",
                        fontSize: 16,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 15),
            // const Text(
            //   "Recommended Book",
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontFamily: 'Montserrat',
            //     fontSize: 18,
            //   ),
            // ),
            // SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.only(left: 3, right: 3),
            //   child: Container(
            //     height: 240,
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: lastReadImages.length,
            //       itemBuilder: (context, index) {
            //         return GestureDetector(
            //           onTap: () {
            //             _navigateToBookDetail(
            //               lastReadTitles[index],
            //               lastReadImages[index],
            //               lastReadRatings[index],
            //               lastReadAuthors[index],
            //               synopsisBook[index],
            //             );
            //           },
            //           child: Container(
            //             margin: EdgeInsets.symmetric(horizontal: 10),
            //             width: 120,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Container(
            //                   width: 120,
            //                   height: 170,
            //                   decoration: BoxDecoration(
            //                     image: DecorationImage(
            //                       image: NetworkImage(lastReadImages[index]),
            //                       fit: BoxFit.cover,
            //                     ),
            //                     color: Colors.grey[200],
            //                     borderRadius: BorderRadius.circular(15),
            //                     boxShadow: const [
            //                       BoxShadow(
            //                         color: Colors.black26,
            //                         offset: Offset(1, 1),
            //                         blurRadius: 4,
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 const SizedBox(height: 8),
            //                 Text(
            //                   lastReadTitles[index],
            //                   style: const TextStyle(
            //                     fontFamily: "Montserrat",
            //                     fontSize: 15,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            SizedBox(height: 20),
            const Text(
              "Rating and Comments",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBar.builder(
                  initialRating: _userRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _userRating = rating;
                    });
                  },
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _commentController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffDAAA63)),
                      borderRadius: BorderRadius.all(Radius.circular(19)),
                    ),
                    hintText: "Write your comment...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffDAAA63)),
                      borderRadius: BorderRadius.all(Radius.circular(19)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: _submitReview,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffdaaa63),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _reviews.length,
              itemBuilder: (context, index) {
                final review = _reviews[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/gwe.jpg'),
                          // backgroundImage: NetworkImage(
                          //     "https://art.pixilart.com/032d85835762de0.png"),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                review['author'],
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 5),
                              RatingBar.builder(
                                initialRating: review['rating'],
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 20,
                                ignoreGestures: true,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                              SizedBox(height: 5),
                              Text(
                                review['comment'],
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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