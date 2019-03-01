import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      /*FutureBuilder*/
      body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context,snapshot){
            if (snapshot.hasData){
              var data = json.decode(snapshot.data.toString());
              List<Map> swiperDataList = (data['data']['slides'] as List).cast();
              return Column(
                children: <Widget>[
                  SwiperDiy(SwiperDataList: swiperDataList,)
                ],
              );
            }else{
              return Center(
                child: Text('加载中'),
              );
            }
          }
      )
    );
  }
}

/*顶部循环视图的组件*/
class SwiperDiy extends StatelessWidget {
  final List SwiperDataList;
  SwiperDiy({Key key,this.SwiperDataList}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 333,
        child: Swiper(
            itemCount: SwiperDataList.length,
            itemBuilder: (BuildContext context,int index){
              return Image.network("${SwiperDataList[index]['image']}",fit: BoxFit.fill,);
            },
          pagination: new SwiperPagination(),
          autoplay: true,
        ),
    );
  }
}

