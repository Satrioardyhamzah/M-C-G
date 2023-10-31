import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../onboarding/constant/color.dart';
import '../onboarding/constant/size.dart';
import '../onboarding/constant/text_string.dart';

class ekstrakurikulerPage extends StatefulWidget {
  //final int index;
  //DetaillPage({Key? key, required this.index}) : super(key: key);
  @override
  State<ekstrakurikulerPage> createState() => _ekstrakurikulerPageState();
}

class _ekstrakurikulerPageState extends State<ekstrakurikulerPage> {
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
                        image: AssetImage('assets/images/astro.png'),
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
                    Text('Ekstrakurikuler',
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                            left: 22,
                            bottom: 30,
                          ),
                          child: Container(
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/foto11.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                        "Jadwal Kegiatan Ekstrakurikuler MAN 14 JAKARTA KAMPUS A (PEKAYON)",
                        style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'No. ',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Ekskul',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Hari&Waktu',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Tempat',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('1.')),
                              DataCell(Text('Paduan Suara')),
                              DataCell(Text('Senin dan Kamis, 15.30 - 17.00')),
                              DataCell(Text('Ruang Kelas')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('2.')),
                              DataCell(Text('Seni Tari')),
                              DataCell(Text('Kamis, 15.30 - 17.00')),
                              DataCell(Text('Slasar Masjid')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('3.')),
                              DataCell(Text('Teater')),
                              DataCell(Text('Senin, 15.30 - 17.00')),
                              DataCell(Text('Lapangan atau Aula')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('4.')),
                              DataCell(Text('Drumband')),
                              DataCell(Text('Selasa dan Kamis, 15.30 - 17.00')),
                              DataCell(Text('Lapangan atau Ruang Kelas')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('5.')),
                              DataCell(Text('Band Islami')),
                              DataCell(Text('Jumat, 15.30 - 17.00')),
                              DataCell(Text('Aula')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('6.')),
                              DataCell(Text('Hadroh')),
                              DataCell(Text('Selasa, 15.30 - 17.00')),
                              DataCell(Text('Masjid')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('7.')),
                              DataCell(Text('Islamic Study Club')),
                              DataCell(Text('Selasa dan Kamis, 16.00 - 17.00')),
                              DataCell(Text('Ruang Kelas')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('8.')),
                              DataCell(Text('Qiraatul Quran')),
                              DataCell(Text('Jumat, 15.30 - 17.00')),
                              DataCell(Text('Masjid')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('9.')),
                              DataCell(Text('Futsal')),
                              DataCell(Text('Selasa dan Kamis, 15.30 - 17.00')),
                              DataCell(Text('Lapangan')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('10.')),
                              DataCell(Text('Bola Volley')),
                              DataCell(Text('Jumat, 15.30 - 17.00')),
                              DataCell(Text('Lapangan')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('11.')),
                              DataCell(Text('Bulu Tangkis')),
                              DataCell(Text('Sabtu, 10.00 - 12.00')),
                              DataCell(Text('Lapangan Bantong')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('12.')),
                              DataCell(Text('Pecinta Alam')),
                              DataCell(Text('Kamis, 15.30 - 17.00')),
                              DataCell(Text('Lapangan')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('13.')),
                              DataCell(Text('Bola Basket')),
                              DataCell(Text('Senin, 15.30 - 17.00')),
                              DataCell(Text('Lapangan')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('14.')),
                              DataCell(Text('Robotik')),
                              DataCell(Text('Kamis dan Jumat, 16.00 - 17.00')),
                              DataCell(Text('Smart Class')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('15.')),
                              DataCell(Text('English Club')),
                              DataCell(Text('Sabtu, 08.00 - 09.30')),
                              DataCell(Text('Ruang Kelas')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('16.')),
                              DataCell(Text('Jurnalistik')),
                              DataCell(Text('Jumat, 15.30 - 17.00')),
                              DataCell(Text('Ruang Kelas')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('17.')),
                              DataCell(Text('Kajian Ilmiah Remaja')),
                              DataCell(Text('Jumat, 16.00 - 17.30')),
                              DataCell(Text('Ruang Kelas')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('18.')),
                              DataCell(Text('PASKIBRA')),
                              DataCell(Text(
                                  'Senin, 15.30 - 17.00, Sabtu 09.00 - 12.00')),
                              DataCell(Text('Lapangan')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('19.')),
                              DataCell(Text('PRAMUKA')),
                              DataCell(Text('Rabu, 15.30 - 17.00')),
                              DataCell(Text('Lapangan atau Aula')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('20.')),
                              DataCell(Text('PMR')),
                              DataCell(Text('Kamis, 15.30 - 17.00')),
                              DataCell(Text('Lapangan atau Ruang Kelas')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('21.')),
                              DataCell(Text('Pencak Silat')),
                              DataCell(Text('Senin, 15.30 - 17.00')),
                              DataCell(Text('Lapangan')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('22.')),
                              DataCell(Text('Karate')),
                              DataCell(Text('Senin dan Kamis, 15.30 - 17.00')),
                              DataCell(Text('Lapangan')),
                            ],
                          ),
                        ],
                      ),
                    ),
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
                                  image: AssetImage('assets/images/foto2.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Jadwal Kegiatan Ekstrakurikuler MAN 14 JAKARTA KAMPUS B (PONDOK RANGON)",
                        style: Theme.of(context).textTheme.bodyLarge),
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
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'No. ',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Ekskul',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Hari&Waktu',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Tempat',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('1.')),
                              DataCell(Text('Seni Tari')),
                              DataCell(Text('Selasa, 16.00 - 17.00')),
                              DataCell(Text('Teras')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('2.')),
                              DataCell(Text('Hadroh')),
                              DataCell(Text('Kamis, 16.00 - 17.00')),
                              DataCell(Text('Masjid')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('3.')),
                              DataCell(Text('Islamic Study Club')),
                              DataCell(Text('Selasa, 16.00 - 17.00')),
                              DataCell(Text('Masjid')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('4.')),
                              DataCell(Text('Futsal')),
                              DataCell(Text('Selasa, 16.00 - 17.00')),
                              DataCell(Text('Lapangan')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('5.')),
                              DataCell(Text('Bulu Tangkis')),
                              DataCell(Text('Sabtu, 15.00 - 17.00')),
                              DataCell(Text('GOR PKP')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('6.')),
                              DataCell(Text('Pecinta Alam')),
                              DataCell(Text('Kamis, 08.00 - 10.00')),
                              DataCell(Text('Lapangan atau Ruang Kelas')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('7.')),
                              DataCell(Text('Bola Basket')),
                              DataCell(Text('Sabtu, 07.00 - 09.00')),
                              DataCell(Text('Lapangan')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('8.')),
                              DataCell(Text('Robotik')),
                              DataCell(Text('Rabu, 16.00 - 17.00')),
                              DataCell(Text('Lab TIK')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('9.')),
                              DataCell(Text('Science Club')),
                              DataCell(Text('Kamis, 16.00 - 17.30')),
                              DataCell(Text('Lab IPA')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('10.')),
                              DataCell(Text('English Club')),
                              DataCell(Text('Senin, 16.00 - 17.30')),
                              DataCell(Text('Hall Gedung baru')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('11.')),
                              DataCell(Text('Kajian Ilmiah Remaja')),
                              DataCell(Text('Selasa, 16.00 - 17.30')),
                              DataCell(Text('Lab IPA')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('12.')),
                              DataCell(Text('Jurnalistik')),
                              DataCell(Text('Kamis, 16.00 - 17.30')),
                              DataCell(Text('Hall Gedung baru')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('13.')),
                              DataCell(Text('PASKIBRA')),
                              DataCell(Text('Kamis, 16.00 - 17.00')),
                              DataCell(Text('Lapangan')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('14.')),
                              DataCell(Text('PRAMUKA')),
                              DataCell(Text('Rabu, 16.00 - 17.00')),
                              DataCell(Text('Lapangan')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('15.')),
                              DataCell(Text('PMR')),
                              DataCell(Text('Jumat, 16.00 - 17.00')),
                              DataCell(Text('Lapangan atau Ruang Kelas')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('16.')),
                              DataCell(Text('Pencak Silat')),
                              DataCell(Text('Jumat, 15.30 - 17.00')),
                              DataCell(Text('Lapangan')),
                            ],
                          ),
                        ],
                      ),
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
