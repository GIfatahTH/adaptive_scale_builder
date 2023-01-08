import 'package:flutter/material.dart';

import '../adaptive_scale_builder.dart';
import 'fitted_box_render.dart';

class Resize {
  late final Widget _child;
  final bool _fitTheShortestSide, _shouldExpand;
  final int? _flex;

  static double ofAdaptive(BuildContext context) {
    final inheritedWidth = InheritedLayout.of(context).width / adaptiveWidth;
    return inheritedWidth;
  }

  Resize({
    required Widget child,
    required int? flex,
    required bool fitTheShortestSide,
    bool shouldExpand = false,
  })  : _flex = flex,
        _fitTheShortestSide = fitTheShortestSide,
        _shouldExpand = shouldExpand {
    // if (child is Flex) {
    //   _child = child
    //     ..children.add(
    //       child.direction == Axis.vertical
    //           ? const SizedBox(
    //               width: double.infinity,
    //             )
    //           : const SizedBox(height: double.infinity),
    //     );
    // } else {
    //   _child = child;
    // }
    _child = child;
  }

  static double adaptiveWidth = 500;
  // Widget adaptiveTest1({double? width, double? height}) {
  //   final widget = Builder(builder: (context) {
  //     final inheritedWidth = InheritedLayout.of(context).width / adaptiveWidth;

  //     return MyFittedBox(
  //       width: width != null ? width * inheritedWidth : null,
  //       height: height != null ? height * inheritedWidth : null,
  //       fitTheShortestSide: _fitTheShortestSide,
  //       child: _child,
  //     );
  //   });
  //   if (_flex != null) {
  //     return Flexible(
  //       flex: _flex ?? 1,
  //       fit: _shouldExpand ? FlexFit.tight : FlexFit.loose,
  //       child: widget,
  //     );
  //   }
  //   return widget;
  // }

  Widget adaptive([double? scale]) {
    final widget = Builder(
      builder: (context) {
        final inheritedWidth =
            InheritedLayout.of(context).width / adaptiveWidth;

        return MyFittedBox(
          width: null,
          height: null,
          fitTheShortestSide: _fitTheShortestSide,
          inheritedFraction: inheritedWidth * (scale ?? 1),
          child: _child,
        );
      },
    );
    if (_flex != null) {
      return Flexible(
        flex: _flex ?? 1,
        fit: _shouldExpand ? FlexFit.tight : FlexFit.loose,
        child: widget,
      );
    }
    return widget;
  }

//   Widget fixedTest({double? width, double? height}) {
//     // if (_child is Flex) {
//     //   return SizedBox(
//     //     width: width,
//     //     height: height,
//     //     child: _child,
//     //   );
//     // }
//     final widget = MyFittedBox(
//       width: width,
//       height: height,
//       fitTheShortestSide: _fitTheShortestSide,
//       child: _child,
//       // inheritedFraction: null,
//     );
//     if (_flex != null) {
//       return Flexible(
//         flex: _flex ?? 1,
//         fit: _shouldExpand ? FlexFit.tight : FlexFit.loose,
//         child: widget,
//       );
//     }
//     return widget;
//   }

//   Widget fixed({double? width, double? height}) {
//     // if (_child is Flex) {
//     //   return SizedBox(
//     //     width: width,
//     //     height: height,
//     //     child: _child,
//     //   );
//     // }
//     final widget = MyFittedBox(
//       width: width,
//       height: height,
//       fitTheShortestSide: _fitTheShortestSide,
//       child: _child,
//     );
//     if (_flex != null) {
//       return Flexible(
//         flex: _flex ?? 1,
//         fit: _shouldExpand ? FlexFit.tight : FlexFit.loose,
//         child: widget,
//       );
//     }
//     return widget;
//   }
// // Sizer climp(double? min, double?max){

// //   return
// // }
//   Widget fromEffectiveWidth(double? widthFraction, double? heightFraction) {
//     // assert(widthFraction == null || widthFraction >= 0 && widthFraction <= 1);
//     // assert(
//     //     heightFraction == null || heightFraction >= 0 && heightFraction <= 1);
//     final widget = Builder(builder: (context) {
//       final inheritedWidth = InheritedLayout.of(context).width;
//       print('inheritedWidth: $inheritedWidth');
//       return InheritedLayout(
//         inheritedWidth: inheritedWidth * (widthFraction ?? 1),
//         builder: (context, size) {
//           return MyFittedBox(
//             width:
//                 widthFraction != null ? inheritedWidth * widthFraction : null,
//             height:
//                 heightFraction != null ? inheritedWidth * heightFraction : null,
//             fitTheShortestSide: _fitTheShortestSide,
//             child: _child,
//           );
//         },
//       );
//     });

//     if (_flex != null) {
//       return Flexible(
//         flex: _flex ?? 1,
//         child: widget,
//       );
//     }
//     return widget;
//   }

//   _FromDevice get fromDevice => _FromDevice(
//         child: _child,
//         flex: _flex,
//         fitTheShortestSide: _fitTheShortestSide,
//       );
//   _FromParent get fromParent => _FromParent(
//         child: _child,
//         flex: _flex,
//         fitTheShortestSide: _fitTheShortestSide,
//       );
}

// class _FromDevice {
//   final Widget _child;
//   final bool _fitTheShortestSide;
//   final int? _flex;
//   const _FromDevice({
//     required Widget child,
//     required int? flex,
//     required bool fitTheShortestSide,
//   })  : _flex = flex,
//         _child = child,
//         _fitTheShortestSide = fitTheShortestSide;

