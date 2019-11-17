import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hacker_news/blocs/hn_list_view_bloc.dart';
import 'package:flutter_hacker_news/blocs/hn_splash_bloc.dart';
import 'package:flutter_hacker_news/config.dart';
import 'package:provider/provider.dart';

import 'hn_content_widget.dart';

class HNSplashWidget extends StatefulWidget {
  @override
  _HNSplashWidgetState createState() => _HNSplashWidgetState();
}

class _HNSplashWidgetState extends State<HNSplashWidget> {
  @override
  void initState() {
    super.initState();
    () async {
      final HNSplashBloc splashModel =
          HNSplashBloc(() => InternetAddress.lookup("g.cn"));
      final bool pingSuccessfully = await splashModel.pingInternet();

      if (pingSuccessfully) {
        await initSupportedLanguage();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return HNContentWidget();
        }));
      } else {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
    }();
  }

  @override
  Widget build(BuildContext context) => Material(
        color: APP_PRIMARY_COLOR,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: 120,
                height: 120,
                child: Image.asset('assets/logo/hn_flutter.png')),
            SizedBox(
              height: 8,
            ),
            SizedBox(width: 120, height: 3, child: LinearProgressIndicator())
          ],
        )),
      );
}