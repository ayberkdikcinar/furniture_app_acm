import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/components/button/text_button_widget.dart';

import 'package:furniture_app/core/init/localization/locale_keys.g.dart';
import 'package:furniture_app/view/favorite/viewmodel/favorite_viewmodel.dart';
import 'package:provider/provider.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _viewModel = Provider.of<FavoriteViewModel>(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: _viewModel.favorites.length,
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  _viewModel.favorites[index].image ?? '',
                  height: 100,
                  width: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_viewModel.favorites[index].title ?? ''),
                    Text('Price: ' + _viewModel.favorites[index].price.toString()),
                    Text('Color: Red'),
                    Text('Point: ' + _viewModel.favorites[index].point.toString()),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PopupMenuButton(
                      onSelected: (value) {
                        _viewModel.removeFromFavorite(_viewModel.favorites[index]);
                        //print(value);
                      },
                      itemBuilder: (context) {
                        return _viewModel.choices.map((e) => PopupMenuItem(value: e, child: Text(e))).toList();
                      },
                    ),
                    TexButtonWidget(onPressed: () {}, text: LocaleKeys.add_to_cart.tr())
                  ],
                ),
              ],
            ),
          ));
          //return Text(_viewModel.favorites[index].title ?? '');
        },
      ),
    );
  }
}
