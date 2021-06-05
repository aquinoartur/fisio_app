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
              accountName: Text("Nome do Usuário", style: GoogleFonts.nunito(),),
              accountEmail: Text("teste@email.com", style: GoogleFonts.nunito(),),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/person.png"),
                backgroundColor: Colors.white,
              ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              GestureDetector(
                onTap: (){},
                child: ListTile(
                  leading: Icon(Icons.person, size: 20, color: primaryColor,),
                  title: Text("Meus dados", style: GoogleFonts.nunito(color:primaryColor, fontSize: 16, fontWeight: FontWeight.w600),),
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: (){},
                child: ListTile(
                  title: Text("Favoritos", style: GoogleFonts.nunito(color:primaryColor, fontSize: 16, fontWeight: FontWeight.w600),),
                  leading: Icon(Icons.star, size: 20, color: primaryColor,),
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: (){},
                child: ListTile(
                  title: Text("Sobre o app", style: GoogleFonts.nunito(color:primaryColor, fontSize: 16, fontWeight: FontWeight.w600),),
                  leading: Icon(Icons.info, size: 20, color: primaryColor,),
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: (){},
                child: ListTile(
                  title: Text("Referências", style: GoogleFonts.nunito(color:primaryColor, fontSize: 16, fontWeight: FontWeight.w600),),
                  leading: Icon(Icons.collections_bookmark, size: 20, color: primaryColor,),
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: ListTile(
                  title: Text("Entrar/Sair", style: GoogleFonts.nunito(color:primaryColor, fontSize: 16, fontWeight: FontWeight.w600),),
                  leading: Icon(Icons.power_settings_new_outlined, size: 20, color: primaryColor,),
                ),
              ),
              Divider(),
            ],
          )
        ],
      ),

    );
  }
}
