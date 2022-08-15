import 'package:devcademy_flutter/models/accommodation.dart';
import 'package:devcademy_flutter/models/reservation.dart';
import 'package:devcademy_flutter/screens/homes-screen/widgets/horizontal_card_widget.dart';
import 'package:devcademy_flutter/shared/widgets/accommodation_info.dart';
import 'package:devcademy_flutter/shared/widgets/date_info.dart';
import 'package:flutter/material.dart';

import '../../http.dart';
import '../../shared/widgets/app_bar_widget.dart';
import '../../shared/widgets/bottom_nav_widget.dart';
import '../../theme.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: "My Bookings", showBackIcon: false, showSearchIcon: false),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: SingleChildScrollView(
                child: FutureBuilder(
                    future: Future.wait([
                      http.getMyBookings(),
                      http.getAllHomes(),
                    ]),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return const Center(child: Text('error'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: ThemeColors.mint500,
                        ));
                      }
                      List<Reservation> reservations = snapshot.data[0];

                      List<Accommodation> accommodations = snapshot.data[1];

                      return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          separatorBuilder: ((context, index) =>
                              const SizedBox(height: 20)),
                          itemCount: reservations.length,
                          itemBuilder: (BuildContext context, index) {
                            Reservation reservation = reservations[index];
                            String accommodationID = reservation.homesallId;
                            final sorted = accommodations.firstWhere(
                                (element) => element.id == accommodationID);

                            return GestureDetector(
                                onTap: () => {},
                                child: HorizontalCard(
                                    accommodation: sorted,
                                    typeOfInfo: AccommodationInfo(
                                      title: sorted.title,
                                      location: sorted.location,
                                      categorization: sorted.categorization,
                                      specialData: DateInfo(
                                          checkIn: reservation.checkIn,
                                          checkOut: reservation.checkOut),
                                    )));
                          });
                    }))), bottomNavigationBar: const MyBottomNav(index: 1));
  }
}
