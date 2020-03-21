import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'HelloWorld.dart';

class LoginVideo extends StatefulWidget {
  const LoginVideo();

  @override
  _LoginVideoState createState() => _LoginVideoState();
}

class _LoginVideoState extends State<LoginVideo> {
  VideoPlayerController _controller;

  //
//  final String videoUrl =
//      "https://video.pearvideo.com/mp4/short/20200318/cont-1662268-15018808-hd.mp4";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset('assets/wechat1.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Transform.scale(
          scale: _controller.value.aspectRatio /
              MediaQuery.of(context).size.aspectRatio *
              1.01,
          child: Center(
            child: Container(
              child: _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Text(""),
            ),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: 26.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HelloWorld()));
                },
                child: Container(
                  height: 44.0,
                  width: 240.0,
                  child: Center(
                    child: Text(
                      "进入微信",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                color: Color(0xffffffff),
                textColor: Color(0xff202326),
                elevation: 0.0,
                focusElevation: 0.0,
                highlightElevation: 0.0,
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: 80.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "因你看见",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "所以存在",
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              )
            ],
          ),
        )
      ],
    ));
  }
}
