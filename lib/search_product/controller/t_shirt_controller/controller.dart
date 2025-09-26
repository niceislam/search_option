import 'package:flutter/material.dart';
import 'package:search_project/search_product/database/t_shirt_database/database.dart';
import 'package:search_project/search_product/model/t_shirt_model/model.dart';

class SController {
  Future<List<TshirtModel>> TshirtCon() async {
    await Future.delayed(Duration(seconds: 3));
    List<TshirtModel> FromModelData = [];
    for (var i in shirtDatbase().shirt) {
      FromModelData.add(TshirtModel.fromJson(i));
    }
    return FromModelData;
  }
}
