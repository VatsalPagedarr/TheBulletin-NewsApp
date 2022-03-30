import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveNews extends StatefulWidget {
  const LiveNews({ Key? key }) : super(key: key);

  @override
  _LiveNewsState createState() => _LiveNewsState();
}

class _LiveNewsState extends State<LiveNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.black
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text('Live news',
          style: TextStyle(
            color: Colors.red,
          ),),
          ]
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.share,)),
          )
        ],
      ),

      body: VideoScreens(),
      
    );
  }
}

class VideoScreens extends StatefulWidget {
  const VideoScreens({ Key? key }) : super(key: key);

  @override
  _VideoScreensState createState() => _VideoScreensState();
}

class _VideoScreensState extends State<VideoScreens> {
  @override
  Widget build(BuildContext context) {

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: "gEnn-VLwDSc",
      flags: YoutubePlayerFlags(
        // enableCaption = true,
        // captionLanguage = 'en',
        isLive: true,
        autoPlay: false,
        mute: false,
        enableCaption: true,
        captionLanguage: 'en'
      ),

    );
    
    return Scaffold(
      body: Center(
        child:Container(
          width: MediaQuery.of(context).size.width/1.2,
          height: MediaQuery.of(context).size.height/4,
          child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
                aspectRatio: 16/9,
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(isExpanded: true),
                ],
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
              liveUIColor: Colors.red,
              progressColors: ProgressBarColors(
                playedColor: Colors.red,
                handleColor: Colors.grey[300],
              ),
            ), 
                       builder:(context,player){
                    return Column(
                    children: <Widget>[
                     player
                    ],
                    );
                },
          ),
        ), 
      ),
    );
  }
}