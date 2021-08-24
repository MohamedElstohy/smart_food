import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_food/models/category.dart';
import 'package:smart_food/models/restaurant.dart';
import 'package:smart_food/utilities/strings.dart';


class GetCategories with ChangeNotifier{
  List<Category> categories = [
    Category(id: 0, name: 'الجميع'),
  ];
  List<List<Restaurant>> restaurants = [[null],];

  bool isCatsLoading = true;
  bool isRestsLoading = true;
  
  bool get isDataFetched{
    notifyListeners();
    return restaurants.length <= 1 ? true : false;
  }
  // List<List<Restaurant>> get getRestaurants{
  //   notifyListeners();
  //   return restaurants;
  // }
  List<List<Restaurant>> get getAllRestaurants{
    return [...restaurants];
  }

  int get getCategoriesLength {
    notifyListeners();
    return categories.length ;
  }

  List<Category> get getCategories{
    notifyListeners();
    return [...categories];
  }


  Future<void> getCats() async {
    final response = await Dio().post(
      CATEGORIES_URL
    );

    if(response.statusCode == 200){
      final body = response.data['return'];
      for(int i = 1; i < body.length; i++){
        categories.add(Category.fromJson(body[i-1]));
      }

      print('Success');

      isCatsLoading = false;
      notifyListeners();
    } 
    
  }
  
  Future<List<Restaurant>> getRestaurantsForSelectedCategory(int catId) async{
    List<Restaurant> catRestaurants;

    final response = await Dio().post(
      'http://otlob.accuragroup-eg.net/api/getResturants?langu=ar&catId=$catId',
    );

    if(response.statusCode == 200){
      final body = response.data['return'];
      for(int i = 1; i < body.length; i++){
        catRestaurants.add(Restaurant.fromJson(body[i-1]));
      }

      return catRestaurants;   
    } else{
      throw Exception();
    }
  }

  Future<void> getRestaurantsForAll() async{
    List<Restaurant> carry;
    List<Restaurant> allRests;
    for(int i = 1 ; i < categories.length ; i++){
      carry = await getRestaurantsForSelectedCategory(i);
      restaurants.add(carry);
      for(int j = 0 ; j < carry.length ; j++){
        allRests.add(carry[j]);
      }
    }
    restaurants[0] = allRests;

    isRestsLoading = false;
    notifyListeners();
  }

}