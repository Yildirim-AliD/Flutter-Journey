import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  final url = 'https://icons.iconarchive.com/icons/iconoir-team/iconoir/72/pc-mouse-icon.png';
  
  Widget _buildItem(String value,String label)
  {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(label),
        ],
      ) 
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Profil sayfası"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(url),
                ),
                SizedBox(
                  height: 16
                  ),
                Text("Ali Yıldırım",style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
                  ),

                Text(
                  "Computer Science student",
                  style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 24,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildItem("1.5k", "Followers"),
                        _buildItem("2.5k", " Following"),
                        _buildItem('150', "Posts"),
                        ],
                      ),
                  ),
                  ),
                  SizedBox(height: 8,),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "About Me",
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "I'm a Computer Science student who enjoys learning and growing in different fields.",
                          )
                        ],
                      ), 
                    ),
                  )
            
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}