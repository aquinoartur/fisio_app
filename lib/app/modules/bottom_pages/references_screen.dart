import '../../design_system/colors_palette/colors_palette.dart';
import '../../design_system/text_styles/text_styles.dart';
import '../../widgets/title_t1_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class ReferencesScreen extends StatefulWidget {
  const ReferencesScreen({Key? key}) : super(key: key);

  @override
  State<ReferencesScreen> createState() => _ReferencesScreenState();
}

class _ReferencesScreenState extends State<ReferencesScreen> {
  @override
  void initState() {
    super.initState();
  }

  final List items = [
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Card(
              child: Row(
            children: [
              Expanded(
                child: titleT1Widget(
                    'Saiba mais sobre os idealizadores do projeto',
                    TextStyles.title1.copyWith(fontSize: 14)),
              ),
              IconButton(
                onPressed: () => Modular.to.pushNamed('/about'),
                icon: Icon(
                  Icons.chevron_right,
                  color: FisioColorsPalette.darkGrey,
                ),
              ),
            ],
          )),
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => const ReferencesCarWidget(),
            separatorBuilder: (_, __) => const SizedBox(height: 8.0),
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}

class ReferencesCarWidget extends StatelessWidget {
  const ReferencesCarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    return Card(
      shape: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'AUTOR 1, A. A. | AUTOR 2, A. A.',
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.search,
                    size: 22,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            const Divider(height: 5, color: Colors.white),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'O título do livro ficará aqui',
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Text(
                    'editora',
                    style: GoogleFonts.nunito(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8.0),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Text(
                    'ano',
                    style: GoogleFonts.nunito(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
