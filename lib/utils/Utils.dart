import "package:flutter/material.dart";

class Utils {
  static darkenColor(Color color) {
    var oldWeights = [color.red, color.green, color.blue];
    var newWeights = [];
    int colorOffset = 80;

    oldWeights.forEach((weight) => newWeights.add((weight - colorOffset)));

    for (int i = 0; i < newWeights.length; i++) {
      if (newWeights[i] < 0) {
        newWeights[i] = 0;
      }
    }

    Color newColor =
        Color.fromRGBO(newWeights[0], newWeights[1], newWeights[2], 1);
    return newColor;
  }

  static lightenColor(Color color) {
    var oldWeights = [color.red, color.green, color.blue];
    var newWeights = [];
    int colorOffset = 80;

    oldWeights.forEach((weight) => newWeights.add((weight + colorOffset)));

    for (int i = 0; i < newWeights.length; i++) {
      if (newWeights[i] > 255) {
        newWeights[i] = 255;
      }
    }

    Color newColor =
        Color.fromRGBO(newWeights[0], newWeights[1], newWeights[2], 1);
    return newColor;
  }

  static bool boolFromInt(int boolInt) {
    bool flag = (boolInt==1)?true: false;
    return flag;
  }


  static int intFromBool(bool inputBool) {
    int outputInt = inputBool ? 1 : 0;
    return outputInt;
  }
}
