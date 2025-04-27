import 'package:flutter/material.dart';

class CardListTileKullanimi extends StatefulWidget {
  const CardListTileKullanimi({super.key});

  @override
  State<CardListTileKullanimi> createState() => _CardListTileKullanimiState();
}

class _CardListTileKullanimiState extends State<CardListTileKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.green.shade100,
        shadowColor: Colors.orange,
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(child: tekSatir()),
          ],
        ),
      ),
    );
  }

  Column tekSatir() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.add),
          ),
          trailing: CircleAvatar(child: Icon(Icons.arrow_back)),
          title: Text('Emre Altunbilek'),
          subtitle: Text('Geliştirici'),
        ),
        Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
          color: Colors.purple,
        )
      ],
    );
  }
}
