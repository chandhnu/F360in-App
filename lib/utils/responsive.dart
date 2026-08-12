import 'package:flutter/material.dart';

enum DeviceType { phone, tablet, desktop }

class ResponsiveBreakpoints {
  static const phoneMaxWidth = 480.0;
  static const tabletMaxWidth = 1024.0;
}

class Responsive {
  final BuildContext context;
  late MediaQueryData _mediaQuery;

  Responsive(this.context) {
    _mediaQuery = MediaQuery.of(context);
  }

  DeviceType get deviceType {
    if (_mediaQuery.size.width < ResponsiveBreakpoints.phoneMaxWidth) {
      return DeviceType.phone;
    } else if (_mediaQuery.size.width < ResponsiveBreakpoints.tabletMaxWidth) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  bool get isPhone => deviceType == DeviceType.phone;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isDesktop => deviceType == DeviceType.desktop;
  bool get isPortrait => _mediaQuery.orientation == Orientation.portrait;
  bool get isLandscape => _mediaQuery.orientation == Orientation.landscape;

  double get screenWidth => _mediaQuery.size.width;
  double get screenHeight => _mediaQuery.size.height;
  double get statusBarHeight => _mediaQuery.padding.top;
  double get bottomPadding => _mediaQuery.padding.bottom;

  EdgeInsets get horizontalPadding {
    if (isPhone) return const EdgeInsets.symmetric(horizontal: 16);
    if (isTablet) return const EdgeInsets.symmetric(horizontal: 32);
    return const EdgeInsets.symmetric(horizontal: 48);
  }

  double get bodyFontSize => isPhone ? 14 : 16;
  double get headlineFontSize => isPhone ? 24 : 32;
  int get gridColumns => isPhone ? 1 : (isTablet ? 2 : 3);
}

extension ResponsiveExtension on BuildContext {
  Responsive get responsive => Responsive(this);
}
