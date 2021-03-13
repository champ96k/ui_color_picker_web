import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.height * 0.6,
                  width: size.width,
                  child: CachedNetworkImage(
                    imageUrl: "https://i.ibb.co/Mh364qZ/about-us.png",
                  ),
                ),
                GestureDetector(
                  onTap: _launchURL,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      "Designed & Built by Tushar Nikam ☕",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.75,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  _launchURL() async {
    const url = 'https://www.buymeacoffee.com/champ96k';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
