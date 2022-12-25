class Campaign {
  final String id, title, image;
  final int numOfProducts;

  Campaign({required this.id, required this.title, required this.image, required this.numOfProducts});

  // It creates an Category from JSON
  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      numOfProducts: json["numOfProducts"],
    );
  }
}

// Our demo category
Campaign campaign = Campaign(
  id: "1",
  title: "Armchair",
  image: "https://i.imgur.com/JqKDdxj.png",
  numOfProducts: 100,
);
