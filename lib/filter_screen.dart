// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_image_filters/flutter_image_filters.dart';

// class FilterScreen extends StatefulWidget {
//   final String imagePath;
//   final Function(String) onImageFiltered;
//   const FilterScreen(
//       {Key? key, required this.imagePath, required this.onImageFiltered})
//       : super(key: key);

//   @override
//   _FilterScreenState createState() => _FilterScreenState();
// }

// class _FilterScreenState extends State<FilterScreen> {
//   late Filter _selectedFilter;

//   @override
//   void initState() {
//     super.initState();
//     _selectedFilter = Filter.noFilter();
//   }

//   void _applyFilter() async {
//     final filteredImage = await _selectedFilter.apply(File(widget.imagePath));
//     widget.onImageFiltered(filteredImage.path);
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Apply Filter")),
//       body: Column(
//         children: [
//           Expanded(child: Image.file(File(widget.imagePath))),
//           DropdownButton<Filter>(
//             value: _selectedFilter,
//             items: [
//               DropdownMenuItem(
//                   value: Filter.noFilter(), child: Text("No Filter")),
//               DropdownMenuItem(value: Filter.sepia(), child: Text("Sepia")),
//               DropdownMenuItem(
//                   value: Filter.grayscale(), child: Text("Grayscale")),
//             ],
//             onChanged: (filter) {
//               if (filter != null) {
//                 setState(() {
//                   _selectedFilter = filter;
//                 });
//               }
//             },
//           ),
//           ElevatedButton(onPressed: _applyFilter, child: Text("Apply Filter"))
//         ],
//       ),
//     );
//   }
// }
