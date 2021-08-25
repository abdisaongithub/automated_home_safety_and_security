import 'package:ahss_mobile_frontend/actions/get_settings_action.dart';
import 'package:ahss_mobile_frontend/models/setting_model.dart';
import 'package:ahss_mobile_frontend/models/settings_model.dart';
import 'package:ahss_mobile_frontend/static_files.dart';
import 'package:ahss_mobile_frontend/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SettingsScreen extends StatefulWidget {
  static String id = 'SettingsScreen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  bool switched_on = true;
  SettingsModel _settings;
  bool _isLoading = true;
  bool _isLoaded = false;

  fetchSettings() async {
    _settings = await SettingsActions.getSettings();

    if (_settings.next == Strings.NoData) {
      print('Stuff Happens');
    } else {
      setState(() {
        _isLoading = false;
        _isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: _isLoading
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Loading Settings ... Please Wait',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: _settings.results.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SettingsListItem(
                      switched_on: _settings.results[index].state,
                      settingName: _settings.results[index].name,
                      settingId: _settings.results[index].id,
                    );
                  },
                ),
              ),
      ),
    );
  }
}

class SettingsListItem extends StatefulWidget {
  final bool switched_on;
  final String settingName;
  final int settingId;

  const SettingsListItem({
    this.switched_on,
    this.settingName,
    this.settingId,
  });

  @override
  _SettingsListItemState createState() => _SettingsListItemState();
}

class _SettingsListItemState extends State<SettingsListItem>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  bool switched_on;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut);

    _animationController.addListener(() {
      setState(() {});
    });

    switched_on = widget.switched_on;
  }

  setSwitch() {
    if (switched_on == true) {
      _animationController.forward();
      switched_on = true;
    } else {
      switched_on = false;
    }
  }

  setASetting({int id, String name, bool state}) async {
    SettingModel setting = await SettingsActions.setASetting(
      settingId: id,
      name: name,
      state: state,
    );

    setState(() {
      if (setting.state == true) {
        switched_on = true;
        _animationController.forward();
        print('Switched ' + setting.state.toString());
      } else if (setting.state == false) {
        switched_on = false;
        _animationController.reverse();
        print('Switched ' + setting.state.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setSwitch();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          border: Border(
            top: BorderSide(
              color: switched_on ? kBlueColor : kRedColor,
              width: 2,
            ),
            left: BorderSide(
              color: switched_on ? kBlueColor : kRedColor,
              width: 2,
            ),
            right: BorderSide(
              color: switched_on ? kBlueColor : kRedColor,
              width: 2,
            ),
            bottom: BorderSide(
              color: switched_on ? kBlueColor : kRedColor,
              width: 2,
            ),
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: switched_on ? kBlueShadeColor : kRedShadeColor,
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.settingName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        setASetting(
                          id: widget.settingId,
                          name: widget.settingName,
                          state: switched_on == true ? false : true,
                        );
                      },
                      child: Stack(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            height: 26,
                            width: 50,
                            decoration: BoxDecoration(
                              color: switched_on ? kBlueColor : kRedColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Positioned(
                            left: (24 * _animationController.value),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 3),
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
