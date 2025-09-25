import 'package:flutter/material.dart';

import '../all_widget/custom_text/text_widget.dart';
import '../all_widget/item_design/container_design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.57,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ItemContainer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
