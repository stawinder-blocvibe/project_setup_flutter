


import 'package:base_project/app/export.dart';


class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final bool isNetwork;

  const VideoPlayerWidget(
      {Key? key, required this.videoUrl, this.isNetwork = true})
      : super(key: key);

  @override
  State createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late final player = Player();
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  _init() async {
    debugPrint("videoUrl========> ${widget.videoUrl}");
    player.open(Media(widget.videoUrl));
  }

  Widget get header {
    return CupertinoButton(
      child: Icon(
        Icons.cancel_outlined,
        color: Colors.white,
        size: height_30,
      ),
      onPressed: () {
        // close the fullscreen
        Navigator.maybePop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: height_250,
            child: Video(
              controller: controller,
              fit: BoxFit.cover,
            ),
          ),
          header
        ],
      ),
    );
  }
}
