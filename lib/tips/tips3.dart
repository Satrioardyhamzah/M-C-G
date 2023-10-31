import 'package:firebasechat/tips/menutips.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../onboarding/constant/color.dart';
import '../onboarding/constant/size.dart';
import '../onboarding/constant/text_string.dart';

class tips3Page extends StatefulWidget {
  //final int index;
  //DetaillPage({Key? key, required this.index}) : super(key: key);
  @override
  State<tips3Page> createState() => _tipsPage3State();
}

class _tipsPage3State extends State<tips3Page> {
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
                        image: AssetImage('assets/images/backstudy3.png'),
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
                              top: 10, left: 65, bottom: 10),
                          child: Container(
                            width: 200,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/backstudy2.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Tips Menjadi Siswa Berprestasi Di Sekolah",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyText1),
                    Text(
                        "Menjadi siswa siswi yang berprestasi adalah sebuah mimpi dan tujuan bagi semua orang. Namun, dalam prakteknya, hal ini tidak mudah diwujudkan begitu saja. Tolak ukur siswa berprestasi biasanya dilihat dari hasil belajar siswa yang memuaskan, misalnya dengan mendapatkan nilai bagus atau meraih rangking di sekolah. Selanjutnya tolak ukur lainnya adalah dengan berprestasi di bidang tertentu, seperti olahraga atau seni. \n\nBeberapa tips ini bisa anda terapkan:\n1. Mampu belajar secara efektif \n2. Aktif dalam belajar\n3.Rajin mengerjakan tugas PR Memiliki motivasi yang tinggi \n4.Mampu mengatur waktu dengan baik \n5.Memiliki sikap dan perilaku yang baik \n6.Memiliki tekad berprestasi \n7. Taat beribadah",
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
