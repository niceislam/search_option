

class TshirtModel {
  String? name;
  String? image;
  double? regularPrice;
  double? discountPrice;
  List<String>? sizes;

  TshirtModel(
      {this.name,
        this.image,
        this.regularPrice,
        this.discountPrice,
        this.sizes});

  TshirtModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    regularPrice = json['regular_price'];
    discountPrice = json['discount_price'];
    sizes = json['sizes'].cast<String>();
  }

}
