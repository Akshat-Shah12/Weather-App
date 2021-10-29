import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/models/weather_locations.dart';
import 'package:weather_app/widgets/singleWeather.dart';
import 'package:weather_app/widgets/slider_dot.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int current_location=0;
  void pageChanged(int index){
    setState(() {
      current_location=index;
    });
  }
  String bgImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            print("kdndk");
          },
          icon: Icon(
            Icons.search,
            size: 25,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              print("clicedk");
            },
            child: Container(
                margin: EdgeInsets.only(right: 15),
                child: SvgPicture.asset(
                  'assets/menu.svg',
                  height: 30,
                  width: 30,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/sunny.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            Container(
              margin: EdgeInsets.only(top: 140, left: 15),
              child: Row(
                children: [
                  for(int i=0;i<locationList.length;i++){
                    SliderDot(true);
                  }
                ],
              ),
            ),
            PageView.builder(
                itemCount: locationList.length,
                onPageChanged: pageChanged(i),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) => SingleWeather(i)),
          ],
        ),
      ),
    );
  }
}