//   Widget width({double? width, double? height}) {
//     assert(width == null || width >= 0 && width <= 1);
//     assert(height == null || height >= 0 && height <= 1);
//     final widget = Builder(builder: (context) {
//       final deviceWidth = MediaQuery.of(context).size.width;
//       return MyFittedBox(
//         width: width != null ? deviceWidth * width : null,
//         height: height != null ? deviceWidth * height : null,
//         fitTheShortestSide: _fitTheShortestSide,
//         child: _child,
//       );
//     });

//     if (_flex != null) {
//       return Flexible(
//         flex: _flex ?? 1,
//         child: widget,
//       );
//     }
//     return widget;
//   }

//   Widget height({double? width, double? height}) {
//     assert(width == null || width >= 0 && width <= 1);
//     assert(height == null || height >= 0 && height <= 1);
//     final widget = Builder(builder: (context) {
//       final deviceHeight = MediaQuery.of(context).size.height;
//       return MyFittedBox(
//         width: width != null ? deviceHeight * width : null,
//         height: height != null ? deviceHeight * height : null,
//         fitTheShortestSide: _fitTheShortestSide,
//         child: _child,
//       );
//     });
//     if (_flex != null) {
//       return Flexible(
//         flex: _flex ?? 1,
//         child: widget,
//       );
//     }
//     return widget;
//   }

//   Widget widthAndHeight({double? width, double? height}) {
//     assert(width == null || width >= 0 && width <= 1);
//     assert(height == null || height >= 0 && height <= 1);
//     final widget = Builder(builder: (context) {
//       final deviceWidth = MediaQuery.of(context).size.width;
//       final deviceHeight = MediaQuery.of(context).size.height;
//       return MyFittedBox(
//         width: width != null ? deviceWidth * width : null,
//         height: height != null ? deviceHeight * height : null,
//         fitTheShortestSide: _fitTheShortestSide,
//         child: _child,
//       );
//     });
//     if (_flex != null) {
//       return Flexible(
//         flex: _flex ?? 1,
//         child: widget,
//       );
//     }
//     return widget;
//   }
// }

// class _FromParent {
//   final Widget _child;
//   final bool _fitTheShortestSide;
//   final int? _flex;
//   const _FromParent({
//     required Widget child,
//     required int? flex,
//     required bool fitTheShortestSide,
//   })  : _flex = flex,
//         _child = child,
//         _fitTheShortestSide = fitTheShortestSide;
//   Widget height({double? width, double? height}) {
//     // assert(width == null || width >= 0 && width <= 1);
//     // assert(height == null || height >= 0 && height <= 1);
//     final widget = LayoutBuilder(builder: (context, constraints) {
//       final parentHeight = constraints.maxHeight;
//       return MyFittedBox(
//         width: width != null ? parentHeight * width : null,
//         height: height != null ? parentHeight * height : null,
//         fitTheShortestSide: _fitTheShortestSide,
//         child: _child,
//       );
//     });

//     if (_flex != null) {
//       return Flexible(
//         flex: _flex ?? 1,
//         child: widget,
//       );
//     }
//     return widget;
//   }

//   Widget width({double? width, double? height}) {
//     // assert(width == null || width >= 0 && width <= 1);
//     // assert(height == null || height >= 0 && height <= 1);
//     final widget = LayoutBuilder(builder: (context, constraints) {
//       final parentWidth = constraints.maxWidth;
//       return MyFittedBox(
//         width: width != null ? parentWidth * width : null,
//         height: height != null ? parentWidth * height : null,
//         fitTheShortestSide: _fitTheShortestSide,
//         child: _child,
//       );
//     });

//     if (_flex != null) {
//       return Flexible(
//         flex: _flex ?? 1,
//         child: widget,
//       );
//     }
//     return widget;
//   }
// }

extension WidgetX on Widget {
  // // if it Flex widget  it is better to set fitTheShortestSide to false
  // Resize resize({bool fitTheShortestSide = true}) =>
  //     Resize(child: this, fitTheShortestSide: fitTheShortestSide, flex: null);
  Widget resizeAdaptive([double? scale]) =>
      Resize(child: this, fitTheShortestSide: true, flex: null).adaptive(scale);

  // Widget adaptiveResize(
  //         {bool fitTheShortestSide = true, double? width, double? height}) =>
  //     Resize(child: this, fitTheShortestSide: fitTheShortestSide, flex: null)
  //         .adaptiveTest1(width: width, height: height);

  // Widget adaptiveFlexResize(
  //         {bool fitTheShortestSide = true,
  //         int flex = 1,
  //         double? width,
  //         double? height}) =>
  //     Resize(child: this, fitTheShortestSide: fitTheShortestSide, flex: flex)
  //         .adaptiveTest1(width: width, height: height);

  // /// This should be the first child of a Flex widget (Column or Row)
  // /// Text('').resizeWithFlex().fixed().padding is not allowed
  // Resize resizeWithFlex({
  //   bool fitTheShortestSide = true,
  //   double flex = 1,
  //   bool shouldExpand = false,
  // }) =>
  //     Resize(
  //       child: this,
  //       fitTheShortestSide: fitTheShortestSide,
  //       flex: (flex * 10).toInt(),
  //       shouldExpand: shouldExpand,
  //     );
}
