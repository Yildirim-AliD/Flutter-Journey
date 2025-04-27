import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_listeler_json_veri/models/photo_model.dart';

class DioKullanimi extends StatelessWidget {
  const DioKullanimi({super.key});

  Future<List<Photo>> _getPhotos() async {
    try {
      final dio = Dio();
      var url = 'https://jsonplaceholder.typicode.com/photos';
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Photo> photoList =
            data.map((element) => Photo.fromJson(element)).toList();
        return photoList;
      } else {
        return [];
      }
    } on DioException catch (e) {
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPhotos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var photosList = snapshot.data!;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              var oankiEleman = photosList[index];
              return Image.network(oankiEleman.url);
            },
            itemCount: photosList.length,
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView listviewKullanimi(List<Photo> photosList) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var oankiEleman = photosList[index];
        return ExpansionTile(
          trailing: CircleAvatar(
            child: Image.network(oankiEleman.thumbnailUrl),
          ),
          leading: CircleAvatar(
            child: Text(oankiEleman.albumId.toString()),
          ),
          title: Text(oankiEleman.title),
          children: [
            Image.network(oankiEleman.url),
          ],
        );
      },
      itemCount: photosList.length,
    );
  }
}
