import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileWidget extends StatefulWidget {
  final Color? color;
  final String? name;
  final String? description;
  final String? image;
  final String? instagram;
  final String? linkedin;
  final String? email;

  const ProfileWidget(
      {this.color,
      this.name,
      this.description,
      this.image,
      this.instagram,
      this.linkedin,
      this.email});

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 5,
                  color: widget.color!,
                )),
            child: ClipOval(
              child: SizedBox(
                width: 90,
                height: 90,
                child: widget.image! == ''
                    ? Image.asset(
                        'assets/images/person.png',
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        widget.image!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.name!,
            style: GoogleFonts.nunito(
                color: widget.color!,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.description!,
            style: GoogleFonts.nunito(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //instagram
              widget.instagram! != ''
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _launchInBrowser(widget.instagram!);
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                            'https://conteudo.imguol.com.br/c/noticias/23/2016/05/11/novo-logo-do-instagram-1462967759537_1023x1024.jpg',
                          )),
                        ),
                        width: 50,
                        height: 50,
                      ))
                  : Container(),
              //linkedin
              widget.linkedin! != ''
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _launchInBrowser(widget.linkedin!);
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                            'https://img.flaticon.com/icons/png/512/174/174857.png?size=1200x630f&pad=10,10,10,10&ext=png&bg=FFFFFFFF',
                          )),
                        ),
                        width: 50,
                        height: 50,
                      ))
                  : Container(),
              //email
              widget.email! != ''
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _launchInBrowser(widget.email!);
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                            'https://neilpatel.com/wp-content/uploads/2017/09/8-Email-Personalization-Techniques-That-Work-Better-Than-The-Name-Game.jpg',
                          )),
                        ),
                        width: 50,
                        height: 50,
                      ))
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}
