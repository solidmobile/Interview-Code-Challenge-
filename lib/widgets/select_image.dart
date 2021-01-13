import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


class SelectedImage extends StatelessWidget {

  const SelectedImage({
    Key key,
    this.size : 80.0,
    this.onTap,
    this.image
  }): super(key: key);

  final double size;
  final GestureTapCallback onTap;
  final File image;
  
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '选择图片',
      hint: '跳转相册选择图片',
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            
            image: DecorationImage(
              image: image == null ? AssetImage("assets/images/icon_zj.png") : FileImage(image),
              fit: BoxFit.cover,
              //colorFilter: image == null ? ColorFilter.mode(ThemeUtils.getDarkColor(context, Colours.dark_unselected_item_color), BlendMode.srcIn) : null
            ),
          ),
        ).cornerRadiusWithClipRRect(100),
      ),
    );
  }
}