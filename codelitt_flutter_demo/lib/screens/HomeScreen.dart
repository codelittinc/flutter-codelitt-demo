

import 'package:codelitt_flutter_demo/appearance/AppColors.dart';
import 'package:codelitt_flutter_demo/routing/Routes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  final double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBackColor,
      appBar: AppBar(title: Text("Codelitt Incubator")),
      body: Center(child: Image.asset('assets/images/codelitt.gif')),
      drawer: Drawer(
        child: list(context)
      ),
    );
  }

  icon(String assetPath) {
    return Image.asset(assetPath, width: iconSize, height: iconSize);
  }

  list(BuildContext context) {
    return ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(child: Image.asset('assets/images/logo_text.png'),
              decoration: BoxDecoration(color: AppColors.mainColor)),
          ListTile(leading: icon('assets/images/pin.png'),
              onTap: () {
                Navigator.pop(context);
                Routes.locationScreen(context);
              }),
          ListTile(leading: icon('assets/images/fb.png'),
              onTap: () {
                Navigator.pop(context);
                _launchURL('https://www.facebook.com/codelitt');
              }),
          ListTile(leading: icon('assets/images/tw.png'),
            onTap: () {
              Navigator.pop(context);
              _launchURL('https://twitter.com/codelittinc');
            },),
          ListTile(leading: Image.asset('assets/images/mail.png', width: iconSize, height: iconSize, color: AppColors.mainColor,),
            onTap: () {
              Navigator.pop(context);
              _launchURL('mailto:hello@codelitt.com');
            },),
          ListTile(leading: Image.asset('assets/images/call.png', width: iconSize, height: iconSize, color: AppColors.mainColor,),
            onTap: () {
              Navigator.pop(context);
              _launchURL('tel:+1 917 725 4119');
            },
          ),
          ListTile(leading: icon('assets/images/logo_marker.png'),
            onTap: () {
              Navigator.pop(context);
            _launchURL('https://www.codelitt.com/');
            },
          ),
          ListTile(),
          ListTile(title: Text('© 2016 Codelitt Inc All rights reserved'),)
        ]
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
