class UserResponse {
  String country;
  String displayName;
  String email;
  String href;
  String id;
  List<Image> images;
  String product;
  String type;
  String uri;

  UserResponse({
    required this.country,
    required this.displayName,
    required this.email,
    required this.href,
    required this.id,
    required this.images,
    required this.product,
    required this.type,
    required this.uri,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        country: json["country"],
        displayName: json["display_name"],
        email: json["email"],
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        product: json["product"],
        type: json["type"],
        uri: json["uri"],
      );
}

class Image {
  int height;
  String url;
  int width;

  Image({
    required this.height,
    required this.url,
    required this.width,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );
}
