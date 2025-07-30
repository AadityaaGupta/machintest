// // Enhanced Bottom Sheet Widget
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:ridebooking/bloc/booking_bloc/booking_bloc.dart';
// import 'package:ridebooking/bloc/booking_bloc/booking_state.dart';
// import 'package:ridebooking/models/available_trip_data.dart';
// import 'package:ridebooking/utils/session.dart';
// import 'package:ridebooking/utils/toast_messages.dart';
// import 'package:ridebooking/widgets/contact_details_card.dart';
// import 'package:ridebooking/widgets/passenger_card.dart';
// import 'package:ridebooking/widgets/traveler_info_card.dart';

// // You'll need to import your BusInfo class or define it here
// class BusInfo {
//   final String name;
//   final String operator;
//   final String route;
//   final String time;
//   final String date;
//   final double rating;
//   final String busType;

//   BusInfo({
//     required this.name,
//     required this.operator,
//     required this.route,
//     required this.time,
//     required this.date,
//     required this.rating,
//     required this.busType,
//   });
// }

// class EnhancedBusInfoBottomSheet extends StatefulWidget {
//   Availabletrips? tripData;
//   final BusInfo busInfo;
//   final Set<String>? selectedSeats;
//   final ScrollController? scrollController;

//    EnhancedBusInfoBottomSheet(
//       {Key? key,
//       required this.busInfo,
//       this.selectedSeats,
//       this.scrollController,this.tripData})
//       : super(key: key);

//   @override
//   _EnhancedBusInfoBottomSheetState createState() =>
//       _EnhancedBusInfoBottomSheetState();
// }

// class _EnhancedBusInfoBottomSheetState
//     extends State<EnhancedBusInfoBottomSheet> {
//   int selectedTabIndex = 0;
//   final List<String> tabs = [
//     'Rate & Reviews',
//     'Bus route',
//     'Boarding',
//     'Dropping',
//     'Passengers'
//   ];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//    saveSelectedSeat();
   
//   }
// List<Availabletrips>? tripsData;
//   saveSelectedSeat()async{
//     await Session.saveAllSelectedSeats(widget.selectedSeats!);
//   tripsData =  await Session().getTripsFromSession();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("-------abc------selected--${widget.selectedSeats}");
      
//     return
    
//     BlocProvider(create: (context)=>BookingBloc(widget.tripData!),
//     child: BlocListener<BookingBloc,BookingState>(
//       listener: (context,state){
//         if (state is BookingFailure) {
//                ToastMessage().showErrorToast(state.error);
//             }
//         // if(state is )
//       },
//       child: BlocBuilder<BookingBloc,BookingState>(
//         builder: (context,state){
//          if (state is BookingLoading) {
//              return  Center(child: CircularProgressIndicator());
//             }else{
//               return  Container(
//       height: MediaQuery.of(context).size.height * 0.7,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: Offset(0, -2),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // Drag handle
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 8),
//             width: 40,
//             height: 4,
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               borderRadius: BorderRadius.circular(2),
//             ),
//           ),

//           Expanded(
//             child: SingleChildScrollView(
//               controller: widget.scrollController,
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Bus info header
//                   Row(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Container(
//                           width: 60,
//                           height: 60,
//                           color: Colors.grey[300],
//                           child: Icon(Icons.directions_bus, size: 30),
//                         ),
//                       ),
//                       SizedBox(width: 12),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               widget.busInfo.busType,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             // Text(
//                             //   '${widget.busInfo.coSaving}% CO₂ saving',
//                             //   style: TextStyle(
//                             //     color: Colors.grey[600],
//                             //     fontSize: 12,
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),

//                   SizedBox(height: 16),

//                   // Operator info
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               widget.busInfo.operator,
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               '${widget.busInfo.time} • ${widget.busInfo.date}',
//                               style: TextStyle(
//                                 color: Colors.grey[600],
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.star, color: Colors.white, size: 12),
//                             SizedBox(width: 2),
//                             Text(
//                               widget.busInfo.rating.toString(),
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),

