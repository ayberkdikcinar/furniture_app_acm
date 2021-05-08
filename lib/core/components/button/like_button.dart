import 'package:flutter/material.dart';

class CustomLikeButton extends StatefulWidget {
  final bool initState;
  final Function(bool value) onLikeTap;
  CustomLikeButton({Key? key, required this.onLikeTap, required this.initState}) : super(key: key);

  @override
  _CustomLikeButtonState createState() => _CustomLikeButtonState();
}

class _CustomLikeButtonState extends State<CustomLikeButton> {
  bool like_state = false;
  @override
  void initState() {
    if (widget.initState == true) {
      like_state = true;
    } else {
      like_state = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        like_state = !like_state;
        widget.onLikeTap(like_state);
        setState(() {});
      },
      child: like_state == false ? Icon(Icons.favorite_border) : Icon(Icons.favorite, color: Colors.red),
    );
  }
}
