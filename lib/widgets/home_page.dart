import 'package:flutter/material.dart';
import 'package:testapi/api/api_provider.dart';

import '../models/open_bookings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<OpenBookings>>? openBookings;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openBookings = ApiProvider().openBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: openBookings,
          builder: (context, AsyncSnapshot<List<OpenBookings>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError || !snapshot.hasData) {
              return Center(
                child: Text('An error occurred'),
              );
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) {
                  return Text(snapshot.data![index].platNumber!);
                });
          }),
    );
  }
}
