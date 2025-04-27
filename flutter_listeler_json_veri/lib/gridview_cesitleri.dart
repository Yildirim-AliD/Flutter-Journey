import 'package:flutter/material.dart';
import 'package:flutter_listeler_json_veri/listview_kullanimi.dart';

class GridviewCesitleri extends StatelessWidget {
  GridviewCesitleri({super.key});

  final List<Ogrenci> ogrenciler = List.generate(
    500,
    (index) {
      return Ogrenci(
          id: (index + 1),
          isim: 'Ogrenci ${index + 1}',
          erkekMi: index % 2 == 0);
    },
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
        childAspectRatio: MediaQuery.of(context).size.width > 600 ? 3 : 1,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.orange[100 * (index % 9)],
          child: Text(ogrenciler[index].toString()),
        );
      },
    );
  }

  GridView gridviewExtendKullanimi() {
    return GridView.extent(
      primary: true,
      maxCrossAxisExtent: 100,
      reverse: false,
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 20,
      crossAxisSpacing: 10,
      scrollDirection: Axis.vertical,
      children: createContainers(20),
    );
  }

  GridView gridviewCountKullanimi() {
    return GridView.count(
      primary: true,
      crossAxisCount: 4,
      reverse: false,
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 20,
      crossAxisSpacing: 10,
      scrollDirection: Axis.horizontal,
      children: createContainers(3),
    );
  }
}

List<Widget> createContainers(int length) {
  return List.generate(
    length,
    (index) {
      var renkShade = 100 * ((index + 1) % 10);
      var sonShade = renkShade == 0 ? 100 : renkShade;
      return Container(
        alignment: Alignment.center,
        color: Colors.purple[sonShade],
        child: Text(
          'Container $sonShade',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      );
    },
  );
}
