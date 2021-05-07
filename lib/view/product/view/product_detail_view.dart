import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:furniture_app/core/components/container/custom_container.dart';
import 'package:furniture_app/core/components/button/text_button_widget.dart';
import 'package:furniture_app/core/extension/context_extension.dart';
import 'package:furniture_app/core/init/localization/locale_keys.g.dart';
import 'package:furniture_app/view/basket/viewmodel/basket_viewmodel.dart';
import 'package:furniture_app/view/product/model/product_model.dart';
import 'package:furniture_app/view/product/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;
  const ProductDetailView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _productViewModel = ProductViewModel();

    return Material(
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: buildAppBar(context),
          body: Stack(
            children: [
              buildProductImageField(context),
              buildProductDetailBody(context, _productViewModel),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        LocaleKeys.detail_product.tr(),
        style: context.textTheme.headline6,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Positioned buildProductImageField(BuildContext context) {
    return Positioned(
      height: context.megaValue,
      child: buildTopImageContainer(context),
    );
  }

  Widget buildTopImageContainer(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.theme.shadowColor,
            context.theme.splashColor,
          ],
        ),
      ),
      child:
          Hero(tag: product.id!, child: Image.network(product.image ?? '', width: context.highValueWidth, height: context.highPlusValue, fit: BoxFit.contain)),
    );
  }

  Positioned buildProductDetailBody(BuildContext context, ProductViewModel viewmodel) {
    return Positioned(
        top: context.ultraValue,
        width: context.width,
        height: context.height - context.ultraValue,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(context.mediumValue)),
          child: buildBodyContainer(context, viewmodel),
        ));
  }

  Container buildBodyContainer(BuildContext context, ProductViewModel viewmodel) {
    return Container(
      padding: context.paddingLow,
      color: context.theme.cardColor,
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildRowDivider(context),
            context.emptySpaceLowHeight,
            Expanded(flex: 2, child: titleProductText(context)),
            pointAndCounterRow(context, viewmodel),
            Expanded(flex: 2, child: colorsRow(context)),
            Expanded(flex: 4, child: decriptionContainer(context)),
            context.emptySpaceLowHeight,
            priceProductText(viewmodel, context),
            Expanded(flex: 4, child: buildButtomRow(context, viewmodel)),
          ],
        ),
      ),
    );
  }

  Observer priceProductText(ProductViewModel viewmodel, BuildContext context) {
    return Observer(builder: (_) {
      return Text('\$${product.price! * viewmodel.count}', style: context.textTheme.headline2);
    });
  }

  Container decriptionContainer(BuildContext context) {
    return Container(
      child: Text(
        product.description ?? '',
        maxLines: 6,
        style: context.textTheme.caption,
      ),
    );
  }

  Text titleProductText(BuildContext context) {
    return Text(
      product.title ?? '',
      maxLines: 1,
      overflow: TextOverflow.clip,
      style: context.textTheme.headline2,
    );
  }

  Row pointAndCounterRow(BuildContext context, ProductViewModel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomContainer(
          color: context.theme.accentColor,
          height: context.mediumValue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.star, color: context.theme.dialogBackgroundColor, size: 18),
              Text(product.point.toString(), style: context.textTheme.headline1),
            ],
          ),
        ),
        Row(
          children: [
            removeButtonContainer(context, viewmodel),
            buildCounterValueContainer(context, viewmodel),
            addButtonContainer(context, viewmodel),
          ],
        ),
      ],
    );
  }

  Row colorsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(LocaleKeys.color.tr(), style: context.textTheme.headline2)),
        Expanded(
          flex: 2,
          child: colorsRowItems(),
        ),
        Expanded(child: Container()),
      ],
    );
  }

  Row colorsRowItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(backgroundColor: Color(0xFF397197), radius: 12),
        CircleAvatar(backgroundColor: Color(0xFF584F84), radius: 12),
        CircleAvatar(backgroundColor: Color(0xFF876A96), radius: 12),
        CircleAvatar(backgroundColor: Colors.black, radius: 12),
      ],
    );
  }

  CustomContainer removeButtonContainer(BuildContext context, ProductViewModel viewModel) {
    return CustomContainer(
        height: context.mediumValue,
        color: context.theme.hintColor,
        child: InkWell(
          onTap: () {
            viewModel.decreaseCount();
          },
          child: Icon(Icons.remove, color: context.theme.highlightColor),
        ));
  }

  CustomContainer buildCounterValueContainer(BuildContext context, ProductViewModel viewModel) => CustomContainer(
        color: context.theme.shadowColor,
        height: context.mediumValue,
        child: Padding(
          padding: context.paddingNormalHorizontal,
          child: Observer(builder: (_) {
            return Text(viewModel.count.toString(), style: context.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold));
          }),
        ),
      );

  CustomContainer addButtonContainer(BuildContext context, ProductViewModel viewModel) {
    return CustomContainer(
        height: context.mediumValue,
        color: context.theme.accentColor,
        child: InkWell(
          onTap: () {
            viewModel.incrementCount();
          },
          child: Icon(Icons.add, color: context.theme.highlightColor),
        ));
  }

  Row buildRowDivider(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [buildDivider(context)],
    );
  }

  Container buildDivider(BuildContext context) {
    return Container(
      width: context.highValue,
      child: Divider(thickness: context.ultraLowValue),
    );
  }

  Row buildButtomRow(BuildContext context, ProductViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(backgroundColor: context.theme.hoverColor, radius: 30),
        context.emptySpaceLowWidth,
        Expanded(child: buyButtonContainer(context)),
        context.emptySpaceLowWidth,
        Expanded(child: basketButtonContainer(context, viewModel)),
      ],
    );
  }

  Container buyButtonContainer(BuildContext context) {
    return Container(
      height: context.ultraMediumValue,
      width: context.highValueWidth,
      child: TexButtonWidget(
        textSize: 16,
        text: LocaleKeys.buy.tr(),
        onPressed: () {},
      ),
    );
  }

  Container basketButtonContainer(BuildContext context, ProductViewModel productViewModel) {
    return Container(
      height: context.ultraMediumValue,
      width: context.highValueWidth,
      child: TexButtonWidget(
        textSize: 16,
        text: LocaleKeys.add_to_Basket.tr(),
        onPressed: () {
          context.read<BasketViewModel>().addToBasket(product, productViewModel.count);
        },
      ),
    );
  }
}
