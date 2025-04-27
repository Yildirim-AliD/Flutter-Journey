import 'package:flutter/material.dart';

class TekSatirlikListTile extends StatelessWidget {
  const TekSatirlikListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        ),
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
        ),
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
        ),
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
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.add),
          ),
          trailing: CircleAvatar(child: Icon(Icons.arrow_back)),
          title: Text('Emre Altunbilek'),
          subtitle: Text('Geliştirici'),
        ),
        SizedBox(
          height: 600,
        ),
        Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
          color: Colors.purple,
        ),
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
        ),
      ],
    );
  }
}
