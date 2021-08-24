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
  String _streamUrl = 'http://10.240.72.142:8081';

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
          style: TextStyle(color: kWhiteColor, fontSize: 20,),
        ),
        leading: BackButton(),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    placeholder: Center(
                      child: Container(
                        // height: MediaQuery.of(context).size.width * 0.7,
                        width: MediaQuery.of(context).size.width * 0.85,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            ListView(
              children: [
                // TODO: List of videos previously recorded
              ],
            ),
          ],
        ),
      ),
    );
  }
}
