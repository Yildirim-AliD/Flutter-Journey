
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const TestApp());
}


class  TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {

    var container = Container(
          color: Colors.blueGrey,
          height: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              myContainer(),
              myContainer(),
            ],
          ),
        );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Test App"),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Flexible(
              fit: FlexFit.tight,
            // We make it behave like Expanded with this.
            // The difference with Flexible is that it can grow only up to the value given below.
              child: Container(
                color:Colors.black,
                width: 50,
                height: 300,
              ),
            ),
            Flexible(
              child: Container(
                color:Colors.yellow,
                height: 300,
                width: 300,
              ),
            )

          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          debugPrint("Press button");
        },
          backgroundColor: Colors.red,
          child: Icon(Icons.add_a_photo_outlined),
        ),
      )
    );
  }

  List<Widget> get ExpandedMethod {
    return <Widget> [
          Expanded(
            flex: 1,
            child: Container(
              height: 150,
              color: Colors.pink,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.grey,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.black,
            ),
          )
        ];
  }

  Container myContainer() {
    return Container(  
        color : Colors.amber,
        height: 150,
        width: 150,
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        child:Container(
          width: 100,
          alignment: Alignment.center,
          height: 100,
          color: Colors.blue,
          child: const Text("Hello Flutter"),
        )
      );
  }

}

class myMainColumn extends StatelessWidget {
  const myMainColumn({
    super.key,
    required this.container,
  });

  final Container container;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        container,container
      ],
    );
  }
}