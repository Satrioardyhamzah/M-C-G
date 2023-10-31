import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../onboarding/constant/color.dart';
import '../onboarding/constant/size.dart';
import '../onboarding/constant/text_string.dart';

class detailPage extends StatefulWidget {
  
  //final int index;
  //DetaillPage({Key? key, required this.index}) : super(key: key);
  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
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
                        image: AssetImage('assets/images/foto11.png'),
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
                    Text('Profil MAN 14 Jakarta',
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(
                      height: 5,
                    ),
                    /*Container(
                      height: 50,
                      width: width,
                      child: ListView.builder(
                        itemCount: menu[widget.index].rate,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, int key) {
                          return Icon(
                            Icons.star,
                            color: Colors.yellow[900],
                            size: 34,
                          );
                        },
                      ),
                    ),*/
                    SizedBox(
                      height: 10,
                    ),
                    Text("Sejarah",
                        style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        'Pada Tanggal 25 April 1997, Gubernur DKI Jakarta Surjadi Sudirdja Meresmikan Sebuah Bangunan Gedung Pendidikan Permanen Yang Bersumber Dari Hibah Pemda DKI Jakarta Kepada Kantor Wilayah Departemen Agama Provinsi DKI Jakarta. Awalnya Bangunan Tersebut Diperuntukan Bagi Madrasah Ibtidaiyah Negeri (MIN) Pekayon Jakarta Timur, Namun Melihat Antusiasme Warga Sekitar Pada Akhirnya Bangunan Tersebut Diperuntukkan Bagi Madrasah Aliyah Negeri (MAN) Pekayon Jakarta Timur, MAN Pekayon Jakarta Timur Mulai Melaksanakan Aktivitas KBM Pada Tahun 1997 Sebagai Filial MAN 6 Kampung Dukuh Jakarta Timur. ',
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.headline4),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Visi dan Misi",
                        style: Theme.of(context).textTheme.bodyText1),
                    Text(
                        "Terwujudnya Generasi yang Religius, Cerdas, Mandiri, Kompetitif dan Berwawasan Global\n\nIndikator :\n1. Terwujudnya lulusan yang cerdas, kompetititf dan berakhlakul karimah.\n2. Terselenggaranya proses pembelajaran aktif, inovatif, kreatif dan menyenangkan.\n3. Terlaksananya pengembangan kurikulum yang adaptif dan berwawasan iptek\n4. Tersedianya prasarana dan sarana pendidikan yang relevan dan mutakhir mengikuti perkembangan IPtek\n5. Tersedianya SDM pendidikan yang profesional\n6. Terlaksananya manajemen madrasah berbasis madrasah.\n7. Terciptanya lingkungan madrasah yang islami dan kondusif untuk proses pembelajaran\n\nMisi :\n1. Mengembangkan sumber daya madrasah untuk membentuk kepribadian muslim dan rahmatan lilalamin\n2. Mengembangkan proses pembelajaran aktif, kreatif, inovatif dan berkarakter\n3. Menumbuhkembangkan kemampuan berbahasa asing sebagai bekal dalam kehidupan berwawasan global\n4. Meningkatkan sarana dan prasarana yang relevan dan mukhtahir\n5. Mengembangkan SDM profesional dan kompetitif yang berbasis teknologi informasi (IT)\n6. Mengembangkan manajemen berbasis Madrasah (MBM)\n7. Menciptakan lingkungan madrasah yang islami dan kondusif dalam proses pembelajaran",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.headline4),
                    SizedBox(
                      height: 40,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/gedung.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/foto1.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/foto2.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/perpus.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/foto3.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/organisasi.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage('assets/images/lab.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[],
                        ),
                        Expanded(
                            child: OutlinedButton(
                          onPressed: () {
                            launchUrl("https://www.man14jkt.sch.id/");
                          },
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(),
                              backgroundColor: tDarkColor,
                              side: BorderSide(color: tSecondaryColor),
                              padding: EdgeInsets.symmetric(
                                  vertical: tButtonHeight)),
                          child: Text(
                            "Web Official",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  launchUrl("tel:(021) 84306511");
                                },
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(),
                                    backgroundColor: tWhiteColor,
                                    side: BorderSide(color: tSecondaryColor),
                                    padding: EdgeInsets.symmetric(
                                        vertical: tButtonHeight)),
                                child: Text(
                                  "No. Telfon",
                                  style: Theme.of(context).textTheme.bodyText1,
                                )))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[],
                        ),
                        Expanded(
                            child: OutlinedButton(
                          onPressed: () {
                            launchUrl(
                                "https://maps.app.goo.gl/dQaasKmsaNyac1pd8");
                          },
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(),
                              backgroundColor: tDarkColor,
                              side: BorderSide(color: tSecondaryColor),
                              padding: EdgeInsets.symmetric(
                                  vertical: tButtonHeight)),
                          child: Text(
                            "Lokasi Kampus A",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        )),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  launchUrl(
                                      "https://maps.app.goo.gl/WvtgyF9dqf49uTtJA");
                                },
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(),
                                    backgroundColor: tWhiteColor,
                                    side: BorderSide(color: tSecondaryColor),
                                    padding: EdgeInsets.symmetric(
                                        vertical: tButtonHeight)),
                                child: Text(
                                  "Lokasi Kampus B",
                                  style: Theme.of(context).textTheme.bodyText1,
                                )))
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 30,
                top: height * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
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
