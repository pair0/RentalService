import 'package:untitled7/tabs/tab/homeTab.dart';
import 'package:untitled7/tabs/tab/scheduleTab.dart';
import 'package:untitled7/tabs/tab/mypageTab.dart';
import 'package:untitled7/utils/colors.dart';
import 'package:flutter/material.dart';
//
// class Home extends StatefulWidget {
//
//
//   const Home({Key? key}) : super(key: key);
//   @override
//   _HomeState createState() => new _HomeState();
// }
//
// List<Map> navigationBarItems = [
//   {'icon': Icons.home, 'index': 0},
//   {'icon': Icons.map, 'index': 1},
//   {'icon': Icons.login, 'index': 2},
// ];
//
// class _HomeState extends State<Home> {
//   final _navigatorKeyList = List.generate(3, (index) => GlobalKey<NavigatorState>());
//   int _currentIndex = 0;
//
//   final _pages = [
//     HomeTab(),
//     ScheduleTab(
//         lat: "0",
//         long: "0",
//         store_id: "0"),
//         MypageTab(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 3,
//         child: WillPopScope(
//           onWillPop: () {
//             setState(() {
//
//             });
//             return Future(() => false);
//           },
//           child: Scaffold(
//             body: TabBarView(
//               physics: NeverScrollableScrollPhysics(),
//               children: _pages.map( (page) {
//                 return CustomNavigator( page: page);
//               },
//               ).toList(),
//             ),
//             bottomNavigationBar: TabBar(
//               indicatorPadding: EdgeInsets.only(left: 30.0, right: 30.0),
//               indicatorColor: Colors.grey,
//               //tab 하단 indicator weight
//               indicatorWeight: 5,
//               //label color
//               isScrollable: false,
//               labelColor: Colors.grey,
//               onTap: (index) => setState(() { _currentIndex = index; }),
//               tabs: const [
//                 Tab( icon: Icon( Icons.home, color: Colors.grey,)),
//                 Tab( icon: Icon( Icons.map, color: Colors.grey,)),
//                 Tab( icon: Icon( Icons.login, color: Colors.grey,)),
//               ],
//             ),
//       ),
//         ),
//     );
//   }
// }
//
// class CustomNavigator extends StatefulWidget {
//   final Widget page;
//   const CustomNavigator({Key? key, required this.page}) : super(key: key);
//   @override _CustomNavigatorState createState() => _CustomNavigatorState();
// }
//
// class _CustomNavigatorState extends State<CustomNavigator>{
//   @override Widget build(BuildContext context) {
//     return Navigator(
//       onGenerateRoute: (_) => MaterialPageRoute(builder: (context) => widget.page),
//     );
//   }
// }


class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => new _HomeState();
}

List<Map> navigationBarItems = [
  {'icon': Icons.home, 'index': 0},
  {'icon': Icons.map, 'index': 1},
  {'icon': Icons.login, 'index': 2},
];

class _HomeState extends State<Home> {
  DateTime? currentBackPressTime;
  final _navigatorKeyList = List.generate(3, (index) => GlobalKey<NavigatorState>());
  int _currentIndex = 0;
  String resort = "";

  @override
  Widget build(BuildContext context) {


    void goToSchedule() {
      setState(() {
        _currentIndex = 1;

      });
    }

    var _pages = [
      HomeTab(onPressedScheduleCard : goToSchedule),
      ScheduleTab(
          lat: "0",
          long: "0",
          store_id: "0"),
      MypageTab(),
    ];


    return DefaultTabController(
      length: 3,
      child: WillPopScope(
        onWillPop: () async {
          DateTime now = DateTime.now();
          if(currentBackPressTime == null ||
              now.difference(currentBackPressTime!) > Duration(seconds : 1)){
            currentBackPressTime = now;
            final _msg = 'click one more to exit this screen';
            final snackBar = SnackBar(content: Text(_msg));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
              return Future.value(false);
              
          }
          return !(await _navigatorKeyList[_currentIndex].currentState!.maybePop());
          //return Future.value(true);

         },
        child: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: _pages.map((page) {
              int index = _pages.indexOf(page);
              return Navigator(
                key: _navigatorKeyList[index],
                onGenerateRoute: (_) {
                  return MaterialPageRoute(builder: (context) => page);
                },
              );
            }).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey),
            selectedItemColor: Colors.grey[700],
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.grey),
                label: '홈', ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map, color: Colors.grey),
                label: '지도',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.login, color: Colors.grey),
                label: '마이페이지',
              ),
            ],
            onTap: (index) => setState(() => _currentIndex = index),
          ),
        ),
      ),
    );
  }
}


