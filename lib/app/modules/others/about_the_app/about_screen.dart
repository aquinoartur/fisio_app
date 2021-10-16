import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<String> names = [];
  List<String> descriptions = [];
  List<String> images = [];
  List<String> instagram = [];
  List<String> linkedin = [];
  List<String> email = [];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Idealizadores',
          style: GoogleFonts.nunito(fontSize: 18, color: primaryColor),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryColor),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('contributors').orderBy('pos').get(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return LoadingIndicatorWidget(
                color: primaryColor,
                size: 20.0,
              );
            default:
              List<DocumentSnapshot> docs = snapshot.data!.docs.toList();
              for (var doc in docs) {
                names.add(doc['name']);
                descriptions.add(doc['description']);
                images.add(doc['image']);
                instagram.add(doc['instagram']);
                linkedin.add(doc['linkedin']);
                email.add('mailto:' + doc['email']);
              }
              return Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => const SizedBox(height: 15),
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          return ProfileWidget(
                            color: primaryColor,
                            name: names[index],
                            description: descriptions[index],
                            instagram: instagram[index],
                            linkedin: linkedin[index],
                            email: email[index],
                            image: images[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
