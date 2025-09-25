import 'package:flutter/material.dart';

import '../custom_text/text_widget.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    super.key,
    this.Image,
    this.name,
    this.details,
    this.dailyprice,
    this.price,
    this.availableSize,
  });
  final String? Image;
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
            height: 120,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              image: DecorationImage(image: NetworkImage("$Image")),
              color: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  txt: name ?? "",
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
                      txt: "${dailyprice ?? ""}",
                      textDecoration: TextDecoration.lineThrough,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                CustomTextWidget(
                  txt: "Price: ${price ?? ""}",
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
                    child: CustomTextWidget(txt: "${availableSize ?? ""}"),
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
