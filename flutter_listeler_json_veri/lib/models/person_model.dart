// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
    int id;
    String isim;
    bool erkekMi;
    List<String> sevdigiRenkler;
    List<Adres> adres;

    Person({
        required this.id,
        required this.isim,
        required this.erkekMi,
        required this.sevdigiRenkler,
        required this.adres,
    });

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        isim: json["isim"],
        erkekMi: json["erkekMi"],
        sevdigiRenkler: List<String>.from(json["sevdigiRenkler"].map((x) => x)),
        adres: List<Adres>.from(json["adres"].map((x) => Adres.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "isim": isim,
        "erkekMi": erkekMi,
        "sevdigiRenkler": List<dynamic>.from(sevdigiRenkler.map((x) => x)),
        "adres": List<dynamic>.from(adres.map((x) => x.toJson())),
    };
}

class Adres {
    String il;
    String ilce;
    String tur;

    @override
  String toString() {
    
    return "İl: $il İlçe : $ilce";
  }

    Adres({
        required this.il,
        required this.ilce,
        required this.tur,
    });

    factory Adres.fromJson(Map<String, dynamic> json) => Adres(
        il: json["il"],
        ilce: json["ilce"],
        tur: json["tur"],
    );

    Map<String, dynamic> toJson() => {
        "il": il,
        "ilce": ilce,
        "tur": tur,
    };
}
