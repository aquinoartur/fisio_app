import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import '../../../core/extensions/theme_controller_extension.dart';
import '../../../fisio_design_system/fisio_design_system.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../../auth/bloc/auth_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'dynamic_links/generate_dynamic_link.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final bloc = Modular.get<AuthBloc>();

  String url = '';
  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  void initDynamicLinks() async {
    final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      handleDynamicLink(deepLink);
    }
    FirebaseDynamicLinks.instance.onLink(onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;

      if (deepLink != null) {
        handleDynamicLink(deepLink);
      }
    }, onError: (OnLinkErrorException e) async {
      debugPrint(e.message);
    });
  }

  handleDynamicLink(Uri url) {
    List<String> separatedString = [];
    separatedString.addAll(url.path.split('/'));
    if (separatedString[1] == 'home') {
      Modular.to.navigate('/home/');
      //* eu poderia passar o separatedString[2] caso minha homepage recebesse algum parametro que fosse recuperado pela navegaçao do modular
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => bloc.add(LogoutEvent()),
              icon: Icon(Icons.logout, color: FisioColors.red),
              tooltip: 'Fazer Logout',
            ),
            IconButton(
              onPressed: () {
                Modular.to.pushNamed('/home/youtube-player', forRoot: true);
              },
              icon: Icon(Icons.video_settings, color: FisioColors.primaryLightColor),
              tooltip: 'Ir para o player de vídeo',
            ),
            IconButton(
              onPressed: () {
                Modular.to.pushNamed('/home/youtube-player-list', forRoot: true);
              },
              icon: Icon(Icons.video_library_outlined, color: FisioColors.primaryLightColor),
              tooltip: 'Ver lista de vídeos',
            ),
            IconButton(
              onPressed: () {
                Modular.to.pushNamed('/home/photo-gallery', forRoot: true);
              },
              icon: Icon(Icons.photo_camera_back, color: FisioColors.primaryLightColor),
              tooltip: 'Ir para a galeria de fotos',
            ),
            Tooltip(
              message: 'Mudar tema do app',
              child: Switch(
                activeColor: FisioColors.primaryLightColor,
                value: context.theme.theme.value,
                onChanged: (_) async {
                  await context.theme.setThemeMode();
                  setState(() {});
                },
              ),
            ),
            Tooltip(
              message: 'Gerador de links dinamicos',
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    url = await Utils.buildDynamicLink();
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                  setState(() {});
                },
                child: const Text('Gerar Dynamic Link', style: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(height: 20),
            if (url.isNotEmpty)
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: url, style: const TextStyle(fontSize: 20)),
                      WidgetSpan(
                        child: IconButton(
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(text: url),
                            );
                          },
                          icon: const Icon(Icons.copy),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
