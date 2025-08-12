import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inprep_ai/core/common/styles/global_text_style.dart'
    show getTextStyle;
import 'package:inprep_ai/core/utils/constants/colors.dart';
import 'package:inprep_ai/features/interview/interview_lists/controller/interview_list_controller.dart';
import 'package:inprep_ai/features/interview/interview_lists/lists/available_mock_interviews.dart'
    show AvailableMockInterviews;
import 'package:inprep_ai/features/interview/interview_lists/lists/incomplete_sessions.dart'
    show IncompleteSessions;
import 'package:inprep_ai/features/interview/interview_lists/widgets/search_textfield.dart';

class InterviewListView extends StatelessWidget {
  InterviewListView({super.key});

  final InterviewListController controller = Get.put(InterviewListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24.0),
                Center(
                  child: Text(
                    "Interviews",
                    style: getTextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
