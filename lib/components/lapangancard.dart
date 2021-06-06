// part of 'components.dart';

// class Lapangancard extends StatelessWidget {
//   final Lapangans lapangan;
//   Lapangancard({this.lapangan});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: InkWell(
//         splashColor: Colors.blue.withAlpha(30),
//         onTap: () {
//           Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) {
//             return DetailLapangan();
//           }));
//         },
//         child: Container(
//             child: Stack(
//           fit: StackFit.expand,
//           alignment: Alignment.bottomLeft,
//           children: [
//             Container(
//               child: Image.network(
//                 "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               width: MediaQuery.of(context).size.width - 80,
//               child: Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.white60,
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(8),
//                       topLeft: Radius.circular(8)),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         HeadingText.withColor(
//                           lapangan.detail,
//                           16,
//                           primary_color,
//                         ),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.location_on,
//                             ),
//                             Text(
//                               "Location",
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(Icons.star_border),
//                             Icon(Icons.star_border),
//                             Icon(Icons.star_border),
//                             Icon(Icons.star_border),
//                           ],
//                         ),
//                         Text(lapangan.price)
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         )),
//       ),
//       elevation: 8,
//     );
//   }
// }
