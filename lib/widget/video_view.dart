import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_fl/util/color.dart';
import 'package:video_player/video_player.dart';
import 'package:orientation/orientation.dart';

///播放器组件
class VideoView extends StatefulWidget {
  final String url;
  final String? cover;
  final bool autoPlay;
  final bool looping;
  final double aspectRatio;
  final Widget? overlayUI;

  const VideoView(this.url,
      {Key? key,
      this.cover,
      this.autoPlay = false,
      this.looping = false,
      this.aspectRatio = 16 / 9,
      this.overlayUI})
      : super(key: key);

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _videoPlayerController; //video_player播放器Controller
  late ChewieController _chewieController; //chewie播放器Controller
  //封面
  // get _placeholder => FractionallySizedBox(
  //       widthFactor: 1,
  //       child: cachedImage(widget.cover),
  //     );

  //进度条颜色配置
  get _progressColors => ChewieProgressColors(
      playedColor: primaryCor,
      handleColor: primaryCor,
      backgroundColor: Colors.grey,
      bufferedColor: primaryCor[50]!);

  @override
  void initState() {
    super.initState();
    //初始化播放器设置
    var mp4 = 'http://vfx.mtime.cn/Video/2019/03/18/mp4/190318231014076505.mp4';
    _videoPlayerController = VideoPlayerController.network(mp4);
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: widget.aspectRatio,
        autoPlay: widget.autoPlay,
        looping: widget.looping,
        // placeholder: _placeholder,
        allowMuting: false,
        allowPlaybackSpeedChanging: false,
        // customControls: MaterialControls(
        //   showLoadingOnInitialize: false,
        //   showBigPlayIcon: false,
        //   bottomGradient: blackLinearGradient(),
        //   overlayUI: widget.overlayUI,
        // ),
        materialProgressColors: _progressColors);
    //fix iOS无法正常退出全屏播放问题
    _chewieController.addListener(_fullScreenListener);
  }

  @override
  void dispose() {
    _chewieController.removeListener(_fullScreenListener);
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double playerHeight = screenWidth / widget.aspectRatio;
    return Container(
      width: screenWidth,
      height: playerHeight,
      color: Colors.grey,
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  void _fullScreenListener() {
    Size size = MediaQuery.of(context).size;
    if (size.width > size.height) {
      OrientationPlugin.forceOrientation(DeviceOrientation.portraitUp);
    }
  }
}
