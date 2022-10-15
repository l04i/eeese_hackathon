import 'package:eeese_hackathon/utils/colors.dart';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:eeese_hackathon/utils/style.dart';
import 'package:eeese_hackathon/view/screens/search/search.dart';
import 'package:eeese_hackathon/view/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [const Home(), SearchScreen()];
  int _currentScreen = 4;

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
            const GButton(
              icon: Icons.more_horiz_outlined,
              text: '',
            ),
          ]),
        ),
        body: _screens[_currentScreen]);
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  final int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(Dimensions.width10),
      child: ListView(children: [
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
          style: TextStyle(fontSize: Dimensions.font26, color: Colors.black45),
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
                  fontSize: Dimensions.font22, color: Colors.deepOrangeAccent),
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
              label: Text(
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
              label: Text('Academic'),
              selected: _selected == 1,
              selectedColor: Colors.deepOrangeAccent,
              disabledColor: AppColors.lightergreyColor,
              labelStyle: MyTextStyle().mediumText(Colors.white),
              labelPadding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height15,
                  vertical: Dimensions.height5),
            ),
            ChoiceChip(
              label: Text('Sport'),
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
        const UpcomingEventCard(),
        SizedBox(height: Dimensions.height20),
        Text(
          'Past Events',
          style: TextStyle(fontSize: Dimensions.font26, color: Colors.black45),
        ),
        SizedBox(height: Dimensions.height20),
        const PastEventCard(),
      ]),
    ));
  }
}

class UpcomingEventCard extends StatelessWidget {
  const UpcomingEventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.width10),
      height: Dimensions.height250,
      decoration: BoxDecoration(
          color: AppColors.greyColor,
          image: const DecorationImage(
              image: AssetImage('assets/images/event1.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20))),
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
                  '09',
                  style: TextStyle(
                      fontSize: Dimensions.font16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'OCT',
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
              'Al-Turabi Hall',
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
              '1:00 PM',
              style: MyTextStyle().mediumText(Colors.white),
            ),
            const Spacer(),
            Text(
              'Social ',
              style: MyTextStyle().mediumText(Colors.white),
            ),
          ],
        ),
      ]),
    );
  }
}

class PastEventCard extends StatelessWidget {
  const PastEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: Dimensions.height120,
          width: Dimensions.height120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(Dimensions.radius20),
            ),
            image: const DecorationImage(
                image: AssetImage('assets/images/event1.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(Dimensions.height10),
            height: Dimensions.height120 * 0.75,
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
                  'Creativity Day',
                  style: MyTextStyle().mediumText(Colors.black),
                ),
                Text(
                  '09 - Sep',
                  style: MyTextStyle().mediumText(Colors.black54),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Social',
                      style: MyTextStyle().mediumText(Colors.black54),
                    ),
                    const Spacer(),
                    Container(
                      height: Dimensions.height30,
                      width: Dimensions.height60 * 2,
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'View Recap',
                          style: MyTextStyle().mediumText(Colors.white),
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
