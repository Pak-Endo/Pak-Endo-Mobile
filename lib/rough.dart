// import 'package:flutter/material.dart';


// class DestinationScreen extends StatefulWidget {
//   Destination destination;

//   DestinationScreen({this.destination});

//   @override
//   _DestinationScreenState createState() => _DestinationScreenState();
// }

// class _DestinationScreenState extends State<DestinationScreen> {

//   Text  _buildRatingStars(int rating) {
//     String stars ='';
//     for(int i=0; i<rating;i++) {
//       stars += '⭐ ';
//     }
//     stars.trim();
//     return Text(stars);
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     color: Colors.black87,
//                     borderRadius: BorderRadius.circular(30.0),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.black87,
//                           offset: Offset(0.0, 2.0),
//                           blurRadius: 6.0)
//                     ]),
//                 child: Hero(
//                   tag: widget.destination.imageUrl,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(30.0),
//                     child: Image(
//                       image: AssetImage(
//                         widget.destination.imageUrl,
//                       ),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 50.0, horizontal: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                         iconSize: 30.0,
//                         color: Colors.black,
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: Icon(Icons.arrow_back_ios)),
//                     Row(
//                       children: [
//                         IconButton(
//                             iconSize: 30.0,
//                             color: Colors.black,
//                             onPressed: () {},
//                             icon: Icon(Icons.search)),
//                         IconButton(
//                             iconSize: 25.0,
//                             color: Colors.black,
//                             onPressed: () {},
//                             icon: Icon(FontAwesomeIcons.sortAmountDown)),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Positioned(
//                 left: 20.0,
//                 bottom: 20.0,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.destination.city,
//                       style: TextStyle(
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.w600,
//                         letterSpacing: 1.0,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Icon(
//                           FontAwesomeIcons.locationArrow,
//                           size: 10.0,
//                           color: Colors.white70,
//                         ),
//                         SizedBox(
//                           width: 5.0,
//                         ),
//                         Text(
//                           widget.destination.country,
//                           style:
//                               TextStyle(fontSize: 15.0, color: Colors.white70),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                   right: 20.0,
//                   bottom: 20.0,
//                   child: Icon(
//                     Icons.location_on,
//                     size: 20.0,
//                     color: Colors.white70,
//                   ))
//             ],
//           ),
//           Expanded(
//             child: ListView.builder(
//               padding: EdgeInsets.symmetric(vertical: 10.0),
//               itemCount: widget.destination.activities.length,
//               itemBuilder: (BuildContext context, int index) {
//                 Activity activity = widget.destination.activities[index];

//                 return Stack(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: 170.0,
//                       margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.0)),
//                       child: Padding(
//                         padding:
//                             const EdgeInsets.fromLTRB(80.0, 20.0, 20.0, 20.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   width: 120.0,
//                                   child: Text(
//                                     activity.name,
//                                     style: TextStyle(
//                                         fontSize: 18.0,
//                                         fontWeight: FontWeight.w600,),
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                                 Column(
//                                   children: [
//                                     Text("\$${activity.price}",style: TextStyle(
//                                       fontSize: 22.0,
//                                       fontWeight: FontWeight.w600,
//                                     ),),
//                                     Text('Per Pax',style: TextStyle(
//                                       color: Colors.grey
//                                     ),)
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             Text(activity.type),
//                             SizedBox(height:5.0),
//                             _buildRatingStars(activity.rating),
//                             SizedBox(
//                               height: 20.0,
//                             ),
//                             Row(
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.all(5.0),
//                                   alignment: Alignment.center,
//                                   width: 70.0,
//                                   decoration: BoxDecoration(
//                                     color: Theme.of(context).accentColor,
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                   child: Text(activity.startTimes[0]),
//                                 ),
//                                 SizedBox(
//                                   width: 10.0,
//                                 ),
//                                 Container(
//                                   padding: EdgeInsets.all(5.0),
//                                   alignment: Alignment.center,
//                                   width: 70.0,
//                                   decoration: BoxDecoration(
//                                     color: Theme.of(context).accentColor,
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                   child: Text(activity.startTimes[1]),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top:15.0,
//                       bottom:15.0,
//                       left:10.0,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20.0),
//                         child: Image(
//                           image: AssetImage(activity.imageUrl,),
//                           fit: BoxFit.cover,
//                           width: 100.0,
//                         ),
//                       ),
//                     )
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }