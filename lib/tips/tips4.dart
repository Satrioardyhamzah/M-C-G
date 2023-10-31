import 'package:firebasechat/tips/menutips.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../onboarding/constant/color.dart';
import '../onboarding/constant/size.dart';
import '../onboarding/constant/text_string.dart';

class tips4Page extends StatefulWidget {
  //final int index;
  //DetaillPage({Key? key, required this.index}) : super(key: key);
  @override
  State<tips4Page> createState() => _tipsPage4State();
}

class _tipsPage4State extends State<tips4Page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        throw (url);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: <Widget>[
              Container(
                height: height * 0.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/backstudy5.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.5),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 100, bottom: 10),
                          child: Container(
                            width: 220,
                            height: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/backstudy4.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Tips Menjadi Siswa yang Aktif di Sekolah",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyText1),
                    Text(
                        "Istilah dari siswa yang aktif memiliki makna yang harus kita luruskan. Aktif disini aktif yang tidak sekedar aktif, aktif yang hanya asal bunyi atau istilah kerennya tong kosong nyaring bunyinya, aktif yang hanya mencari perhatian atau hal hal yang sering dilakukan oleh orang orang yang kurang perhatian dari orang sekitar. Tapi lebih aktif secara akademis dan berprestasi  Dan untuk menjadi siswa yang menonjol di sekolah, berikut adalah beberapa langkah yang dapat Anda ikuti seperti : \n\n1. Kenali lingkungan sekolah \nLuangkan waktu untuk mengenal lingkungan sekolah baru Anda. Ketahui aturan, kebijakan, dan nilai-nilai yang diterapkan di sekolah tersebut. Pahami juga struktur organisasi sekolah, termasuk guru, staf, dan siswa lainnya. \n2. Jalin hubungan dengan teman sekelas \nCobalah untuk berinteraksi dengan teman sekelas dan siswa lainnya. Jalin persahabatan dengan mereka dan tunjukkan sikap ramah dan sopan. Ajak mereka berbincang dan ikut serta dalam kegiatan sekolah.\n3.Berpartisipasi dalam kegiatan ekstrakurikuler \nAmbil bagian dalam kegiatan ekstrakurikuler yang diminati. Ini akan membantu Anda bertemu dengan siswa lain yang memiliki minat yang sama dan memperluas jaringan sosial Anda. Selain itu, berpartisipasi dalam kegiatan ekstrakurikuler juga akan membantu Anda mengembangkan keterampilan tambahan dan menunjukkan dedikasi Anda terhadap kegiatan di sekolah. \n4.Fokus pada pembelajaran \nBerusahalah untuk menjadi siswa yang rajin dan berprestasi. Berpartisipasilah dengan aktif dalam kelas, bertanya kepada guru jika ada yang tidak dipahami, dan lakukan tugas dengan tepat waktu. Jika Anda menunjukkan komitmen dan keunggulan dalam akademik, itu akan membantu Anda untuk diakui oleh guru dan menjadi siswa yang menonjol. \n5.Bantu teman sekelas \nTawarkan bantuan kepada teman sekelas jika mereka mengalami kesulitan dalam belajar. Anda bisa membentuk kelompok belajar bersama atau menjelaskan konsep-konsep yang sulit bagi mereka. Memberikan dukungan kepada teman sekelas akan membantu Anda membangun reputasi sebagai siswa yang peduli dan berbagi pengetahuan.\n6. Hormati guru dan staf sekolah \nBerperilakulah dengan sopan dan hormat terhadap guru dan staf sekolah. Tunjukkan rasa terima kasih atas bantuan mereka dan ikuti petunjuk mereka dengan baik. Sikap hormat terhadap guru dan staf sekolah akan memperlihatkan integritas dan sikap yang baik kepada mereka.\n7. Tetapkan tujuan dan berusaha keras \nTetapkan tujuan akademik dan non-akademik yang ingin Anda capai di sekolah baru. Berusaha keras untuk mencapai tujuan-tujuan tersebut dengan belajar dengan tekun, mengembangkan keterampilan, dan mengambil peluang yang ada di sekolah.",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.headline4),
                  ],
                ),
              ),
              Positioned(
                left: 30,
                top: height * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MenuTips())); //Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: 35,
                    color: Color.fromARGB(255, 0, 0, 0),
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
