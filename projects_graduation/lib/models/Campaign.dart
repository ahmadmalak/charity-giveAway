class Campaigns {
  final int price;
  final String id, title, category, image, subTitle, description;

  Campaigns({
    required this.id,
    required this.price,
    required this.title,
    required this.category,
    required this.image,
    required this.subTitle,
    required this.description,
  });

  // It create an Category from JSON
  factory Campaigns.fromJson(Map<String, dynamic> json) {
    return Campaigns(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      price: json["price"],
      category: json["category"],
      subTitle: json["subTitle"],
      description: json["description"],
    );
  }
}

// Our Demo Product
Campaigns campaigns = Campaigns(
  id: "1",
  price: 1600,
  title: "Wood Frame",
  image:
      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.humanium.org%2Fen%2Fdonation%2F&psig=AOvVaw0M68Z791MHwdLfg3fCFHh8&ust=1669278025099000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCIiNxa_vw_sCFQAAAAAdAAAAABAJ",
  category: "Chair",
  subTitle: "Tieton Armchair",
  description: description,
);

String description =
    "This armchair is an elegant and functional piece of furniture. It is suitable for family visits and parties with friends and perfect for relaxing in front of the TV after hard work.";
