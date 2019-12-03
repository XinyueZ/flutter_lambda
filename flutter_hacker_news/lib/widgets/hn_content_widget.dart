import 'package:flutter/material.dart';
import 'package:flutter_hacker_news/blocs/hn_app_about_bloc.dart';
import 'package:flutter_hacker_news/blocs/hn_list_view_bloc.dart';
import 'package:flutter_hacker_news/blocs/hn_share_bloc.dart';
import 'package:flutter_hacker_news/widgets/hn_app_about_widget.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../config.dart';
import 'hn_list_widget.dart';

class HNContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HNShareBloc model = HNShareBloc();
    model.appSharing();

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HNListBloc>.value(value: HNListBloc()),
        ],
        child: Material(
            child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 10,
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset('assets/logo/hn_flutter.png'),
                onPressed: () {},
              );
            }),
            title: Text(
              APP_NAME,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: APP_PRIMARY_COLOR,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ChangeNotifierProvider<HNAppAboutBloc>.value(
                            value: HNAppAboutBloc(context),
                            child: HNAppAboutWidget());
                      });
                },
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  Share.share(model.shareApp, subject: model.subject);
                },
              )
            ],
          ),
          body: HNListWidget(),
          bottomNavigationBar: Builder(
            builder: (context) => BottomNavigationBar(
              elevation: 10,
              backgroundColor: APP_PRIMARY_COLOR,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.fiber_new,
                    color: Colors.white,
                  ),
                  title: Text(
                    "NEWS",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.work,
                    color: Colors.white,
                  ),
                  title: Text(
                    "JOBS",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