//                   SizedBox(height: 24),
//                   // Tab navigation
//                   Container(
//                     height: 40,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: tabs.length,
//                       itemBuilder: (context, index) {
//                         bool isSelected = selectedTabIndex == index;
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedTabIndex = index;
//                             });
//                           },
//                           child: Container(
//                             margin: EdgeInsets.only(right: 16),
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 16, vertical: 8),
//                             decoration: BoxDecoration(
//                               color: isSelected
//                                   ? Colors.red[50]
//                                   : Colors.transparent,
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(
//                                 color:
//                                     isSelected ? Colors.red : Colors.grey[300]!,
//                               ),
//                             ),
//                             child: Text(
//                               tabs[index],
//                               style: TextStyle(
//                                 color:
//                                     isSelected ? Colors.red : Colors.grey[600],
//                                 fontWeight: isSelected
//                                     ? FontWeight.bold
//                                     : FontWeight.normal,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),

//                   SizedBox(height: 20),

//                   // Tab content
//                   _buildTabContent(context,widget.tripData!),

//                   SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),

//           // Continue button
//           widget.selectedSeats!.isEmpty
//               ? Container()
//               // : Container(
//               //     padding: EdgeInsets.all(16),
//               //     decoration: BoxDecoration(
//               //       color: Colors.white,
//               //       boxShadow: [
//               //         BoxShadow(
//               //           color: Colors.black.withOpacity(0.1),
//               //           blurRadius: 8,
//               //           offset: Offset(0, -2),
//               //         ),
//               //       ],
//               //     ),
//               //     child: Row(
//               //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //       children: [
//               //         Expanded(
//               //           child: Column(
//               //             crossAxisAlignment: CrossAxisAlignment.start,
//               //             mainAxisSize: MainAxisSize.min,
//               //             children: [
//               //               Text(
//               //                 '${widget.selectedSeats!.length} seat(s) selected',
//               //                 style: TextStyle(
//               //                   fontWeight: FontWeight.bold,
//               //                   fontSize: 16,
//               //                 ),
//               //               ),
//               //               Text(
//               //                 'Seats: ${widget.selectedSeats!.join(", ")}',
//               //                 style: TextStyle(
//               //                   color: Colors.grey.shade600,
//               //                   fontSize: 14,
//               //                 ),
//               //               ),
//               //             ],
//               //           ),
//               //         ),
//               //         ElevatedButton(
//               //           onPressed: () {},
//               //           // style: ElevatedButton.styleFrom(
//               //           //   backgroundColor: Colors.red,
//               //           //   shape: RoundedRectangleBorder(
//               //           //     borderRadius: BorderRadius.circular(25),
//               //           //   ),
//               //           // ),
//               //           child: Text(
//               //             'Continue',
//               //             style: TextStyle(
//               //               color: Colors.white,
//               //               fontSize: 16,
//               //               fontWeight: FontWeight.bold,
//               //             ),
//               //           ),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               : Container(
//                   padding: EdgeInsets.all(16),
//                   child: SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {

//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: Text(
//                         'Continue',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//         ],
//       ),
//     );
 
//             }
//         }
        
        
//         ),
//       ),
//     );

    
 
//   }

//   Widget _buildTabContent(BuildContext context, Availabletrips tripData) {
//     switch (selectedTabIndex) {
//       case 0: // Rate & Reviews
//         return _buildRateReviewsTab();
//       case 1: // Bus route
//         return _buildBusRouteTab();
//       case 2: // Boarding
//         return _buildBoardingTab();
//       case 3: // Dropping
//         return _buildDroppingTab();
//       case 4: // Passengers
//         return _buildPassengersTab(context,tripData);
//       default:
//         return Container();
//     }
//   }

//   Widget _buildRateReviewsTab() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Text(
//         //   'Bus Highlights',
//         //   style: TextStyle(
//         //     fontSize: 16,
//         //     fontWeight: FontWeight.bold,
//         //     color: Colors.black87,
//         //   ),
//         // ),
//         // SizedBox(height: 16),
//         // _buildHighlightItem(Icons.wifi, 'Free WiFi'),
//         // _buildHighlightItem(Icons.ac_unit, 'AC'),
//         // _buildHighlightItem(Icons.charging_station, 'Charging Point'),
//         // _buildHighlightItem(Icons.water_drop, 'Water Bottle'),
//         // _buildHighlightItem(Icons.local_movies, 'Entertainment'),
//         // SizedBox(height: 20),
//         Text(
//           'Customer Reviews',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//           ),
//         ),
//         SizedBox(height: 16),
//         _buildReviewItem('Great service and comfortable seats!', 5, 'John D.'),
//         _buildReviewItem('Good bus, arrived on time', 4, 'Sarah M.'),
//         _buildReviewItem('Clean and well maintained', 5, 'Mike R.'),
//       ],
//     );
//   }

//   Widget _buildBusRouteTab() {
//     return Column(
//       children: [
//         _buildRouteItem(widget.tripData!.src.toString(), "${ DateFormat('hh:mm a').format(DateTime.parse(widget.tripData!.deptime.toString()))}", true),
//         _buildRouteConnector(),
//         _buildRouteItem(widget.tripData!.dst.toString(), "${ DateFormat('hh:mm a').format(DateTime.parse(widget.tripData!.arrtime.toString()))}", false),
//         _buildRouteConnector(),
//         // _buildRouteItem('Ujjain', '09:00', false),
//         // _buildRouteConnector(),
//         // _buildRouteItem('Bhopal', '10:05', true),
//       ],
//     );
//   }
//   String? _selectedBoardingPoint;
// Widget _buildBoardingTab() {
//   final bpDetails = widget.tripData?.boardingpoint?.bpDetails;

//   if (bpDetails == null || bpDetails.isEmpty) {
//     return const Center(child: Text("No boarding points available"));
//   }

//   return Column(
//     children: List.generate(bpDetails.length, (int index) {
//       final detail = bpDetails[index];

//       final String venue = detail.venue ?? '';
//       final String boardTime = detail.boardtime != null
//           ? DateFormat('hh:mm a').format(DateTime.parse(detail.boardtime.toString()))
//           : '--:--';
//       final String stationName = detail.stnname ?? '';
//       final String selectedValue = '$venue-$boardTime';

//       return _buildBoardingPoint(
//           venue,
//           boardTime,
//           stationName,
//           groupValue: _selectedBoardingPoint,
//           selectedValue: selectedValue,
//           onTap: () {
//             setState(() {
//               _selectedBoardingPoint = selectedValue;
//             });
//             print('Selected boarding point: $venue at $boardTime');
//           },
//         );
//     }),
//   );
// }


//   Widget _buildBoardingPoint(
//     String location,
//     String time,
//     String description, {
//     VoidCallback? onTap,
//     required String? groupValue,
//     required String selectedValue,
//   }) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey[300]!),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: ListTile(
//         contentPadding: EdgeInsets.zero,
//         title: Text(
//           location,
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               time,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.red,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               description,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//         leading: Radio<String>(
//           value: selectedValue,
//           groupValue: groupValue,
//           onChanged: (value) {
//             if (onTap != null) {
//               onTap();
//             }
//           },
//         ),
//         onTap: onTap,
//       ),
//     );
//   }

// //Droping point

// String? _selectedDroppingPoint;

// Widget _buildDroppingTab() {
//   final dpDetails = widget.tripData?.droppingpoint?.dpDetails;

//   if (dpDetails == null || dpDetails.isEmpty) {
//     return const Center(child: Text("No dropping points available"));
//   }

//   return Column(
//     children: List.generate(dpDetails.length, (int index) {
//       final detail = dpDetails[index];

//       final String venue = detail.venue ?? '';
//       final String dropTime = detail.droptime != null
//           ? DateFormat('hh:mm a').format(DateTime.parse(detail.droptime.toString()))
//           : '--:--';
//       final String stationName = detail.stationname ?? '';
//       final String selectedValue = '$venue-$dropTime';

//       return _buildDroppingPoint(
//         venue,
//         dropTime,
//         stationName,
//         groupValue: _selectedDroppingPoint,
//         selectedValue: selectedValue,
//         onTap: () {
//           setState(() {
//             _selectedDroppingPoint = selectedValue;
//           });
//           print('Selected dropping point: $venue at $dropTime');
//         },
//       );
//     }),
//   );
// }

// Widget _buildDroppingPoint(
//   String location,
//   String time,
//   String description, {
//   VoidCallback? onTap,
//   required String? groupValue,
//   required String selectedValue,
// }) {
//   return Container(
//     margin: EdgeInsets.only(bottom: 16),
//     padding: EdgeInsets.all(12),
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.grey[300]!),
//       borderRadius: BorderRadius.circular(8),
//     ),
//     child: ListTile(
//       contentPadding: EdgeInsets.zero,
//       title: Text(
//         location,
//         style: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             time,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.red,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             description,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//       leading: Radio<String>(
//         value: selectedValue,
//         groupValue: groupValue,
//         onChanged: (value) {
//           if (onTap != null) {
//             onTap();
//           }
//         },
//       ),
//       onTap: onTap,
//     ),
//   );
// }

