import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';
import 'package:sprintf/sprintf.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<CartProvider>(
      builder: (context, child, val) {
        return Container(
            margin: EdgeInsets.all(5.0),
            color: Colors.white,
            width: ScreenUtil().setWidth(750),
            child: Row(
              children: <Widget>[
                selectAllBtn(context),
                allPriceArea(context),
                gobutton(context)
              ],
            ),
        );
      }
    );

  }

  /// 全选按钮
  Widget selectAllBtn(context) {
    bool isAllCheck = Provide.value<CartProvider>(context).isAllCheck;
    print(isAllCheck);
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isAllCheck,
            activeColor: Colors.pink,
            onChanged: (bool val){
              Provide.value<CartProvider>(context).changeAllCheckBtnState(val);
            },
          ),
          Text('全选')
        ],
      ),
    );
  }

  /// 合计区域
  Widget allPriceArea(context) {
    double price = Provide.value<CartProvider>(context).allPrice;
    String allPrice = sprintf('¥%.2f',[price]);
    return Container(
      width: ScreenUtil().setWidth(430),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(280),
                child: Text(
                  '合计',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36)
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: Text(
                  allPrice,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                    color: Colors.red
                  ),
                ),
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送费，预购免配送费',
              style: TextStyle(
                color: Colors.black38,
                fontSize: ScreenUtil().setSp(22)
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 结算按钮
  Widget gobutton(context) {
    int allGoodsCount = Provide.value<CartProvider>(context).allGoodsCount;
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(3.0)
          ),
          child: Text(
            '结算${allGoodsCount}',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }



}
