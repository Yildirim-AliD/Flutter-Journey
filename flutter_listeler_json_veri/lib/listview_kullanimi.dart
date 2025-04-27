import 'package:flutter/material.dart';
import 'package:flutter_listeler_json_veri/tek_satirlik_widget.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class ListviewKullanimi extends StatelessWidget {
  ListviewKullanimi({super.key});

  final List<Ogrenci> tumOgrenciler = List.generate(
    1000,
    (index) => Ogrenci(
        id: index + 1,
        isim: "Ogrenci adı ${index + 1}",
        erkekMi: index % 2 == 0),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tumOgrenciler.length,
      itemBuilder: (context, index) => GestureDetector(
        onLongPress: () {
          debugPrint("Card widget tıklanıldı ${tumOgrenciler[index].isim}");
        },
        child: Card(
          color: tumOgrenciler[index].erkekMi
              ? Colors.blue.shade300
              : Colors.pink.shade300,
          child: ListTile(
            onTap: () {
              SmartDialog.show(builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                      'Listtile widget tıklanıldı ${tumOgrenciler[index].isim}',
                      style: const TextStyle(color: Colors.white)),
                );
              });
              debugPrint(
                  "Listtile widget tıklanıldı ${tumOgrenciler[index].isim}");
            },
            title: Text(tumOgrenciler[index].isim),
            leading: CircleAvatar(
              child: Text(index.toString()),
            ),
          ),
        ),
      ),
    );
  }

  ListView listviewKullanimi() {
    return ListView(
      children: const [
        TekSatirlikListTile(),
        TekSatirlikListTile(),
        TekSatirlikListTile(),
      ],
    );
  }

  SingleChildScrollView singleChildScroll() {
    return const SingleChildScrollView(
      child: TekSatirlikListTile(),
    );
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final bool erkekMi;

  Ogrenci({required this.id, required this.isim, required this.erkekMi});

  @override
  String toString() {
    return "$isim ";
  }
}
