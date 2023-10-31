import 'package:firebasechat/tips/menutips.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../onboarding/constant/color.dart';
import '../onboarding/constant/size.dart';
import '../onboarding/constant/text_string.dart';

class tips2Page extends StatefulWidget {
  @override
  State<tips2Page> createState() => _tipsPage2State();
}

class _tipsPage2State extends State<tips2Page> {
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
                        image: AssetImage('assets/images/backstudy.jpg'),
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
                              top: 30, left: 65, bottom: 30),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/studyy.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Tips dan Cara Efektif Meningkatkan Minat Belajar",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyText1),
                    Text(
                        "1. Mencari Informasi Tentang Mata Pelajaran\nLangkah pertama yaitu aktif mencari tahu segala sesuatu yang berhubungan dengan mata pelajaran yang akan di dipelajari. Contohnya seperti mencari informasi mengenai bidang kerja yang sesuai dengan bidang keilmuan tersebut, siapa saja tokoh-tokoh terkenal di bidang tersebut dan lain sebagainya.\n2. Mencari Teman Belajar\nBelajar sendiri memang membosankan apalagi jika ada materi yang belum dipahami. Rasa bosan yang datang terus menerus cenderung membuat siswa menjadi malas termasuk dalam urusan belajar. Solusinya adalah mencari teman untuk belajar bersama. Belajar kelompok menjadi sebuah aktivitas yang menyenangkan karena jika ada materi pelajaran yang belum dimengerti bisa bertanya pada teman atau mempelajarinya bersama-sama. \n3. Memaksimalkan Media Pembelajaran\nGunakan internet, smartphone, video, aplikasi dan teknologi lainnya untuk memudahkan proses belajar dan memahami mata pelajaran.\n4. Kenali Masalah yang Dihadapi\nMalas belajar bisa saja disebabkan karena tidak suka dengan pelajaran tertentu, tidak nyaman dengan cara guru mengajar, situasi di dalam kelas, lingkungan sekolah yang kurang menyenangkan, sarana dan fasilitas yang tidak memadai, masalah keluarga dan faktor lainnya.Agar minat belajar bisa kembali tumbuh kenali lebih dulu apa sebenarnya masalah yang sedang dihadap. Kalau perlu sampaikan semua keluhan kepada guru agar bisa dicarikan solusi yang tepat atas permasalahan yang dihadapi.\n5. Sesuaikan dengan Kemampuan\nJangan terlalu memaksakan diri lakukan saja sesuai dengan kemampuan yang dimiliki. Hasil belajar tidak ditentukan oleh berapa durasi setiap harinya melainkan pada kualitas serta efektivitasnya.",
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
                    color: Color.fromARGB(255, 255, 255, 255),
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
