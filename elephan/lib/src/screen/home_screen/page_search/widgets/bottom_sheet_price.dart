import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

Container bottomSheetPrice(
    double min, double max, double? lower, double? upper) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 18),
    color: Colors.transparent,
    width: double.infinity,
    // height: 25,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Giá: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          FlutterSlider(
            tooltip: FlutterSliderTooltip(
                leftPrefix: const Icon(
                  Icons.attach_money,
                  size: 26,
                  color: Colors.white,
                ),
                rightSuffix: const Icon(
                  Icons.attach_money,
                  size: 26,
                  color: Colors.white,
                ),
                textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                boxStyle: FlutterSliderTooltipBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.redAccent.withOpacity(0.7)))),
            values: [min, max],
            rangeSlider: true,
            max: max,
            min: min,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              lower = lowerValue;
              upper = upperValue;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 48,
            margin: const EdgeInsets.symmetric(horizontal: 80),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
              onPressed: () {},
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tìm kiếm',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                    size: 19,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
