import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routers/application.dart';
import 'package:provide/provide.dart';
import '../test/counter.dart';
import 'dart:convert';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
      ),
      body: ListView(
        children: <Widget>[
          _topHeader(),
          _orderTitle(context),
          _orderType(),
          _anctionList(context)
        ],
      ),
    );
  }

  /// 顶部头像区域
  Widget _topHeader(){
    print('ScreenUtil----${ScreenUtil().scaleHeight}-----${ScreenUtil().scaleWidth}');
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(20),
      color: Colors.pinkAccent,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: ClipOval(
              child:
              Image.network(
                'http://images.baixingliangfan.cn/compressedPic/20190121171258_323.jpg',
                width: 150,
                height: 150,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              '杨静伟',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 订单标题
  Widget _orderTitle(context){
    return InkWell(
      onTap: (){
        var json = jsonEncode(Utf8Encoder().convert('这是通过json转换传递的参数'));
        Application.router.navigateTo(context, '/member2?title=$json');
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 1, color: Colors.black12)
            )
        ),
        child: ListTile(
          leading: Icon(Icons.list),
          title: Text('我的订单'),
          trailing: Icon(Icons.arrow_right),
        ),
      ),
    );

  }

  /// 订单列表
  Widget _orderType(){
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.party_mode,
                  size: 30,
                ),
                Text('待付款')
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.query_builder,
                  size: 30,
                ),
                Text('待发货')
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.directions_car,
                  size: 30,
                ),
                Text('待收货')
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.content_paste,
                  size: 30,
                ),
                Text('待评价')
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///listTitle
  Widget _anctionList(context){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _myListTile(context, '领取优惠券'),
          _myListTile(context, '已领取优惠券'),
          _myListTile(context, '地址管理'),
          _myListTile(context, '客服电话'),
          _myListTile(context, '关于我们'),
        ],
      ),
    );
  }

  Widget _myListTile(context, String title){
    return InkWell(
      onTap: (){
        Application.router.navigateTo(context, '/member');
        Provide.value<Counter>(context).tranferTitle('这是通过provide传递的参数');
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 1, color: Colors.black12)
            )
        ),
        child: ListTile(
          leading: Icon(Icons.blur_circular),
          title: Text(title),
          trailing: Icon(Icons.arrow_right),
        ),
      ),
    );
  }

}