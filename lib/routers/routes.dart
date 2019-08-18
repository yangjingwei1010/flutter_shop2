import 'package:flutter/material.dart';
import 'router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';
  static String memberPage = '/member';
  static void configFoundHandler(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('ERROR==========>ROUTE WAS NOT FOUND!!!');
      }
    );
    router.define(detailsPage, handler: detailsHandler);
    router.define(memberPage, handler: membetHandler);
  }

}