// //   Widget _buildDroppingTab() {
// //   final dpDetails = widget.tripData?.droppingpoint?.dpDetails;

// //   if (dpDetails == null || dpDetails.isEmpty) {
// //     return const Center(child: Text("No dropping points available"));
// //   }

// //   return Column(
// //     children: List.generate(dpDetails.length, (int index) {
// //       final detail = dpDetails[index];

// //       final String venue = detail.venue ?? '';
// //       final String dropTime = detail.droptime != null
// //           ? DateFormat('hh:mm a').format(DateTime.parse(detail.droptime.toString()))
// //           : '--:--';
// //       final String stationName = detail.stationname ?? '';

// //       return _buildDroppingPoint(venue, dropTime, stationName);
// //     }),
// //   );
// // }


//   Widget _buildPassengersTab(BuildContext context,Availabletrips tripsData) {
//        return SingleChildScrollView(
//       // padding: const EdgeInsets.all(12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           TravelerInfoCard(
//             boardingInfo: "Mon, 5 Aug | 10:00 AM",
//             boardingPoint: "tripsData",
//             droppingInfo: "Mon, 5 Aug | 4:00 PM",
//             droppingPoint: "Indiranagar Metro",
//             seatCount: 8,
//             seatDetails: ['A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8'],
//           ),
//           SizedBox(height: 16),
//           ContactDetailsCard(),
//           SizedBox(height: 16),
//           PassengerCard(),
//         ],
//       ),
//     );
//   }

 
//   Widget _buildHighlightItem(IconData icon, String text) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.green, size: 20),
//           SizedBox(width: 16),
//           Text(
//             text,
//             style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildReviewItem(String review, int rating, String reviewer) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.grey[50],
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey[200]!),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 reviewer,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Spacer(),
//               Row(
//                 children: List.generate(5, (index) {
//                   return Icon(
//                     Icons.star,
//                     color: index < rating ? Colors.orange : Colors.grey[300],
//                     size: 16,
//                   );
//                 }),
//               ),
//             ],
//           ),
//           SizedBox(height: 8),
//           Text(
//             review,
//             style: TextStyle(
//               fontSize: 13,
//               color: Colors.grey[700],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRouteItem(String location, String time, bool isEndPoint) {
//     return Row(
//       children: [
//         Container(
//           width: 12,
//           height: 12,
//           decoration: BoxDecoration(
//             color: isEndPoint ? Colors.red : Colors.grey,
//             shape: BoxShape.circle,
//           ),
//         ),
//         SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 location,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Text(
//                 time,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildRouteConnector() {
//     return Container(
//       margin: EdgeInsets.only(left: 6, top: 8, bottom: 8),
//       width: 2,
//       height: 30,
//       color: Colors.grey[300],
//     );
//   }

