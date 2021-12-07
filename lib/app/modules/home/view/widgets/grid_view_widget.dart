import 'package:fisio_app/app/core/blocs/home_screen_bloc.dart';
import 'package:fisio_app/app/core/blocs/home_screen_state.dart';
import 'package:fisio_app/app/core/widgets/card_info_widget.dart';
import 'package:fisio_app/app/modules/home/home_controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  final _controller = HomeScreenController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeBlocSate>(
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: _controller.gridDelegate,
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: state.documents.length,
          itemBuilder: (context, index) {
            return CardInfo(state.documents[index]);
          },
        );
      },
    );
  }
}
