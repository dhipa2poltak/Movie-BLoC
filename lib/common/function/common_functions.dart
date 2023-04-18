
import 'package:flutter/services.dart';

void enterFullScreen() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

void exitFullScreen() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
}
