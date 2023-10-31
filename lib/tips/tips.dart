import 'package:firebasechat/tips/menutips.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../onboarding/constant/color.dart';
import '../onboarding/constant/size.dart';
import '../onboarding/constant/text_string.dart';

class tipsPage extends StatefulWidget {
  //final int index;
  //DetaillPage({Key? key, required this.index}) : super(key: key);
  @override
  State<tipsPage> createState() => _tipsPageState();
}

class _tipsPageState extends State<tipsPage> {
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
                height: height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/mental-health.jpg'),
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
                    Text('Tips Menjaga Kesehatan Mental Pada Remaja',
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        "Kesehatan mental merupakan kondisi dimana individu memiliki kesejahteraan yang tampak dari dirinya yang mampu menyadari potensinya sendiri, memiliki kemampuan untuk mengatasi tekanan hidup normal pada berbagai situasi dalam kehidupan, mampu bekerja secara produktif dan menghasilkan, serta mampu memberikan kontribusi kepada komunitasnya.",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.headline4),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 65, bottom: 30),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/mental.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Gejala Gangguan Mental",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "1. Perubahan perilaku\nKetika anak menjadi lebih sering bertengkar, cenderung kasar, hingga berkata kasar yang menyakitkan orang lain padahal sebelumnya tidak, Anda perlu curiga. Tak hanya itu saja, Anda juga mungkin melihat perubahan perilaku anak seperti menjadi lebih mudah marah dan merasa frustasi.\n2. Perubahan mood\nTanda penyakit mental lainnya adalah mood atau suasana hati anak yang berubah secara tiba-tiba. Kondisi ini bisa berlangsung sebentar hingga dalam jangka waktu yang tidak menentu.\n3. Kesulitan berkonsentrasi\nAnak-anak yang menderita gangguan mental cenderung sulit fokus atau memperhatikan dalam waktu yang lama. Selain itu, mereka juga memiliki kesulitan untuk duduk diam dan membaca.\n4. Penurunan berat badan\nberat badan yang menurun drastis juga bisa menjadi tanda penyakit mental anak. Gangguan makan, stres, hingga depresi dapat menjadi penyebab anak kehilangan nafsu makan, mual, dan muntah yang berkelanjutan.\n5. Menyakiti diri sendiri\nPerhatikan saat anak sering mengalami kekhawatiran serta rasa takut berlebih. Perasaan ini dapat berujung pada keinginannya untuk menyakiti diri sendiri. Biasanya, ini menjadi akumulasi dari perasaan stres serta menyalahkan diri sendiri karena gangguan mental juga mengakibatkan anak sulit mengelola emosi.\n6. Muncul berbagai masalah kesehatan\nPenyakit atau gangguan mental juga dapat ditandai dengan masalah pada kesehatannya, misal anak mengalami sakit kepala dan sakit perut yang berkelanjutan.\n7. Perasaan yang intens\nAnak-anak kadang menghadapi perasaan takut yang berlebihan tanpa alasan. Tanda gangguan mental pada anak ini seperti menangis, berteriak atau mual disertai dengan perasaan sangat intens. Perasaan ini pun dapat menyebabkan efek seperti kesulitan bernapas, jantung berdebar atau bernapas dengan cepat, yang dapat mengganggu aktivitas sehari-hari.",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.headline4),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 65, bottom: 30),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/mental2.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Tips Menjaga Kesehatan Mental Remaja",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "1. Katakan Hal Positif pada Diri Sendiri\nPenelitian menunjukkan bahwa cara kamu berpikir tentang diri sendiri dapat memiliki efek yang kuat pada kejiwaan kamu. Ketika kita memandang diri kita dan hidup kita secara negatif, maka kita juga merasakan efek negatifnya. Sebaliknya, jika membiasakan diri menggunakan kata-kata yang membuat lebih positif, maka hal ini membuat kamu lebih optimis.\n2. Tuliskan Hal-Hal yang Patut Disyukuri\nCara sederhana untuk meningkatkan rasa bersyukur adalah membuat jurnal dan menuliskan berbagai hal yang patut disyukuri setiap harinya.\n3. Fokus pada Satu Hal pada Satu Waktu\nFokus kepada tujuan mampu melepaskan emosi negatif dari pengalaman masa lalu yang membebani. Mulailah dengan membawa kesadaran bahkan untuk hal-hal sederhana seperti mandi, makan siang, atau berjalan pulang. \n4. Olahraga\nTubuh akan melepaskan endorfin yang membantu menyingkirkan stres dan meningkatkan suasana hati kamu sebelum dan sesudah berolahraga. Itulah sebabnya olahraga adalah cara penangkal stress, kecemasan, dan depresi yang ampuh\n5. Terbukalah pada Seseorang\nMengetahui bahwa kamu dihargai oleh orang lain adalah penting untuk membantu kamu berpikir lebih positif. Belajar terbuka kepada orang lain, yang membuat kamu lebih mampu berpikir positif dan semakin mengenal diri sendiri.\n6. Tidur Tepat Waktu\nSejumlah besar penelitian menunjukkan bahwa kurang tidur memiliki efek negatif yang signifikan pada suasana hati. Coba tidur pada waktu yang teratur setiap hari. Hindari bermain gadget sebelum waktu tidur dan membatasi minuman berkafein untuk pagi hari.",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.headline4),
                    SizedBox(
                      height: 10,
                    ),
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
