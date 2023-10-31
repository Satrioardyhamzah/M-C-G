import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
import '../onboarding/constant/color.dart';
import '../onboarding/constant/size.dart';
import '../onboarding/constant/text_string.dart';

class organisasiPage extends StatefulWidget {
  //final int index;
  //DetaillPage({Key? key, required this.index}) : super(key: key);
  @override
  State<organisasiPage> createState() => _organisasiPageState();
}

class _organisasiPageState extends State<organisasiPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    /*launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        throw (url);
      }
    }*/

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
                        image: AssetImage('assets/images/school.jpg'),
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
                    Text('Daftar Organisasi',
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

                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 30, bottom: 30),
                          child: Container(
                            width: 280,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/osis2.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("OSIS", style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        'Organisasi Siswa Intra Sekolah (disingkat OSIS) adalah suatu organisasi yang berada di tingkat sekolah di Indonesia yang dimulai dari Sekolah Menengah yaitu Sekolah Menengah Pertama (SMP) dan Sekolah Menengah Atas (SMA). OSIS diurus dan dikelola oleh murid-murid yang terpilih untuk menjadi pengurus OSIS. Biasanya organisasi ini memiliki seorang pembimbing dari guru yang dipilih oleh pihak sekolah. Anggota OSIS adalah seluruh siswa yang berada pada satu sekolah tempat OSIS itu berada. Seluruh anggota OSIS berhak untuk memilih calonnya untuk kemudian menjadi pengurus OSIS. \n\nTugas : \n1. Bertanggung jawab atas seluruh pengelolaan, pembinaan, dan pengembangan OSIS di sekolahnya\n2. Memberikan nasihat kepada perwakilan kelas dan pengurus\n3. Mengesahkan keanggotaan perwakilan kelas dengan Surat Keputusan Kepala Sekolah\n4. Mengesahkan dan melantik pengurus OSIS dengan Surat Keputusan Kepala Sekolah\n5. Mengarahkan penyusunan Anggaran Rumah Tangga dan program kerja OSIS\n6.Menghadiri rapat-rapat OSIS\n7. Mengadakan evaluasi terhadap pelaksanaan tugas OSIS\n\nSyarat Pengurus OSIS: \n1. Memiliki budi pekerti yang baik dan sopan santun terhadap orang tua, guru, dan teman\n2. Memiliki bakat sebagai pemimpin\n3. Tidak terlibat penggunaan Narkoba\n4. Memiliki kemauan, kemampuan, dan pengetahuan yang memadai\n5. Dapat mengatur waktu dengan sebaik-baiknya, sehingga pelajarannya tidak terganggu karena menjadi pengurus OSIS\n6. Tidak duduk dikelas terakhir, karena akan menghadapi ujian akhir\n7. Syarat lain disesuaikan dengan ketentuan sekolah.',
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.headline4),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                            left: 75,
                            bottom: 30,
                          ),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/balance.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text("MPK", style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        'MPK adalah suatu organisasi di sekolah yang bertugas mengawasi kinerja OSIS dalam menjalankan tugas-tugasnya selama masa jabatannya berlangsung. Jabatan MPK lebih tinggi daripada OSIS karena MPK-lah satu-satunya organisasi di sekolah yang dapat memantau, mengawasi dan membantu tugas-tugas dari OSIS. MPK adalah kepanjangan dari Majelis Perwakilan Kelas. MPK jabatannya lebih tinggi dari OSIS. Karena yang menentukan kandidat ketua OSIS adalah MPK. MPK bertanggungjawab atas OSIS. JIka ada OSIS yang ada masalah mengenai organisasi maka MPK wajib membantu. Jika ada OSIS yang tidak konsisten dengan pekerjaannya, maka MPK wajib dan berhak untuk mengeluarkannya dari organisasi (OSIS). MPK senantiasa memantau anak buahnya dalam menjalankan kegiatan dan tugasnya. MPK berhak menegur OSIS dan juga harus bertanggungjawab atas kegiatan OSIS.\n\nTugas :\n1. Mengawasi, memantau dan membantu kinerja OSIS dalam melaksanakan program-programnya.\n2.Mengevaluasi kinerja OSIS.\n3. Mengadakan dan menyiapkan rapat Pleno.\n4. Menyiapkan orasi pemilihan ketua MPK.\n5. Menyiapkan orasi pemilihan ketua OSIS.\n6. Menyeleksi calon anggota OSIS dan MPK untuk masa jabatan berikutnya.\n7. Mengadakan PKO-PKM untuk calon ketua OSIS dan MPK.\n8. Memilih calon ketua OSIS dan MPK yang akan melaksanakan orasi.\n9. Tugas tambahan lainnya baik yang terprogram maupun yang incidental.\n\nSyarat Pengurus MPK :\n1. Bertakwa kepada Tuhan Yang Maha Esa.\n2. Terdaftar sebagai siswa di sekolah bersangkutan.\n3. Mampu menampung dan menyalurkan aspirasi kelas.\n4. Dipilih berdasarkan musywarah dan tanpa paksaan atau tekanan dari pihak lain.\n5. Berpasrtisipasi dan dinamis di kelasnya.\n6. Memiliki jiwa pemimpin.\n7.Dapat bersikap netral, tidak mementingkan kepentingan kelompoknya.\n8. Berkelakuan baik.',
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
