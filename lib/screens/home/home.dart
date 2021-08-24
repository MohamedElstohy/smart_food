import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_food/models/category.dart';
import 'package:smart_food/models/restaurant.dart';
import 'package:smart_food/provider/get_categories.dart';

import '../../helper.dart';
import 'filter_button.dart';
import 'restaurant_card.dart';

List<bool> selection = [true , false , false , false , false];


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  List<List<Restaurant>> allFilters = [];
  int _selectedIndex = 0;

  void chooseCategory({int index}){
    if(selection[index] == false){
      setState(() {
        selection[index] = true;
      });
      for(int i = 0 ; i < index ; i++){
        setState(() {
          selection[i] = false;
        });
      }
      for(int i = index +1 ; i < selection.length ; i++){
        setState(() {
          selection[i] = false;
        });
      }
    } else{
      setState(() {
        selection[index] = false;
      });
    }
  }

  void getInitials() async { 
    final provider = Provider.of<GetCategories>(context, listen: true);
    provider.getCats();
    provider.getRestaurantsForAll();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetCategories>(context, listen: true);
    provider.getCats();
    provider.getRestaurantsForAll();

    return Builder(
       builder: (_) {
            if((provider.isCatsLoading && provider.isRestsLoading) == true)
              Center(child: CircularProgressIndicator());
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Color(0xFFFFFFFF),
            
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appBar(context),

                    SizedBox(
                      height: 25,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        '''مرحبا
عن ماذا تبحث؟''',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF46200B)
                        ),
                      ),
                    ),

                    SizedBox(height: 25),


                    Container(
                      height: 45,
                      width: Helper.getDeviceWidth(context),
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15,),
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.getCategories.length,        
                        itemBuilder: (context , index) {
                            return Row(
                              children: [  
                                FilterButton(
                                    title: provider.getCategories[index].name,//newCats[index].name
                                    isSelected: selection[index],
                                    onPressed: () => chooseCategory(index: index)
                                ),

                                SizedBox(width: 10),
                              ],
                            );  
                        },    
                        
                      ),
                    ),
                    // filters(context , provider),

                    SizedBox(height: 20),

                    Container(
                      width: Helper.getDeviceWidth(context),
                      height: Helper.getDeviceHeight(context),
                      padding: EdgeInsets.symmetric(horizontal: 15, ),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: provider.getAllRestaurants[_selectedIndex].length,
                        itemBuilder:  (context , index) =>
                          Column(
                            children: [
                              RestaurantCard(
                                title: provider.getAllRestaurants[_selectedIndex][index].restName,
                                imageUrl: provider.getAllRestaurants[_selectedIndex][index].restImg,
                                largeImageUrl: 'assets/images/NoPath - Copy@2x.png',
                                description: 'شاورما, سندوتشات, وجبات سريعة',
                              ),

                              Divider(),
                            ],
                          ),
                        
                        // children: [
                        //   RestaurantCard(
                        //     title: 'أهل الشام',
                        //     imageUrl: 'assets/images/NoPath - Copy.png',
                        //     largeImageUrl: 'assets/images/NoPath - Copy@2x.png',
                        //     description: 'شاورما, سندوتشات, وجبات سريعة',
                        //   ),

                        //   Divider(),

                        //   RestaurantCard(
                        //     title: 'Wild Burger',
                        //     imageUrl: 'assets/images/NoPath - Copy-1.png',
                        //     largeImageUrl: 'assets/images/NoPath - Copy-1@2x.png',
                        //     description: 'برجر, سندوتشات, وجبات سريعة',
                        //   ),

                        //   Divider(),

                        //   RestaurantCard(
                        //     title: 'Pizza Hut',
                        //     imageUrl: 'assets/images/NoPath - Copy (3).png',
                        //     largeImageUrl: 'assets/images/NoPath - Copy (3)@2x.png',
                        //     description: 'بيتزا, سندوتشات, وجبات سريعة',
                        //   ),

                        //   Divider(),

                        //   RestaurantCard(
                        //     title: 'Nola',
                        //     imageUrl: 'assets/images/NoPath - Copy (4).png',
                        //     largeImageUrl: 'assets/images/NoPath - Copy (4)@2x.png',
                        //     description: 'حلويات',
                        //   ),

                        //   Divider(),
                        // ],
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget appBar(BuildContext context){
    return Container(
      height: (Helper.getDeviceHeight(context) / 10 ) + 10,
      width: Helper.getDeviceWidth(context),
      padding: EdgeInsets.only(
        right: 15,
        left: 15,
        top: 10,
        bottom: 1
      ),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Color(0xFFFFC501),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(17.5),
          bottomRight: Radius.circular(17.5),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Image.asset(
              'assets/images/Icon metro-menu.png',
              fit: BoxFit.cover,
              width: 17,
              height: 17,
            ),
            onPressed: (){}
          ),

          Text(
            'الرئيسية',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tajawal',
              color: Color(0xFF46200B)
            ),
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/Icon ionic-ios-search.png',
              fit: BoxFit.cover,
              width: 17,
              height: 17,
            ),
            onPressed: (){}
          ),
        ],
      ),
    );
  }
  
  // Widget filters(BuildContext context ,  Provider<GetCategories> provider){
  //   return Container(
  //     height: 45,
  //     width: Helper.getDeviceWidth(context),
  //     child: ListView.builder(
  //       padding: EdgeInsets.symmetric(horizontal: 15,),
  //       scrollDirection: Axis.horizontal,
  //       itemCount: provider.getLength,        
  //       itemBuilder: (context , index) {
  //           return Row(
  //             children: [  
  //               FilterButton(
  //                   title: provider.categories[index].name,//newCats[index].name
  //                   isSelected: selection[index],
  //                   onPressed: () => chooseCategory(index: index)
  //               ),

  //               SizedBox(width: 10),
  //             ],
  //           );  
  //       },    
        
  //     ),
  //   );
  // }
}


