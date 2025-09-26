import 'package:flutter/material.dart';

import '../custom_text/text_widget.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    super.key,
    this.image,
    this.name,
    this.details,
    this.dailyprice,
    this.price,
    this.availableSize,
  });
  final String? image;
  final String? name;
  final String? details;
  final double? dailyprice;
  final double? price;
  final List? availableSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(8, 8),
            blurRadius: 12.00,
          ),
        ],
        color: Colors.blue.shade100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: MediaQuery.sizeOf(context).width,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: FadeInImage(
                placeholder: NetworkImage(
                  "https://i.pinimg.com/originals/8a/c1/29/8ac12962c05648c55ca85771f4a69b2d.gif",
                ),
                fit: BoxFit.fill,
                height: 160,
                width: 160,
                image: NetworkImage("${image}"),
                imageErrorBuilder: (context, i, j) {
                  return Image.network(
                    "https://previews.123rf.com/images/kaymosk/kaymosk1804/kaymosk180400006/100130939-error-404-page-not-found-error-with-glitch-effect-on-screen-vector-illustration-for-your-design.jpg",
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  txt: name ?? "Not Found",
                  fontWeight: FontWeight.bold,
                  fntsize: 20,
                  maxline: 2,
                  textOverflow: TextOverflow.ellipsis,
                ),
                CustomTextWidget(
                  txt: "Details: ${details ?? ""}",
                  textOverflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    CustomTextWidget(txt: "Daily price: "),
                    CustomTextWidget(
                      txt: "${dailyprice ?? ""} \$",
                      textDecoration: TextDecoration.lineThrough,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                CustomTextWidget(
                  txt: "Price: ${price ?? ""} \$",
                  textOverflow: TextOverflow.ellipsis,
                ),
                Divider(color: Colors.black),
                CustomTextWidget(
                  txt: "Available size:",
                  fontWeight: FontWeight.w500,
                  textOverflow: TextOverflow.ellipsis,
                ),
                Container(
                  height: 35,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: CustomTextWidget(
                      txt: "${availableSize ?? ""}",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
