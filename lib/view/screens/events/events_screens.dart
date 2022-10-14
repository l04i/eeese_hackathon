import 'package:eeese_hackathon/utils/colors.dart';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:eeese_hackathon/view/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //event image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.eventImgHeight,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png"),
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
                      "Title",
                      style: titleTextStyle(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          color: AppColors.lightergreyColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Firday, june 27",
                          style: bodyTextStyle(),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Icon(
                          Icons.schedule,
                          color: AppColors.lightergreyColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "20:00",
                          style: bodyTextStyle(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("70/90  joined", style: bodyTextStyle()),
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
                      "anything",
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
