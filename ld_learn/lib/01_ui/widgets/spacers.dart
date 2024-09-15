// Espaciadors simplificats entre widgets.
// createdAt: 24/07/18 dj. JIQ

import 'package:flutter/material.dart';

// Widget espaciador vertical.
class VerticalSpacer extends SizedBox {
  const VerticalSpacer({super.key, required double pHeight})
      : super(height: pHeight);
}

// Widget espaciador horitzontal.
class HorizontalSpacer extends SizedBox {
  const HorizontalSpacer({super.key, required double pWidth})
      : super(width: pWidth);
}
