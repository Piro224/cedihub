// ignore_for_file: unused_import

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cedihub/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key, required this.models});
  final Models models;


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = 0;
  var activeNavBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var sliderHeight = height * 0.45;
    var padding = 24.0;
    var radius = 30.0;
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 47, 109, 49),
                      ),
                      child: Image.asset(
                        "assets/cedihub_logo 2.png",
                        fit: BoxFit.cover,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 47, 109, 49),
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 10),

              //Slider
              CarouselSlider(
                options: CarouselOptions(
                    height: 300,
                    enableInfiniteScroll: true,
                    // enlargeCenterPage: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    autoPlay: true),
                items: [
                  ...List.generate(
                    widget.models.hubs.length,
                    ((index) {
                      return Slider(
                        sliderHeight: sliderHeight,
                        width: width,
                        radius: radius,
                        padding: padding,
                        imagePath: widget.models.hubs[index][1],
                        text: widget.models.hubs[index][0],
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    widget.models.hubs.length,
                    ((index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          height: 8,
                          width: 8 == index ? 20 : 10,
                          decoration: BoxDecoration(
                            
                            color: currentPage == index
                                ? Colors.black
                                : Color.fromARGB(255, 47, 109, 49),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: const EdgeInsets.all(8),
                  indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(width: 5.0, ),
                      insets: const EdgeInsets.symmetric(horizontal: 36.0)),
                  indicatorPadding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  isScrollable: false,
                  labelColor: Colors.black,
                  unselectedLabelColor: Color.fromARGB(255, 47, 109, 49),
                  tabs: const [
                    Tab(
                        icon: Icon(
                      CupertinoIcons.house_alt_fill,
                      size: 28,
                    )),
                    Tab(
                        icon: Icon(
                      CupertinoIcons.group,
                      size: 28,
                    )),
                    Tab(
                        icon: Icon(
                      Icons.person,
                      size: 28,
                    )),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class Slider extends StatelessWidget {
  const Slider({
    super.key,
    required this.sliderHeight,
    required this.width,
    required this.radius,
    required this.padding,
    required this.imagePath,
    required this.text,
  });

  final double sliderHeight;
  final double width;
  final double radius;
  final double padding;
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: width,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: width,
                padding: EdgeInsets.all(padding),
                child: Text(
                  text,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
