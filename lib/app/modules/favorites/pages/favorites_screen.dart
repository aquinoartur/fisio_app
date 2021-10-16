import 'package:animations/animations.dart';
import '../../../core/core.dart';
import 'package:flutter/material.dart';
import 'test_screen_favorites.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
  }

  final List items = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
  var text =
      'In porttitor dolor quis nibh lobortis, vel scelerisque elit condimentum. Nullam arcu nisl, feugiat facilisis posuere luctus, maximus sed quam. Fusce nec mi fringilla, vulputate ex non, tempus arcu. Etiam mauris dolor, sodales a volutpat vel, semper a velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse non ex vitae nisi faucibus iaculis. Nullam magna nisi, faucibus nec leo nec, ultricies viverra urna. Aliquam rhoncus augue id lorem iaculis, eu vehicula risus vestibulum.';
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, __) => const SizedBox(height: 8.0),
        itemBuilder: (context, index) => OpenContainer(
          openColor: Colors.transparent,
          closedColor: Colors.transparent,
          openElevation: 0,
          closedElevation: 0,
          transitionType: ContainerTransitionType.fade,
          transitionDuration: const Duration(milliseconds: 1200),
          closedBuilder: (context, VoidCallback callback) => GestureDetector(
            onTap: callback,
            child: cardTestWidget(
              //todo callback icon star
              color: primaryColor,
              name: 'teste',
              description: 'descrição',
              category: 'categoria',
              subcategory: 'subcategoria',
            ),
          ),
          openBuilder: (context, _) => TestScreenFavorites(
            texto: text,
            name: 'Nome do teste',
            images: const [
              'https://blog.estacio.br/wp-content/uploads/2020/03/original-c93e668eaa77559d1494507bdd5b117d-780x450.jpg',
              'https://blog.estacio.br/wp-content/uploads/2020/03/original-c93e668eaa77559d1494507bdd5b117d-780x450.jpg',
              'https://blog.estacio.br/wp-content/uploads/2020/03/original-c93e668eaa77559d1494507bdd5b117d-780x450.jpg',
            ],
          ),
        ),
        itemCount: items.length,
      ),
    );
  }
}
