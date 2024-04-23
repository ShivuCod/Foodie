class Item {
  String? collectionId;
  String? collectionName;
  DateTime? created;
  String? description;
  String? id;
  String? img;
  String? location;
  String? name;
  String? price;
  int? qty;
  DateTime? updated;

  Item({
    this.collectionId,
    this.collectionName,
    this.created,
    this.description,
    this.id,
    this.img,
    this.location,
    this.name,
    this.price,
    this.qty,
    this.updated,
  });

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    collectionId: json["collectionId"],
    collectionName: json["collectionName"],
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
    description: json["description"],
    id: json["id"],
    img: json["img"],
    location: json["location"],
    name: json["name"],
    price: json["price"],
    qty: json["qty"],
    updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
  );

  Map<String, dynamic> toMap() => {
    "collectionId": collectionId,
    "collectionName": collectionName,
    "created": created?.toIso8601String(),
    "description": description,
    "id": id,
    "img": img,
    "location": location,
    "name": name,
    "price": price,
    "qty": qty,
    "updated": updated?.toIso8601String(),
  };
}
