import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:furniture_app/core/components/button/text_button_widget.dart';
import 'package:furniture_app/core/extension/context_extension.dart';
import 'package:furniture_app/core/init/localization/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../viewmodel/basket_viewmodel.dart';

class BasketView extends StatelessWidget {
  const BasketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _basketViewModel = Provider.of<BasketViewModel>(context);
    return Scaffold(
      body: Observer(builder: (_) {
        return Column(
          children: [
            Expanded(child: buildListView(_basketViewModel)),
            _basketViewModel.total != 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(LocaleKeys.total_price.tr() + ': ' + _basketViewModel.total.toString()),
                      TexButtonWidget(onPressed: () {}, text: LocaleKeys.buy.tr()),
                    ],
                  )
                : Container()
          ],
        );
      }),
    );
  }

  ListView buildListView(BasketViewModel _basketViewModel) {
    return ListView.builder(
      itemCount: _basketViewModel.basketItems.length,
      itemBuilder: (context, index) {
        return buildItemCard(context, _basketViewModel, index);
      },
    );
  }

  Card buildItemCard(BuildContext context, BasketViewModel _basketViewModel, int index) {
    return Card(
      color: context.theme.shadowColor,
      child: buildItemListRow(context, _basketViewModel, index),
    );
  }

  Row buildItemListRow(BuildContext context, BasketViewModel _basketViewModel, int index) {
    var item = _basketViewModel.basketItems[index];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildPaddingItemImage(context, _basketViewModel, index),
        Text(item.product!.title ?? ''),
        Text(item.quantity.toString()),
        Column(
          children: [
            increaseCountInkWell(_basketViewModel, index, context),
            decreaseCountInkWell(_basketViewModel, index, context),
          ],
        ),
        Text((item.quantity! * item.product!.price!).toString()),
      ],
    );
  }

  InkWell increaseCountInkWell(BasketViewModel _basketViewModel, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        _basketViewModel.increaseCount(index);
      },
      child: CircleAvatar(
        backgroundColor: context.theme.dialogBackgroundColor,
        radius: 10,
        child: Icon(Icons.add, size: 18, color: context.theme.highlightColor),
      ),
    );
  }

  InkWell decreaseCountInkWell(BasketViewModel _basketViewModel, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        _basketViewModel.decreaseCount(index);
      },
      child: CircleAvatar(
        backgroundColor: context.theme.dialogBackgroundColor,
        radius: 10,
        child: Icon(Icons.remove, size: 18, color: context.theme.highlightColor),
      ),
    );
  }

  Padding buildPaddingItemImage(BuildContext context, BasketViewModel _basketViewModel, int index) {
    return Padding(
      padding: context.paddingLowVertical,
      child: buildCircleAvatarItem(_basketViewModel, index, context),
    );
  }

  CircleAvatar buildCircleAvatarItem(BasketViewModel _basketViewModel, int index, BuildContext context) {
    return CircleAvatar(
        backgroundImage: NetworkImage(_basketViewModel.basketItems[index].product!.image!),
        radius: context.mediumValue,
        backgroundColor: context.theme.highlightColor);
  }
}
