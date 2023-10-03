class ItemModel {
  late int id;
  late String name;
  late String description;
  late double price;
  late String address;
  late String phone;
  late int categoryId;
  late int subCategoryId;
  late List<String>? images;

  ItemModel({
    required this.address,
    required this.categoryId,
    required this.description,
    required this.id,
    required this.images,
    required this.name,
    required this.phone,
    required this.price,
    required this.subCategoryId,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    List<String> imas = [];
    for (var element in json["images"]) {
      imas.add(element["name"]);
    }
    return ItemModel(
      address: json["address"],
      categoryId: json["category_id"],
      description: json["description"],
      id: json["id"],
      images: imas,
      name: json["name_user"],
      phone: json["number_user"],
      price: double.parse(json["price"].toString()),
      subCategoryId: json["sub_category_id"],
    );
  }
}
