import 'package:flutter/material.dart';

import 'image_app_detail_effect_dialog.dart';

class ImageAppDetailEffectMenuItem extends StatefulWidget {
  final _ImageAppDetailEffectMenuItemState _state;

  ImageAppDetailEffectMenuItem(checkGrayscale, checkBlur, blurValue)
      : _state = _ImageAppDetailEffectMenuItemState(
            checkGrayscale, checkBlur, blurValue);

  @override
  _ImageAppDetailEffectMenuItemState createState() => _state;
}

class _ImageAppDetailEffectMenuItemState
    extends State<ImageAppDetailEffectMenuItem> {
  final bool _checkGrayscale;
  final bool _checkBlur;
  final double _blurValue;

  _ImageAppDetailEffectMenuItemState(
      this._checkGrayscale, this._checkBlur, this._blurValue);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Icon(
              Icons.format_paint,
              color: Colors.black,
            ),
            const SizedBox(
              width: 20,
            ),
            const Text("Effect")
          ]),
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => ImageAppDetailEffectDialog(
                _checkGrayscale, _checkBlur, _blurValue));
      },
    );
  }
}
