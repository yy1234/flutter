import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'category_page.dart';
import 'home_page.dart';
import 'member_page.dart';
import 'shop_page.dart';
class BarPage extends StatefulWidget {
  @override
  _BarPageState createState() => _BarPageState();
}

class _BarPageState extends State<BarPage> {
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      title: Text('首页'),
      icon: Icon(CupertinoIcons.home)
    ),
    BottomNavigationBarItem(
        title: Text('分类'),
        icon: Icon(CupertinoIcons.search)
    ),
    BottomNavigationBarItem(
        title: Text('购物车'),
        icon: Icon(CupertinoIcons.share_up)
    ),
    BottomNavigationBarItem(
        title: Text('我'),
        icon: Icon(CupertinoIcons.profile_circled)
    )
  ];

  List pageList = [
    HomePage(),
    CategoryPage(),
    ShopPage(),
    MemberPage(),
  ];
  var currentIndex = 0;
  var currentPage;
  @override
  void initState() {
    currentPage = pageList[currentIndex];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            items: items,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index){
                setState(() {
                  currentIndex = index;
                  currentPage = pageList[index];
                });
            },
        ),
         body: currentPage,
    );
  }
}
