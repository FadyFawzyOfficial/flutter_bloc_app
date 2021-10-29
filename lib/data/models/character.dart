class Character {
  late int id;
  late String name;
  late String nickname;
  late String realName;
  late DateTime birthday;
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
    occupations = json['occupation'];
    seasonsApperance = json['appearance'];
    betterCallSaulApperance = json['better_call_saul_appearance'];
  }
}
