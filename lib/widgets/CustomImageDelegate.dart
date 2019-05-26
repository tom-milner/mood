// Currently Zefyr depends on image_picker plugin to show camera or image gallery.
// (note that in future versions this may change so that users can choose their
// own plugin and define custom sources)
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zefyr/zefyr.dart';

class CustomImageDelegate implements ZefyrImageDelegate<ImageSource> {

  @override
  Future<String> pickImage(ImageSource source) async {
    final file = await ImagePicker.pickImage(
        source: source);
    if (file == null) return null;
    // We simply return the absolute path to selected file.
    return file.uri.toString();
  }

  @override
  Widget buildImage(BuildContext context, String imageSource) {

    final file = new File.fromUri(Uri.parse(imageSource));
    /// Create standard [FileImage] provider. If [imageSource] was an HTTP link
    /// we could use [NetworkImage] instead.
    final image = new FileImage(file);
    return new Image(image: image);

  }
}