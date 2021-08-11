// import 'package:flutter/material.dart';

// class NoteFormWidget extends StatelessWidget {
//   // final bool? isImportant;
//   // final int? number;

//   final String title;
//   final String description;
//   // final ValueChanged<bool> onChangedImportant;
//   // final ValueChanged<int> onChangedNumber;
//   final ValueChanged<String> onChangedTitle;
//   final ValueChanged<String> onChangedDescription;

//   const NoteFormWidget({
//     Key key,
//     // this.isImportant = false,
//     // this.number = 0,

//     this.title = '',
//     this.description = '',
//     // required this.onChangedImportant,
//     // required this.onChangedNumber,
//     this.onChangedTitle,
//     this.onChangedDescription,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String _value1;
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               buildTitle(),
//               SizedBox(height: 10),
//               buildDescription(),
//               SizedBox(height: 10),
//               buildmobileno(),
//               SizedBox(height: 10),
//               buildemail(),
//               SizedBox(height: 10),
//               buildaddress(),
//               SizedBox(height: 10),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTitle() => TextFormField(
//         maxLines: 1,
//         initialValue: title,
//         decoration: InputDecoration(
//           hintText: 'First Name',
//           hintStyle: TextStyle(color: Colors.grey),
//           filled: true,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(12.0)),
//             borderSide: BorderSide(color: Colors.blue, width: 2),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             borderSide: BorderSide(color: Colors.blue),
//           ),
//         ),
//         validator: (title) => title != null && title.isEmpty
//             ? 'The First Name cannot be empty'
//             : null,
//         onChanged: onChangedTitle,
//       );

//   Widget buildDescription() => TextFormField(
//         maxLines: 1,
//         initialValue: description,
//         style: TextStyle(color: Colors.white60, fontSize: 18),
//         decoration: InputDecoration(
//           hintText: 'Last Name',
//           hintStyle: TextStyle(color: Colors.grey),
//           filled: true,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(12.0)),
//             borderSide: BorderSide(color: Colors.blue, width: 2),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             borderSide: BorderSide(color: Colors.blue),
//           ),
//         ),
//         validator: (title) => title != null && title.isEmpty
//             ? 'The Last Name cannot be empty'
//             : null,
//         onChanged: onChangedDescription,
//       );

//   Widget buildmobileno() => TextFormField(
//         maxLines: 1,
//         initialValue: description,
//         style: TextStyle(color: Colors.white60, fontSize: 18),
//         decoration: InputDecoration(
//           hintText: 'Mobile Number',
//           hintStyle: TextStyle(color: Colors.grey),
//           filled: true,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(12.0)),
//             borderSide: BorderSide(color: Colors.blue, width: 2),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             borderSide: BorderSide(color: Colors.blue),
//           ),
//         ),
//         validator: (title) => title != null && title.isEmpty
//             ? 'The Mobile Number cannot be empty'
//             : null,
//         onChanged: onChangedDescription,
//       );
//   Widget buildemail() => TextFormField(
//         maxLines: 1,
//         initialValue: description,
//         style: TextStyle(color: Colors.white60, fontSize: 18),
//         decoration: InputDecoration(
//           hintText: 'Email Address',
//           hintStyle: TextStyle(color: Colors.grey),
//           filled: true,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(12.0)),
//             borderSide: BorderSide(color: Colors.blue, width: 2),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             borderSide: BorderSide(color: Colors.blue),
//           ),
//         ),
//         validator: (title) => title != null && title.isEmpty
//             ? 'The Email Address cannot be empty'
//             : null,
//         onChanged: onChangedDescription,
//       );
//   Widget buildaddress() => TextFormField(
//         maxLines: 3,
//         initialValue: description,
//         style: TextStyle(color: Colors.white60, fontSize: 18),
//         decoration: InputDecoration(
//           hintText: 'Address',
//           hintStyle: TextStyle(color: Colors.grey),
//           filled: true,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(12.0)),
//             borderSide: BorderSide(color: Colors.blue, width: 2),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             borderSide: BorderSide(color: Colors.blue),
//           ),
//         ),
//         validator: (title) => title != null && title.isEmpty
//             ? 'The Address cannot be empty'
//             : null,
//         onChanged: onChangedDescription,
//       );
// }
