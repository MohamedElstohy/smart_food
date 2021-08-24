import 'package:flutter/material.dart';
import 'package:smart_food/helper.dart';

class RestaurantScreen extends StatelessWidget {
  final String imageUrl;
  final String description;

  RestaurantScreen({
    @required this.imageUrl,
    @required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),

        body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
                children: [
                  restaurantImageAndTitle(context),

                  Positioned(
                    top: (Helper.getDeviceHeight(context) / 4 ) - 20,
                    child: Container(
                      width: Helper.getDeviceWidth(context),
                      height: Helper.getDeviceHeight(context),
                      padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 30),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        )
                      ),
                      child: Column(
                        children: [
                          descriptionContainer(context),

                          Divider(color: Color(0xFFE4E4E4)),

                          timesContainer(context),

                          Divider(color: Color(0xFFE4E4E4),),

                          SizedBox(height: 10),

                          Row(
                            children: [
                              Text(
                                'الأصناف',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Color(0xFF46200B),
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),

                          Container(
                            height: Helper.getDeviceHeight(context),
                            child: GridView(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 10,
                              ),
                              children: [
                                Container(
                                  width:  double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(15),
                                  ), 
                                  child: Container(
                                    color: Colors.red,
                                  ),
                                ),

                                GridTile(
                                  header: Expanded(flex: 3 ,child: Container(color: Colors.red,)),
                                  child: Expanded(flex: 1,child: Container(color: Colors.green,)),
                                  // footer: Container(color: Colors.yellow,),
                                ),

                                Container(
                                  color: Colors.red,
                                  width:  double.infinity,
                                  height: double.infinity, 
                                ),

                                Container(
                                  color: Colors.red,
                                  width:  double.infinity,
                                  height: double.infinity, 
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
          ),
        ),
      ),
    );
  }

  Widget descriptionContainer(BuildContext context){
    return Container(
      height: Helper.getDeviceHeight(context) / 9,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: TextStyle(
              color: Color(0xFF46200B),
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          ),

          SizedBox(height: 15,),

          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Image(
                image: AssetImage('assets/images/Icon material-place-red.png'),
                height: 20,
                width: 15,
                fit: BoxFit.cover,
              ),

              SizedBox(width: 8,),

              Text(
                'المنصورة - شارع الترعة   -',
                style: TextStyle(
                  fontSize: 19,
                  color: Color(0xFF787878)
                ),
              ),

              SizedBox(width: 9,),

              Text(
                '2 .ك. م',
                style: TextStyle(
                  fontSize: 19,
                  color: Color(0xFF060606),
                  fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget timesContainer(BuildContext context){
    return Container(
      height: Helper.getDeviceHeight(context) / 9,
      width: double.infinity,
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            // textBaseline: TextBaseline.alphabetic,
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Icon(
                Icons.watch_later,
                size: 20,
                color: Color(0xFF0DBF00),
              ),

              SizedBox(width: 9),

              Text(
                'مفتوح',
                style: TextStyle(
                  color: Color(0xFF0DBF00),
                  fontSize: 18
                ),
              ),

              SizedBox(width: 5),

              Text(
                '-',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF787878)
                ),
              ),

              SizedBox(width: 5),

              Text(
                'من 10 ص إلى 10 م',
                style: TextStyle(
                  color: Color(0xFF575757),
                  fontSize: 18,
                ),
              )
            ],
          ),
        
          SizedBox(height: 8),

          Row(
            children: [
              Image(
                image: AssetImage('assets/images/fast-delivery.png'),
                height: 16,
                width: 30,
                fit: BoxFit.cover,
              ),

              SizedBox(width: 10),


              Text(
                'متاح التوصيل',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF787878)
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  Widget restaurantImageAndTitle(BuildContext context){
    return Container(
      height: Helper.getDeviceHeight(context),
      width: Helper.getDeviceWidth(context),
      alignment: Alignment.topCenter,
      child: Container(
        height: Helper.getDeviceHeight(context) / 4,
        width: Helper.getDeviceWidth(context),
        padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
            colorFilter: new ColorFilter.mode(Colors.black, BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Image(
                image: AssetImage('assets/images/Icon feather-chevron-right.png'),
                width: 9,
                height: 18,
                fit: BoxFit.cover,
              ), 
            ),

            SizedBox(height: 20),

            Text(
              'أهل الشام',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 10),

            Image(
              image: AssetImage('assets/images/Group 125.png'),
              height: 15,
              width: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

}