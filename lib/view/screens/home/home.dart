import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eeese_hackathon/controllers/home_controller.dart';
import 'package:eeese_hackathon/data/models/event.dart';
import 'package:eeese_hackathon/utils/colors.dart';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:eeese_hackathon/utils/style.dart';
import 'package:eeese_hackathon/view/screens/events/events_screens.dart';
import 'package:eeese_hackathon/view/screens/account_screen.dart';
import 'package:eeese_hackathon/view/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    Home(),
    const SearchScreen(),
    const SizedBox(),
    const AccountScreen()
  ];
  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(Dimensions.height5),
          height: Dimensions.height60,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius:
                  BorderRadius.all(Radius.circular(Dimensions.radius20))),
          child: GNav(activeColor: Colors.deepOrangeAccent, tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                setState(() {
                  _currentScreen = 0;
                });
              },
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
              onPressed: () {
                setState(() {
                  _currentScreen = 1;
                });
              },
            ),
            const GButton(
              icon: Icons.calendar_month_outlined,
              text: 'My Events',
            ),
            GButton(
                icon: Icons.person,
                text: 'Profile',
                onPressed: () {
                  setState(() {
                    _currentScreen = 3;
                  });
                }),
          ]),
        ),
        body: _screens[_currentScreen]);
  }
}

class Home extends StatelessWidget {
  Home({super.key});
  final int _selected = 0;
  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(Dimensions.width10),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'EVENTOS',
                style: MyTextStyle()
                    .bigText(Colors.black)
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: Dimensions.height15,
          ),
          Text(
            'Discover Events',
            style:
                TextStyle(fontSize: Dimensions.font26, color: Colors.black45),
          ),
          Row(
            children: [
              Text(
                'October ',
                style: TextStyle(
                  fontSize: Dimensions.font22,
                ),
              ),
              Text(
                '2022 ',
                style: TextStyle(
                    fontSize: Dimensions.font22,
                    color: Colors.deepOrangeAccent),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoiceChip(
                label: const Text(
                  'Social',
                ),
                selected: _selected == 0,
                selectedColor: Colors.deepOrangeAccent,
                disabledColor: AppColors.lightergreyColor,
                labelStyle: MyTextStyle().mediumText(Colors.white),
                labelPadding: EdgeInsets.symmetric(
                    horizontal: Dimensions.height15,
                    vertical: Dimensions.height5),
              ),
              ChoiceChip(
                label: const Text('Academic'),
                selected: _selected == 1,
                selectedColor: Colors.deepOrangeAccent,
                disabledColor: AppColors.lightergreyColor,
                labelStyle: MyTextStyle().mediumText(Colors.white),
                labelPadding: EdgeInsets.symmetric(
                    horizontal: Dimensions.height15,
                    vertical: Dimensions.height5),
              ),
              ChoiceChip(
                label: const Text('Sport'),
                selected: _selected == 2,
                selectedColor: Colors.deepOrangeAccent,
                disabledColor: AppColors.lightergreyColor,
                labelStyle: MyTextStyle().mediumText(Colors.white),
                labelPadding: EdgeInsets.symmetric(
                    horizontal: Dimensions.height15,
                    vertical: Dimensions.height5),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          StreamBuilder(
            stream: _controller.getEvents(isUpcoming: true),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepOrangeAccent,
                  ),
                );
              } else {
                return SizedBox(
                  width: double.maxFinite,
                  height: 260,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: ((context, index) {
                        QueryDocumentSnapshot snapp =
                            snapshot.data!.docs[index];

                        return UpcomingEventCard(
                          event: Event.fromMap(
                              snapp.data() as Map<String, dynamic>),
                        );
                      })),
                );
              }
            },
          ),
          SizedBox(height: Dimensions.height20),
          Text(
            'Past Events',
            style:
                TextStyle(fontSize: Dimensions.font26, color: Colors.black45),
          ),
          SizedBox(height: Dimensions.height10),
          StreamBuilder(
            stream: _controller.getEvents(isUpcoming: false),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepOrangeAccent,
                  ),
                );
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      QueryDocumentSnapshot snapp = snapshot.data!.docs[index];

                      return PastEventCard(
                        event:
                            Event.fromMap(snapp.data() as Map<String, dynamic>),
                      );
                    }));
              }
            },
          ),
        ]),
      ),
    ));
  }
}

class UpcomingEventCard extends StatelessWidget {
  const UpcomingEventCard({
    Key? key,
    required this.event,
  }) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Get.to(() => EventsScreen(event: event))),
      child: Container(
        padding: EdgeInsets.all(Dimensions.width10),
        margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
        height: Dimensions.height250,
        width: Dimensions.height250,
        decoration: BoxDecoration(
            color: AppColors.greyColor,
            image: DecorationImage(
                image: NetworkImage(event.picUrl), fit: BoxFit.cover),
            borderRadius:
                BorderRadius.all(Radius.circular(Dimensions.radius20))),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: Dimensions.height45,
                width: Dimensions.height45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimensions.radius15)),
                ),
                child: Column(children: [
                  Text(
                    '0${event.dateTime.day}',
                    style: TextStyle(
                        fontSize: Dimensions.font16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    event.dateTime.month.toString(),
                    style: MyTextStyle().mediumText(Colors.deepOrangeAccent),
                  ),
                ]),
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(
                Icons.location_pin,
                color: Colors.deepOrangeAccent,
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Text(
                event.location,
                style: MyTextStyle().mediumText(Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.schedule,
                color: Colors.deepOrangeAccent,
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Text(
                '${event.dateTime.hour} PM',
                style: MyTextStyle().mediumText(Colors.white),
              ),
              const Spacer(),
              Text(
                event.category,
                style: MyTextStyle().mediumText(Colors.white),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class PastEventCard extends StatelessWidget {
  const PastEventCard({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
          height: Dimensions.height120,
          width: Dimensions.height120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(Dimensions.radius20),
            ),
            image: DecorationImage(
                image: NetworkImage(event.picUrl), fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(Dimensions.height10),
            height: Dimensions.height120 * 0.85,
            decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius15),
                    bottomRight: Radius.circular(Dimensions.radius15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  event.name,
                  style: MyTextStyle().mediumText(Colors.black),
                ),
                Text(
                  event.dateTime.toIso8601String().substring(0, 10),
                  style: MyTextStyle().mediumText(Colors.black54),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      event.category,
                      style: MyTextStyle().mediumText(Colors.black54),
                    ),
                    const Spacer(),
                    Container(
                      height: Dimensions.height30,
                      width: Dimensions.height60 * 1.2,
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius15),
                        ),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () => Get.to(() => EventsScreen(event: event)),
                          child: Text(
                            'View',
                            style: MyTextStyle().mediumText(Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
