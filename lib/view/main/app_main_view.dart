import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:furniture_app/core/constants/enums/durations_enum.dart';
import 'package:furniture_app/core/extension/context_extension.dart';
import 'package:furniture_app/core/init/localization/locale_keys.g.dart';
import 'package:furniture_app/view/basket/view/basket_view.dart';
import 'package:furniture_app/view/favorite/view/favorite_view.dart';
import 'package:furniture_app/view/home/view/home_view.dart';
import 'package:furniture_app/view/main/app_main_viewmodel.dart';

class AppMainView extends StatefulWidget {
  const AppMainView({Key? key}) : super(key: key);

  @override
  _AppMainViewState createState() => _AppMainViewState();
}

class _AppMainViewState extends State<AppMainView> {
  final pageController = PageController();
  final viewModel = AppMainViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: context.normalValue, horizontal: context.ultraLowValueWidth),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(flex: 1, child: buildAppBar(context)),
                Expanded(flex: 6, child: buildPageView()),
              ],
            ),
          ),
        ),
        bottomNavigationBar: buildBottomNavBar(context));
  }

  Row buildAppBar(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(),
        context.emptySpaceLowWidth,
        buildWelcomeAndNameText(),
        Expanded(
          child: buildNotificationIcon(),
        )
      ],
    );
  }

  Column buildWelcomeAndNameText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.welcome.tr()),
        Text('Ayberk Dikçinar'),
      ],
    );
  }

  Row buildNotificationIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.notification_important_outlined,
          color: context.theme.hoverColor,
        ),
      ],
    );
  }

  PageView buildPageView() {
    return PageView(
      onPageChanged: (value) {
        viewModel.setCurrent(value);
      },
      controller: pageController,
      children: [
        HomeView(),
        BasketView(),
        FavoriteView(),
        Text(LocaleKeys.notfound.tr()),
      ],
    );
  }

  Container buildBottomNavBar(BuildContext context) {
    return Container(
      height: context.ultraMediumValue,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: Observer(builder: (_) {
          return CupertinoTabBar(
            currentIndex: viewModel.current,
            activeColor: context.theme.highlightColor,
            backgroundColor: context.theme.accentColor,
            onTap: (value) {
              pageController.animateToPage(value, duration: DurationEnums.DURATIONLOW.rawwValue, curve: Curves.linearToEaseOut);
              //setState(() {});
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home)),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined)),
              BottomNavigationBarItem(icon: Icon(Icons.star_border_outlined)),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined)),
            ],
          );
        }),
      ),
    );
  }
}
