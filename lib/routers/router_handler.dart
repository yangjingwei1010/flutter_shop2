import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/details_page.dart';
import '../pages/member_detail.dart';
import '../pages/member_detail2.dart';

Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String goodsId = params['id'].first;
    print('index>details goodsID is ${goodsId}');
    return DetailsPage(goodsId: goodsId,);
  }
);

Handler membetHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return MemberDetail();
    }
);

Handler membetHandler2 = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String title = params['title'].first;
      print('MemberDetail2 is ${title}');
      return MemberDetail2(title);
    }
);