import 'package:flutter/services.dart';

const String channel = 'my_flutter_wallpaper';
const methodChannel = MethodChannel(channel);
const String setWallpaper = 'setWallpaper';
const String scanFile = 'scanFile';
const String shareImageToFacebook = 'shareImageToFacebook';
const String resizeImage = 'resizeImage';