// //   Widget _buildBoardingPoint(String location, String time, String description, {VoidCallback? onTap}) {
// //   return Container(
// //     margin: EdgeInsets.only(bottom: 16),
// //     padding: EdgeInsets.all(12),
// //     decoration: BoxDecoration(
// //       border: Border.all(color: Colors.grey[300]!),
// //       borderRadius: BorderRadius.circular(8),
// //     ),
// //     child: ListTile(
// //       contentPadding: EdgeInsets.zero,
// //       title: Text(
// //         location,
// //         style: TextStyle(
// //           fontSize: 14,
// //           fontWeight: FontWeight.w500,
// //         ),
// //       ),
// //       subtitle: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             time,
// //             style: TextStyle(
// //               fontSize: 12,
// //               color: Colors.red,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           Text(
// //             description,
// //             style: TextStyle(
// //               fontSize: 12,
// //               color: Colors.grey[600],
// //             ),
// //           ),
// //         ],
// //       ),
// //       onTap: onTap,
// //     ),
// //   );
// // }

// //   Widget _buildDroppingPoint(String location, String time, String description, {VoidCallback? onTap}) {
// //   return Container(
// //     margin: EdgeInsets.only(bottom: 16),
// //     padding: EdgeInsets.all(12),
// //     decoration: BoxDecoration(
// //       border: Border.all(color: Colors.grey[300]!),
// //       borderRadius: BorderRadius.circular(8),
// //     ),
// //     child: ListTile(
// //       contentPadding: EdgeInsets.zero,
// //       title: Text(
// //         location,
// //         style: TextStyle(
// //           fontSize: 14,
// //           fontWeight: FontWeight.w500,
// //         ),
// //       ),
// //       subtitle: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             time,
// //             style: TextStyle(
// //               fontSize: 12,
// //               color: Colors.red,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           Text(
// //             description,
// //             style: TextStyle(
// //               fontSize: 12,
// //               color: Colors.grey[600],
// //             ),
// //           ),
// //         ],
// //       ),
// //       onTap: onTap,
// //     ),
// //   );
// // }

//   Widget _buildPassengerInfo(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }