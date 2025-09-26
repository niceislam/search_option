import 'package:flutter/material.dart';
import 'package:search_project/search_product/model/t_shirt_model/model.dart';

import '../../controller/t_shirt_controller/controller.dart';
import '../all_widget/custom_text/text_widget.dart';
import '../all_widget/item_design/container_design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TshirtModel> finalData = [];
  List<TshirtModel> searchData = []; // akhane age asbe
  bool isLoading = true;

  getDAta() async {
    isLoading = false;
    searchData = await SController().TshirtCon();
    finalData = searchData;
    isLoading = true;
    setState(() {});
  }

  searchFun({required String searchText}) {
    finalData = searchData
        .where((v) => v.name!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    getDAta();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: CustomTextWidget(
          txt: "Search Item",
          txtclr: Colors.white,
          fntsize: 25,
          fontWeight: FontWeight.bold,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                TextField(
                  onChanged: (v) {
                    if (v != "") {
                      searchFun(searchText: v);
                    } else {
                      finalData = searchData;
                    }
                    setState(() {});
                  },
                  cursorColor: Colors.blue,
                  cursorHeight: 23,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search, color: Colors.blue),
                    hintText: "Search here..",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: isLoading == false
                  ? Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.5,
                      ),
                      itemCount: finalData.length,
                      itemBuilder: (context, index) {
                        final item = finalData[index];
                        return ItemContainer(
                          image: item.image,
                          name: item.name,
                          dailyprice: double.parse("${item.regularPrice}"),
                          price: double.parse("${item.discountPrice}"),
                          availableSize: item.sizes,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
