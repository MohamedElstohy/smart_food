import 'package:flutter/material.dart';

import '../../helper.dart';
import '../restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String largeImageUrl;

  const RestaurantCard({
    @required this.title,
    @required this.imageUrl,
    @required this.description,
    @required this.largeImageUrl
  }) ;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantScreen(
              imageUrl: largeImageUrl,
              description: description,
            ),
          )
        );
      },
      child: Container(
        height: Helper.getDeviceHeight(context) / 6 +20,
        width: Helper.getDeviceWidth(context),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: (Helper.getDeviceWidth(context) * 45) / 100,  
                height:  (Helper.getDeviceWidth(context) * 45) / 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Image(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                  width: (Helper.getDeviceWidth(context) * 25) / 100,  
                  height:  (Helper.getDeviceWidth(context) * 25) / 100,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),

            SizedBox(width: 20),

            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 20
                    ),
                  ),

                  SizedBox(height: 7),

                  Image(
                    image: AssetImage('assets/images/Group 125.png'),
                    height: 10,
                    fit: BoxFit.contain,
                  ),

                  SizedBox(height: 5),

                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF787878),
                      fontWeight: FontWeight.w500
                    ),
                  ),

                  SizedBox(height: 5),

                  Row(
                    children: [
                      Image(
                        image: AssetImage('assets/images/Icon material-place.png'),
                        width: 9,
                        height: 13,
                      ),

                      SizedBox(width: 5),

                      Text(
                        'المنصورة - شارع الترعة',
                        style: TextStyle(
                          color: Color(0xFF787878),
                          fontSize: 12
                        ),
                      ),

                      SizedBox(width: 5),

                      Text(
                        '- 2 .ك. م',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF060606),
                        fontWeight: FontWeight.w500
                      ),
                      )
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      Image(
                        image: AssetImage('assets/images/fast-delivery.png'),
                        height: 10,
                        width: 20,
                        fit: BoxFit.contain,
                      ),

                      SizedBox(width: 10),

                      Text(
                        'متاح التوصيل',
                        style: TextStyle(
                          color: Color(0xFF787878),
                          fontSize: 12
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}