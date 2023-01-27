import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/widgets/secondary_action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../fight_result.dart';
import '../widgets/fight_result_widget.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FightClubColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 24),
              alignment: Alignment.center,
              child: const Text(
                'Statistics',
                style: TextStyle(
                  color: FightClubColors.darkGreyText,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            FutureBuilder<SharedPreferences>(
                future: SharedPreferences.getInstance(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    return const SizedBox();
                  }
                  final SharedPreferences sp = snapshot.data!;
                  return Column(
                    children: [
                      Text(
                        'Won: ${sp.getInt("stats_won") ?? 0}',
                        style: TextStyle(
                          color: FightClubColors.darkGreyText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Draw: ${sp.getInt("stats_draw") ?? 0}',
                        style: TextStyle(
                          color: FightClubColors.darkGreyText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Lost: ${sp.getInt("stats_lost") ?? 0}',
                        style: TextStyle(
                          color: FightClubColors.darkGreyText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                }),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SecondaryActionButton(
                  text: "Back", onTap: Navigator.of(context).pop),
            ),
          ],
        ),
      ),
    );
  }
}
