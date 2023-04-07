import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled7/tabs/widget/scheduleCard.dart';
import 'package:untitled7/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Advertise extends StatefulWidget {
  const Advertise({Key? key}) : super(key: key);

  @override
  _AdvertiseState createState() => _AdvertiseState();
}

class _AdvertiseState extends State<Advertise>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Size size;

  late List<String> imgList;
  late int _current;
  ScrollController controller = ScrollController();
  double locationAlpha = 0;
  late AnimationController _animationController;
  late Animation _colorTween;
  bool isMyFavoriteContent = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _colorTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    imgList = [
      'assets/yana.png',
      'assets/be.png',
      'assets/ya.png'
    ];
    _current = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 400,
          height: 160,
          child: Stack(
            children: [
              InkWell(
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      height: size.width * 0.4,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: imgList.map((i) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: InkWell(
                        onTap : (){
                          if(i =='assets/yana.png'){
                            launch("https://www.yanadoo.co.kr/");
                          }
                          else if(i == 'assets/be.png'){
                            launch("https://www.baemin.com/");
                          }
                          else if(i == 'assets/ya.png'){
                            launch("https://www.yanolja.com/");
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                            i,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}