// Copyright 2020 Sarbagya Dhaubanjar. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:specifications_cars/widgets/widgetVidoe/meta_data_section.dart';
// import 'package:specifications_cars/widgets/widgetVidoe/play_pause_button_bar.dart';
// import 'package:specifications_cars/widgets/widgetVidoe/player_state_section.dart';
// import 'package:specifications_cars/widgets/widgetVidoe/source_input_section.dart';
// import 'package:specifications_cars/widgets/widgetVidoe/volume_slider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

///
class YoutubeAppDemo extends StatefulWidget {
  // List<String> vidoe;
  String vidoe;
  YoutubeAppDemo(this.vidoe);

  @override
  _YoutubeAppDemoState createState() => _YoutubeAppDemoState();
}

class _YoutubeAppDemoState extends State<YoutubeAppDemo> {
  _YoutubeAppDemoState();
  YoutubePlayerController _controller;
  // String videoId = widget.vidoe;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.vidoe,
      params: YoutubePlayerParams(
          // playlist: widget.vidoe,

          // startAt: const Duration(minutes: 1, seconds: 36),
          showControls: true,
          autoPlay: false,
          showFullscreenButton: true,
          desktopMode: false,
          privacyEnhanced: true,
          useHybridComposition: true,
          playsInline: false),
    );

    _controller.onEnterFullscreen = () async {
      await SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

      log('Exited Fullscreen');
    };
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);

    const player = YoutubePlayerIFrame();
    return Container(
      height: 250,
      // margin: EdgeInsets.only(top: 20, bottom: 10),
      child: YoutubePlayerControllerProvider(
        controller: _controller,
        child: player,
      ),
    );

    // return Container(
    //   height: 400,
    //   child: ListView.builder(
    //     itemCount: widget.vidoe.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       YoutubePlayerController _control = YoutubePlayerController(
    //         initialVideoId: widget.vidoe[index],
    //         params: YoutubePlayerParams(
    //             playlist: widget.vidoe,

    //             // startAt: const Duration(minutes: 1, seconds: 36),
    //             showControls: true,
    //             autoPlay: false,
    //             showFullscreenButton: true,
    //             desktopMode: false,
    //             privacyEnhanced: true,
    //             useHybridComposition: true,
    //             playsInline: false),
    //       );
    //       _control.onEnterFullscreen = () {
    //         SystemChrome.setPreferredOrientations([
    //           DeviceOrientation.landscapeLeft,
    //           DeviceOrientation.landscapeRight,
    //         ]);
    //         SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    //       };

    //       return YoutubePlayerControllerProvider(
    //         // Passing controller to widgets below.

    //         controller: _control,

    //         child: Container(

    //             // color: Colors.sdeepPurple,
    //             margin: EdgeInsets.only(top: 20.h, right: 10.w, left: 10.w),
    //             child: Card(
    //               elevation: 20,
    //               child: Stack(
    //                 children: [
    //                   player,
    //                   // Positioned.fill(
    //                   //   child: YoutubeValueBuilder(
    //                   //     controller: _controller,
    //                   //     builder: (context, value) {
    //                   //       return AnimatedCrossFade(
    //                   //         firstChild: const SizedBox.shrink(),
    //                   //         secondChild: Material(
    //                   //           child: DecoratedBox(
    //                   //             decoration: BoxDecoration(
    //                   //               image: DecorationImage(
    //                   //                 image: NetworkImage(
    //                   //                   YoutubePlayerController.getThumbnail(
    //                   //                     videoId: _controller.params.playlist.first,
    //                   //                     quality: ThumbnailQuality.medium,
    //                   //                   ),
    //                   //                 ),
    //                   //                 fit: BoxFit.fitWidth,
    //                   //               ),
    //                   //             ),
    //                   //             child: const Center(
    //                   //               child: CircularProgressIndicator(),
    //                   //             ),
    //                   //           ),
    //                   //         ),
    //                   //         crossFadeState: value.isReady
    //                   //             ? CrossFadeState.showFirst
    //                   //             : CrossFadeState.showSecond,
    //                   //         duration: const Duration(milliseconds: 300),
    //                   //       );
    //                   //     },
    //                   //   ),
    //                   // ),
    //                 ],
    //               ),
    //             )),
    //       );
    //     },
    //   ),
    // );

    // return YoutubePlayerControllerProvider(
    //   // Passing controller to widgets below.

    //   controller: _controller,

    //   child: Container(

    //       // color: Colors.sdeepPurple,
    //       margin: EdgeInsets.only(top: 20.h, right: 10.w, left: 10.w),
    //       child: Card(
    //         elevation: 20,
    //         child: Stack(
    //           children: [
    //             player,
    //             Positioned.fill(
    //               child: YoutubeValueBuilder(
    //                 controller: _controller,
    //                 builder: (context, value) {
    //                   return AnimatedCrossFade(
    //                     firstChild: const SizedBox.shrink(),
    //                     secondChild: Material(
    //                       child: DecoratedBox(
    //                         decoration: BoxDecoration(
    //                           image: DecorationImage(
    //                             image: NetworkImage(
    //                               YoutubePlayerController.getThumbnail(
    //                                 videoId: _controller.params.playlist.first,
    //                                 quality: ThumbnailQuality.medium,
    //                               ),
    //                             ),
    //                             fit: BoxFit.fitWidth,
    //                           ),
    //                         ),
    //                         child: const Center(
    //                           child: CircularProgressIndicator(),
    //                         ),
    //                       ),
    //                     ),
    //                     crossFadeState: value.isReady
    //                         ? CrossFadeState.showFirst
    //                         : CrossFadeState.showSecond,
    //                     duration: const Duration(milliseconds: 300),
    //                   );
    //                 },
    //               ),
    //             ),
    //           ],
    //         ),
    //       )),
    // );
  }

  // @override
  // void dispose() {
  //   _controller.close();
  //   super.dispose();
  // }
}

///

// class Controls extends StatelessWidget {
//   ///
//   const Controls();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _space,
//           MetaDataSection(),
//           _space,
//           SourceInputSection(),
//           _space,
//           PlayPauseButtonBar(),
//           _space,
//           VolumeSlider(),
//           _space,
//           PlayerStateSection(),
//         ],
//       ),
//     );
//   }

//   Widget get _space => const SizedBox(height: 10);
// }
