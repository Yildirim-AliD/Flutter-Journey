import 'package:flutter/material.dart';

class VeriAktarimiDemo extends StatelessWidget {
  const VeriAktarimiDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Veri aktarımı")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                final ogrAli = Ogrenci(isim: "Ali", yas: 22, sehir: "İzmir");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OgrenciDetay(ogrenci: ogrAli),
                  ),
                );
              },
              child: const Text("Detay sayfasına git"),
            ),
          ],
        ),
      ),
    );
  }
}

class Ogrenci {
  final String isim;
  final int yas;
  final String sehir;

  Ogrenci({required this.isim, required this.yas, required this.sehir});
}

class OgrenciDetay extends StatelessWidget {
  final Ogrenci ogrenci;
  const OgrenciDetay({super.key, required this.ogrenci});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ogrenci Info")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(ogrenci.isim),
            Text(ogrenci.yas.toString()),
            Text(ogrenci.sehir),
          ],
        ),
      ),
    );
  }
}
