import 'package:eeese_hackathon/view/widgets/app_icon.dart';
import 'package:flutter/material.dart';

import 'package:eeese_hackathon/utils/colors.dart';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:eeese_hackathon/utils/style.dart';
import 'package:get/get.dart';

class CommitteesScreen extends StatelessWidget {
  const CommitteesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppIcon(
                    iconColor: Colors.black,
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icons.arrow_back_ios),
                const Text(
                  "Current Committees in Faculty of Engineering are:",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CommitteeCard(
                    name: "AlchE:",
                    url: "alche.jpg",
                    about:
                        "American Institute of Chemical Engineering is the worlds leading organization for Chemical engineering professionals Students and Postgraduates with more than 60.000 memeber from 110 countries.AIChE has a wide range of  resources and experties you need whether you are in a core process industries or emerging areas like biotechnology and sustainbility.AIChE also contains divisions and forums that provide technical informations programming for AlchEs technical meetings and awards and recognition to out standing Chemical engineers in their area of experties. They also Provide opportunities for connections with top engineers in the general disciplines as well as emerging fields."),
                const SizedBox(
                  height: 15,
                ),
                const CommitteeCard(
                    name: "IEEE",
                    url: "ieee.jpg",
                    about:
                        "IEEE is the world’s largest technical professional organization dedicated to advancing technology for the benefit of humanity. IEEE and its members inspire a global community through its highly cited publications, conferences, technology standards, and professional and educational activities."),
                const SizedBox(
                  height: 15,
                ),
                const CommitteeCard(
                    name: "AEE",
                    url: "aee.jpg",
                    about:
                        "The Association of Energy Engineers (AEE), founded in 1977 by Albert Thumann, is a nonprofit professional society of over 18,000 members in more than 100 countries. The mission of AEE is to promote the scientific and educational interests of those engaged in the energy industry and to foster action for Sustainable Development. The AEE UofK Chapter is a group of students interested in sustainable development and energy production and utilization. The UofK AEE chapter was established in January of 2021, and it is an endeavor to provide knowledge about the national sectors responsible for energy, discuss the various existing and suggested projects, and raise awareness about all the disciplines of energy."),
                const SizedBox(
                  height: 15,
                ),
                const CommitteeCard(
                    name: "CESS",
                    url: "cess.jpg",
                    about:
                        "Civil Engineering Students Society at the University of Khartoum CESS UofK is a non-profit, student-run organization that is aimed at enhancing the quality of the college experience for the students, as well as recognize their needs and respond to them. The organization has a global recognition from both the International  Association of Civil Engineering Students IACES as the sole local committee in Sudan, known as IACES LC Khartoum, in addition to having an official students  chapter i the well established Institute of Civil Engineering ICE in the United Kingdom. CESS UofK is dedicated to enriching the students life and provide them with all the relevant information training and academic aids via its varying activities articles event sexpeditions and conferences.")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommitteeCard extends StatelessWidget {
  final String name;
  final String url;
  final String about;
  const CommitteeCard({
    Key? key,
    required this.name,
    required this.url,
    required this.about,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: Dimensions.radius30,
              backgroundImage: AssetImage("assets/images/$url"),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: MyTextStyle().bigText(Colors.black),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          about,
          style: MyTextStyle().mediumText(AppColors.lightergreyColor),
        ),
      ],
    );
  }
}
