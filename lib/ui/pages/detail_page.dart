import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class DetailInforamtion extends StatelessWidget {
  final String title;
  final String data;
  final String info;
  final List<String> image;
  const DetailInforamtion(
      {super.key,
      required this.title,
      required this.data,
      required this.info,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 270,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Karla',
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (image.isNotEmpty)
                SizedBox(
                  height: 200,
                  child: FlutterCarousel(
                    options: CarouselOptions(
                      height: 200,
                      showIndicator: true,
                      slideIndicator: const CircularSlideIndicator(),
                    ),
                    items: image.map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.file(
                                File(imagePath),
                                fit: BoxFit.cover,
                                width: 1000,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              if (image.isNotEmpty) const SizedBox(height: 16),
              Text(
                data,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                info,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
