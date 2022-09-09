class VolumeType {
  late int id;
  late String name;
  late String image;
  int? height;
  int? width;
  int? weight;
  bool? isSelected;

  VolumeType({
    required this.id,
    required this.name,
    required this.image,
    this.height,
    this.width,
    this.weight,
    this.isSelected,
  });

  VolumeType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    height = json['height'];
    width = json['width'];
    weight = json['weight'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['height'] = height;
    data['width'] = width;
    data['weight'] = weight;
    data['isSelected'] = isSelected;
    return data;
  }
}
