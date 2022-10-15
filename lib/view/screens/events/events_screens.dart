import 'package:eeese_hackathon/data/models/event.dart';
import 'package:eeese_hackathon/utils/colors.dart';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:eeese_hackathon/utils/style.dart';
import 'package:eeese_hackathon/view/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  bool isRegistered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.event.isUpcoming
          ? InkWell(
              onTap: () {
                setState(() {
                  isRegistered = !isRegistered;
                });
              },
              child: Container(
                height: Dimensions.height45,
                width: Dimensions.height60 * 1.8,
                decoration: BoxDecoration(
                    color: isRegistered
                        ? AppColors.lightergreyColor
                        : Colors.deepOrangeAccent,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.radius15))),
                child: Center(
                  child: Text(
                    isRegistered ? 'Registered' : 'Register Now!',
                    style: MyTextStyle().mediumText(
                        isRegistered ? Colors.black45 : Colors.white),
                  ),
                ),
              ),
            )
          : null,
      body: Stack(
        children: [
          //event image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.eventImgHeight,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.event.picUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          //action icons
          Positioned(
            top: Dimensions.height30 * 1.1,
            left: Dimensions.height20,
            right: Dimensions.height20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_sharp,
                  onPressed: () => Get.back(),
                ),
                AppIcon(
                  icon: Icons.bookmark_add,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.eventImgHeight - Dimensions.height30,
            child: Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius30 * 1.5),
                  topRight: Radius.circular(Dimensions.radius30 * 1.5),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.event.name,
                      style: titleTextStyle(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.deepOrangeAccent,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.event.dateTime
                              .toIso8601String()
                              .substring(0, 10),
                          style: bodyTextStyle(),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Icon(
                          Icons.schedule,
                          color: Colors.deepOrangeAccent,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.event.dateTime
                              .toIso8601String()
                              .substring(12, 16),
                          style: bodyTextStyle(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("${widget.event.currentAttendance}  joined",
                        style: bodyTextStyle()),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Descrption",
                      style: titleTextStyle(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.event.description,
                      style: bodyTextStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle titleTextStyle() {
  return const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}

TextStyle bodyTextStyle() {
  return const TextStyle(
    fontSize: 18,
    color: AppColors.lightergreyColor,
  );
}
