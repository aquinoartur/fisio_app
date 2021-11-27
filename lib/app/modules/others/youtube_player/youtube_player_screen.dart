// ignore_for_file: unnecessary_string_escapes, unused_field

import 'package:fisio_app/app/core/core.dart';
import 'package:fisio_app/app/fisio_design_system/colors_palette/fisio_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'youtube_player_controller.dart';

class YoutubePlayerScreen extends StatefulWidget {
  @override
  State<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    '4NRXx6U8ABQ',
    'a5uQMwRMHcs',
    'XXYlFuWEuKI',
    'd_HlPboLRL8',
    'Q0oIoR9mLwc',
  ];

  final YoutubePlayerScreenController controller = YoutubePlayerScreenController();
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () => SystemChrome.setPreferredOrientations(DeviceOrientation.values),
      // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: FisioColors.primaryLightColor,
        progressColors: const ProgressBarColors().copyWith(
          playedColor: FisioColors.primaryLightColor,
          handleColor: FisioColors.primaryColor,
        ),
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          // IconButton(
          //   icon: const Icon(Icons.settings, color: Colors.white, size: 25.0),
          //   onPressed: () => log('Settings Tapped!'),
          // ),
        ],
        onReady: () => _isPlayerReady = true,
        onEnded: (data) {
          _controller.load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          controller.showSnackBar('O vídeo seguinte foi iniciado!', context);
        },
      ),
      builder: (context, player) => Scaffold(
        appBar: CustomAppBar(title: 'Youtube Player'),
        body: ListView(
          children: [
            player,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.skip_previous),
                        onPressed: _isPlayerReady
                            ? () =>
                                _controller.load(_ids[(_ids.indexOf(_controller.metadata.videoId) - 1) % _ids.length])
                            : null,
                      ),
                      IconButton(
                        icon: Icon(
                          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                        onPressed: _isPlayerReady
                            ? () {
                                _controller.value.isPlaying ? _controller.pause() : _controller.play();
                                setState(() {});
                              }
                            : null,
                      ),
                      IconButton(
                        icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                        onPressed: _isPlayerReady
                            ? () {
                                _muted ? _controller.unMute() : _controller.mute();
                                setState(() => _muted = !_muted);
                              }
                            : null,
                      ),
                      FullScreenButton(controller: _controller, color: FisioColors.primaryLightColor),
                      IconButton(
                        icon: const Icon(Icons.skip_next),
                        onPressed: _isPlayerReady
                            ? () =>
                                _controller.load(_ids[(_ids.indexOf(_controller.metadata.videoId) + 1) % _ids.length])
                            : null,
                      ),
                    ],
                  ),
                  _space,
                  Row(
                    children: <Widget>[
                      const Text('Volume', style: TextStyle(fontWeight: FontWeight.w300)),
                      Expanded(
                        child: Slider(
                          inactiveColor: Colors.transparent,
                          activeColor: FisioColors.primaryLightColor,
                          value: _volume,
                          min: 0.0,
                          max: 100.0,
                          divisions: 10,
                          label: '${(_volume).round()}',
                          onChanged: _isPlayerReady
                              ? (value) {
                                  setState(() => _volume = value);
                                  _controller.setVolume(_volume.round());
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //* form_field
    // ...[_space, _space, _space],
    // TextField(
    // enabled: _isPlayerReady,
    // controller: _idController,
    // decoration: InputDecoration(
    // border: InputBorder.none,
    // hintText: 'Youtube vídeo: \<video id\> ou \<link\>',
    // fillColor: FisioColors.primaryColor.withAlpha(20),
    // filled: true,
    // hintStyle: const TextStyle(fontWeight: FontWeight.w300, color: FisioColors.primaryLightColor),
    // suffixIcon: IconButton(icon: const Icon(Icons.clear), onPressed: () => _idController.clear()),
    // ),
    // ),
    // ...[_space, _space, _space],
    // Row(
    // children: [
    // _loadCueButton('Carregar'),
    // const SizedBox(width: 10.0),
    // _loadCueButton('CUE'),
    // ],
    // ),
  }

  // ignore: unused_element
  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: TextStyle(
          color: FisioColors.primaryLightColor,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              color: FisioColors.primaryLightColor,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);

  // ignore: unused_element
  Widget _loadCueButton(String action) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60.0),
        child: MaterialButton(
          color: FisioColors.primaryColor,
          onPressed: _isPlayerReady
              ? () {
                  if (_idController.text.isNotEmpty) {
                    var id = YoutubePlayer.convertUrlToId(
                          _idController.text,
                        ) ??
                        '';
                    if (action == 'LOAD') _controller.load(id);
                    if (action == 'CUE') _controller.cue(id);
                    FocusScope.of(context).requestFocus(FocusNode());
                  } else {
                    controller.showSnackBar('Informação inválida', context);
                  }
                }
              : null,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Text(
              action,
              style: const TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
