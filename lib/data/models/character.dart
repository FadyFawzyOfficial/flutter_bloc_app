class Character {
  late int id;
  late String name;
  late String nickname;
  late String realName;
  late String birthday;
  late String imageUrl;
  late String status;
  late String series;
  late List<String> occupations;
  late List<int> seasonsApperance;
  late List<int> betterCallSaulApperance;

  Character.fromJson(Map<String, dynamic> json) {
    id = json['char_id'];
    name = json['name'];
    nickname = json['nickname'];
    realName = json['portrayed'];
    birthday = json['birthday'];
    imageUrl = json['img'];
    status = json['status'];
    series = json['category'];
    occupations = List<String>.from(json['occupation'].map((x) => x));
    seasonsApperance = List<int>.from(json['appearance'].map((x) => x));
    betterCallSaulApperance =
        List<int>.from(json['better_call_saul_appearance'].map((x) => x));
  }
}
