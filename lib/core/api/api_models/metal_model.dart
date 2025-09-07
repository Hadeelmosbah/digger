class MetalModel {
  String? name;
  String? image;
  String? description;
  double? currentPrice;

  MetalModel({this.name, this.image, this.description, this.currentPrice});

  factory MetalModel.fromJson(Map<String, dynamic> json) {
    return MetalModel(
      name: json["name"],
      image: json["image"],
      description: json["description"],
      currentPrice: (json["currentPrice"] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "description": description,
      "currentPrice": currentPrice,
    };
  }
}
