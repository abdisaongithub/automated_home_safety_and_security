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
  String _streamUrl = 'http://192.168.137.66:8081';

  // TODO: Change the url

  VlcPlayerController _vlcPlayerController;

  @override
  void initState() {
    super.initState();

    _vlcPlayerController = new VlcPlayerController.network(_streamUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LIVE STREAM',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 20,
          ),
        ),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            // Container(
            //   height: 200,
            //   width: MediaQuery.of(context).size.width,
            //   color: Colors.red,
            // ),
            Container(
              height: MediaQuery.of(context).size.width * 0.7,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: new VlcPlayer(
                aspectRatio: 16 / 9,
                controller: _vlcPlayerController,
                placeholder: Container(
                  height: MediaQuery.of(context).size.width * 0.8,
                  width: MediaQuery.of(context).size.width * 0.85,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.black,
                        ),
                        SizedBox(height: 30,),
                        Text(
                          'Buffering ... PLease Wait',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            // ListView(
            //   children: [
            //     // TODO: List of videos previously recorded
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
