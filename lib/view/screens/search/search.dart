import 'package:eeese_hackathon/utils/colors.dart';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:eeese_hackathon/utils/style.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  final int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.height10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.height5),
              height: Dimensions.height45,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.radius15)),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: AppColors.lightergreyColor,
                  )
                ],
              ),
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
            )
          ],
        ),
      ),
    );
  }
}
