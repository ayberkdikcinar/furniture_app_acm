import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:furniture_app/core/components/button/custom_category_button.dart';
import 'package:furniture_app/core/components/button/like_button.dart';
import 'package:furniture_app/core/components/container/custom_container.dart';
import 'package:furniture_app/core/components/button/text_button_widget.dart';
import 'package:furniture_app/core/components/text/text_field_search.dart';
import 'package:furniture_app/core/constants/app/app_constants.dart';
import 'package:furniture_app/core/constants/navigation/navigation_constants.dart';
import 'package:furniture_app/core/extension/context_extension.dart';
import 'package:furniture_app/core/init/localization/locale_keys.g.dart';
import 'package:furniture_app/core/init/navigation/navigation_service.dart';
import 'package:furniture_app/service/product_service.dart';
import 'package:furniture_app/view/basket/viewmodel/basket_viewmodel.dart';
import 'package:furniture_app/view/favorite/viewmodel/favorite_viewmodel.dart';
import 'package:furniture_app/view/home/viewmodel/home_viewmodel.dart';
import 'package:furniture_app/view/product/model/product_model.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeViewModel = HomeViewModel();
    final productDatabaseProvider = ProductDatabaseProvider.instance;
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 5, child: buildSearchBar(context)),
            Expanded(flex: 1, child: buildSettingsIcon()),
          ],
        ),
        buildCatagoryHorizontalView(context, productDatabaseProvider!),
        Expanded(child: buildGridView(context, homeViewModel)),
      ],
    );
  }

  Padding buildCatagoryHorizontalView(BuildContext context, ProductDatabaseProvider productDatabaseProvider) {
    return Padding(
      padding: context.paddingNormalVertical,
      child: Container(
        height: context.mediumValue,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TextButtonCustom(
              onPressed: () {},
            );
          },
        ),
      ),
    );
  }

  Widget buildGridView(BuildContext context, HomeViewModel viewModel) {
    //print('prdo list len' + viewModel.productList.length.toString());
    return Observer(builder: (_) {
      if (viewModel.state == ViewState.Busy) {
        return Center(child: CircularProgressIndicator());
      }
      return GridView.count(
        childAspectRatio: 2 / 3,
        crossAxisCount: 2,
        children: List.generate(viewModel.productList.length, (index) {
          return InkWell(
            onTap: () {
              NavigationService.instance.navigateToPage(path: NavigationConstants.PRODUCT_DETAIL_VIEW, object: viewModel.productList[index]);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.normalValue),
              ),
              child: columnCardContent(context, viewModel.productList[index]),
            ),
          );
        }),
      );
    });
  }

  Column columnCardContent(BuildContext context, Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 6,
          child: Stack(
            alignment: Alignment.center,
            children: [
              positionedBacgroundContainer(context),
              positionedProductImage(product.image ?? '', product.id!, context),
              positionedFavoruiteIcon(context, product),
            ],
          ),
        ),
        Expanded(child: paddingProductNameText(context, product.title ?? '')),
        paddingCostText(context, product.price.toString()),
        Expanded(
          child: starPointContainer(context, product.point.toString()),
        ),
        Expanded(
          flex: 2,
          child: buyButtonRow(context, product),
        )
      ],
    );
  }

  Positioned positionedBacgroundContainer(BuildContext context) {
    return Positioned(
        child: Container(
      margin: context.paddingNormal,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(context.normalValue), color: context.theme.backgroundColor),
    ));
  }

  Positioned positionedProductImage(String image, String id, BuildContext context) {
    return Positioned(
      child: Hero(tag: id, child: Image.network(image, width: context.highValueWidth, height: context.highValue, fit: BoxFit.contain)),
    );
  }

  Positioned positionedFavoruiteIcon(BuildContext context, Product product) => Positioned(
        right: 15,
        top: 15,
        child: CircleAvatar(
            radius: 15,
            backgroundColor: context.theme.highlightColor,
            child: CustomLikeButton(
              initState: context.read<FavoriteViewModel>().isInclude(product),

              /// eğer favorilerdeyse init state true olur.
              onLikeTap: (value) {
                if (value == true) {
                  print('liked');
                  context.read<FavoriteViewModel>().addToFavorite(product);
                } else {
                  context.read<FavoriteViewModel>().removeFromFavorite(product);
                  print('unliked');
                }
              },
            )),
      );

  Padding paddingProductNameText(BuildContext context, String title) {
    return Padding(
      padding: context.paddingOnlyLeft(context.normalValue),
      child: Text(
        title,
        overflow: TextOverflow.clip,
        maxLines: 1,
        style: context.textTheme.headline6,
      ),
    );
  }

  Padding paddingCostText(BuildContext context, String price) {
    return Padding(
      padding: context.paddingOnlyLeft(context.normalValue),
      child: Text('\$$price', style: context.textTheme.bodyText1),
    );
  }

  CustomContainer starPointContainer(BuildContext context, String point) {
    return CustomContainer(
      child: Row(
        children: [
          Expanded(
              child: Icon(
            Icons.star,
            size: 20,
            color: context.theme.dialogBackgroundColor,
          )),
          context.emptySpaceLowWidth,
          Expanded(child: Text('$point')),
          Expanded(flex: 4, child: Container()),
        ],
      ),
    );
  }

  Row buyButtonRow(BuildContext context, Product product) {
    return Row(
      children: [
        Expanded(
          child: paddingBuyButton(context, product),
        ),
      ],
    );
  }

  Padding paddingBuyButton(BuildContext context, Product product) {
    return Padding(
      padding: context.paddingLowHorizontal,
      child: TexButtonWidget(
        text: LocaleKeys.add_to_cart.tr(),
        onPressed: () {
          context.read<BasketViewModel>().addToBasket(product, 1);
        },
      ),
    );
  }

  Widget buildSearchBar(BuildContext context) {
    return CustomContainer(
      height: context.mediumValue,
      child: buildTextFieldSearch(context),
    );
  }

  TextFieldSearch buildTextFieldSearch(BuildContext context) {
    return TextFieldSearch(
      borderRadius: context.lowValue,
      prefixIcon: Icons.search,
      hintText: LocaleKeys.homeSearch.tr(),
      backgrounColor: context.theme.highlightColor,
    );
  }
}

///
////
///
///
///
class buildSettingsIcon extends StatelessWidget {
  const buildSettingsIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomContainer(
          height: context.mediumValue,
          color: context.theme.highlightColor,
          child: Icon(Icons.settings, color: context.theme.canvasColor),
        ),
      ],
    );
  }
}
