import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Offset offset;
  final bool dismissible;
  final Widget child;

  Loader({
    Key key,
    @required this.inAsyncCall,
    this.opacity = 0.6,
    this.color = Colors.black,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset,
    this.dismissible = false,
    @required this.child,
  })  : assert(child != null),
        assert(inAsyncCall != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (inAsyncCall) {
      Widget layOutProgressIndicator;
      if (offset == null)
        layOutProgressIndicator = Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  color: Theme.of(context).primaryColor.withAlpha(50),
                  offset: Offset(0, 0),
                )
              ],
            ),
            child: SpinKitRipple(
              color: Theme.of(context).primaryColor,
              size: 50.0,
            ),
          ),
        );
      else {
        layOutProgressIndicator = Positioned(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              // color: Colors.white,
            ),
            child: SpinKitDoubleBounce(
              color: Colors.white,
              size: 50.0,
            ),
          ),
          left: offset.dx,
          top: offset.dy,
        );
      }
      final modal = [
        new Opacity(
          child: new ModalBarrier(dismissible: dismissible, color: color),
          opacity: opacity,
        ),
        layOutProgressIndicator
      ];
      widgetList += modal;
    }
    return new Stack(
      children: widgetList,
    );
  }
}
