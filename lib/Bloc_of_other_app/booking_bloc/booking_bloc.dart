// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ridebooking/bloc/booking_bloc/booking_event.dart';
// import 'package:ridebooking/bloc/booking_bloc/booking_state.dart';
// import 'package:ridebooking/models/available_trip_data.dart';
// import 'package:ridebooking/repository/ApiConst.dart';
// import 'package:ridebooking/repository/ApiRepository.dart';
// import 'package:ridebooking/utils/session.dart';

// class BookingBloc extends Bloc<BookingEvent,BookingState> {
//   Availabletrips tripData;

// BookingBloc(this.tripData) : super(BookingInitial()) {

// getTentativeBooking();

// }

//   getTentativeBooking() async{

//      emit(BookingLoading());

//   try {

// var formData = {
//   "routeid": 5901,
//   "tripid": 148789,
//   "bpoint": 522446,
//   "noofseats": 1,
//   "mobileno": "8305933803",
//   "email": "aadityagupta778@gmail.com",
//   "totalfare": 1050,
//   "bookedat": "2025-07-31",
//   "seatInfo": {
//     "passengerInfo": [
//       {
//         "Name": "Aaditya",
//         "gender": "Male",
//         "seatNo": "U10",
//         "age": "25",
//         "fare": "1050"
//       }
//     ]
//   },
//   "opid": "VGT"
// };

//     var response = await ApiRepository.postAPI(ApiConst.getTentativeBooking,formData);

//     final data = response.data; // ✅ Extract actual response map

//     if (data["status"] != null && data["status"]["success"] == true) {

//         await Session().setPnr(data["BookingInfo"]["PNR"]);

//         print("Tentative Booking done----------->${data["BookingInfo"]["PNR"]}");
      
//       emit(BookingLoaded());
//     } else {
//       final message = data["status"]?["message"] ?? "Failed to load stations";
//       emit(BookingFailure(error: message));
//     }
//   } catch (e) {
//     print("Error in getAllStations: $e");
//     emit(BookingFailure(error: "Something went wrong. Please try again."));
//   }
//   }



// }