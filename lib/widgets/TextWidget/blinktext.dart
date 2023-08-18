import 'dart:async';

import 'package:flutter/material.dart';
class BlinkText extends StatefulWidget {
  final String _target;
  const BlinkText(this._target, {Key? key}) : super(key: key);
  @override
  _BlinkTextState createState() => _BlinkTextState();
}

class _BlinkTextState extends State<BlinkText> {
  bool _show = true;
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      setState(() => _show = !_show);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Text(widget._target,
      style: _show
          ? const TextStyle( fontWeight: FontWeight.bold)
          : const TextStyle(color: Colors.transparent));

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
