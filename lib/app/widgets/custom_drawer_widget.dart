import 'tile_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Nome do Usuário',
              style: GoogleFonts.nunito(),
            ),
            accountEmail: Text(
              'teste@email.com',
              style: GoogleFonts.nunito(),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/person.png'),
              backgroundColor: Colors.white,
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/my_data');
                },
                child: tileDrawer(
                    color: primaryColor,
                    string: 'Meus dados',
                    icon: Icons.person),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/favorites');
                },
                child: tileDrawer(
                    color: primaryColor,
                    string: 'Meus favoritos',
                    icon: Icons.star),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/about_app');
                },
                child: tileDrawer(
                    color: primaryColor,
                    string: 'Sobre o app',
                    icon: Icons.info),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/references');
                },
                child: tileDrawer(
                    color: primaryColor,
                    string: 'Referências',
                    icon: Icons.collections_bookmark),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: tileDrawer(
                    color: primaryColor,
                    string: 'Entrar/Sair',
                    icon: Icons.power_settings_new_outlined),
              ),
            ],
          )
        ],
      ),
    );
  }
}
