import 'dart:io';
import 'package:flutter/material.dart';

class CollageScreen extends StatelessWidget {
  final List<String> images;
  const CollageScreen({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Polaroid Collage")),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 4),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, blurRadius: 8, spreadRadius: 2),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: images.map((img) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.file(File(img), fit: BoxFit.cover),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text(
                        "My Memories 💖",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
