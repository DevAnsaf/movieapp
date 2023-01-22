import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MoviePLayer extends StatefulWidget {
  const MoviePLayer({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;
  @override
  State<MoviePLayer> createState() => _MoviePLayerState();

}

class _MoviePLayerState extends State<MoviePLayer> {

  VideoPlayerController? _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Movie Player",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          _controller!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                )
              : Container(),
              //Video progress indicator
              VideoProgressIndicator(_controller!, allowScrubbing: true),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_previous),
                  color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
                },
                icon: const Icon(Icons.play_arrow),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_next),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

