import 'package:ahss_mobile_frontend/static_files.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class LiveStreamScreen extends StatefulWidget {
  static String id = 'LiveStreamScreen';

  @override
  _LiveStreamScreenState createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  String _streamUrl = 'http://192.168.137.15:8081';

  // TODO: Change the url

  VlcPlayerController _vlcPlayerController;

  @override
  void initState(){
    super.initState();

    _vlcPlayerController = new VlcPlayerController.network(_streamUrl);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LIVE STREAM',
          style: TextStyle(color: kWhiteColor, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      backgroundColor: kSecondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: new VlcPlayer(
                  aspectRatio: 16/9,
                  controller: _vlcPlayerController,
                  placeholder: Center(child: Container(height: 200, width: MediaQuery.of(context).size.width * 0.85, color: Colors.green,)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: kCharcoalColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/play.svg',
                        height: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 60,
                    child: Text(
                      'Cam 1',
                      style: TextStyle(color: kWhiteColor, fontSize: 14,),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: kCharcoalColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/play.svg',
                        height: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 60,
                    child: Text(
                      'Cam 1',
                      style: TextStyle(color: kWhiteColor, fontSize: 14,),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// TODO: complete the upper/bigger player ui
