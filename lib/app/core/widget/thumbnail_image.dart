

import 'package:video_thumbnail/video_thumbnail.dart';

import '../../export.dart';

class ThumbnailImage extends StatefulWidget {
  final String? videoUrl;
  final String? fileName;
  final double? width;
  final double? height;
  final double? scale;
  final ImageFrameBuilder? frameBuilder;
  final ImageErrorWidgetBuilder? errorBuilder;
  final String? semanticLabel;
  final bool? excludeFromSemantics;
  final Color? color;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final ImageRepeat? repeat;
  final Rect? centerSlice;
  final bool? matchTextDirection;
  final bool? gaplessPlayback;
  final bool? isAntiAlias;
  final FilterQuality? filterQuality;
  final int? cacheWidth;
  final int? cacheHeight;
  final Future? futureMethod;

  ThumbnailImage({
    this.videoUrl,
    this.width,
    this.fileName,
    this.height,
    this.futureMethod,
    this.scale = 1.0,
    this.frameBuilder,
    this.errorBuilder,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.color,
    this.colorBlendMode,
    this.fit,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.centerSlice,
    this.matchTextDirection = false,
    this.gaplessPlayback = false,
    this.isAntiAlias = false,
    this.filterQuality = FilterQuality.low,
    this.cacheHeight,
    this.cacheWidth,
  }) : assert(videoUrl != null);

  @override
  State<ThumbnailImage> createState() => _ThumbnailImageState();
}

class _ThumbnailImageState extends State<ThumbnailImage> {
  Future? future;

  Future<String?> getThumbnailFromVideo() async {
    if (Platform.isAndroid) {
      try {
        var url = await VideoThumbnail.thumbnailFile(
          video: widget.videoUrl!,
          imageFormat: ImageFormat.PNG,
          quality: 100,
          thumbnailPath: (await getTemporaryDirectory()).path,
        );
        debugPrint("video Url image$url");
        return url;
      } on Exception catch (e) {
        throw "Error : $e";
      }
    } else {
      try {
        var path = (await getTemporaryDirectory()).path;
        var fileName = widget.fileName?.split(".")[0];
        var url = await VideoThumbnail.thumbnailFile(
          video: widget.videoUrl!,
          imageFormat: ImageFormat.PNG,
          quality: 100,
          thumbnailPath: '$path/$fileName.png',
        );
        debugPrint("video Url image$url");
        return url;
      } on Exception catch (e) {
        throw "Error : $e";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
                child: CircularProgressIndicator(
              color: appColor,
              backgroundColor: Colors.white,
            ));
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.data == null) {
              return Image.network(
                "http://no_image",
                width: widget.width,
                height: widget.height,
                scale: widget.scale!,
                frameBuilder: widget.frameBuilder,
                errorBuilder: widget.errorBuilder,
                semanticLabel: widget.semanticLabel,
                excludeFromSemantics: widget.excludeFromSemantics!,
                color: widget.color,
                colorBlendMode: widget.colorBlendMode,
                fit: widget.fit,
                alignment: widget.alignment!,
                repeat: widget.repeat!,
                centerSlice: widget.centerSlice,
                matchTextDirection: widget.matchTextDirection!,
                gaplessPlayback: widget.gaplessPlayback!,
                isAntiAlias: widget.isAntiAlias!,
                filterQuality: widget.filterQuality!,
                cacheHeight: widget.cacheHeight,
                cacheWidth: widget.cacheWidth,
              );
            }
            return Image.file(
              File(snapshot.data),
              width: widget.width,
              height: widget.height,
              scale: widget.scale!,
              frameBuilder: widget.frameBuilder,
              errorBuilder: widget.errorBuilder,
              semanticLabel: widget.semanticLabel,
              excludeFromSemantics: widget.excludeFromSemantics!,
              color: widget.color,
              colorBlendMode: widget.colorBlendMode,
              fit: widget.fit,
              alignment: widget.alignment!,
              repeat: widget.repeat!,
              centerSlice: widget.centerSlice,
              matchTextDirection: widget.matchTextDirection!,
              gaplessPlayback: widget.gaplessPlayback!,
              isAntiAlias: widget.isAntiAlias!,
              filterQuality: widget.filterQuality!,
              cacheHeight: widget.cacheHeight,
              cacheWidth: widget.cacheWidth,
            );
        }
      },
    );
  }

  @override
  void initState() {
    future = getThumbnailFromVideo();
    super.initState();
  }
}
