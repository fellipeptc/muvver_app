class Transport {
  late int id;
  late String name;
  late String image;
  late bool isSelected;

  Transport({
    required this.id,
    required this.name,
    required this.image,
    this.isSelected = false,
  });

  Transport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['isSelected'] = isSelected;
    return data;
  }

  @override
  String toString() {
    return "$name: <$image>";
  }
}
