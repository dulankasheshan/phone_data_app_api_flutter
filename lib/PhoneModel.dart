class PhoneModel {
  final String id;
  final String name;
  late DataModel? dataModel;

  PhoneModel({
    required this.id,
    required this.name,
     this.dataModel,
  });

  factory PhoneModel.fromJson(Map<String, dynamic> json) {
    return PhoneModel(
      id: json['id'],
      name: json['name'],
      dataModel: json['data'] != null ? DataModel.fromJson(json['data']) : null,
    );
  }
}

class DataModel {
  late String? color;
  late String? capacity;
  late String? generation;
  late String? price;

  DataModel({
    this.capacity,
    this.color,
    this.generation,
    this.price,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      capacity: json['capacity'],
      color: json['color'],
      generation: json['Generation'],
      price: json['Price'],
    );
  }
}
