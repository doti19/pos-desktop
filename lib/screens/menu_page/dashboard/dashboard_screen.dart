import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';
import 'components/header.dart';
import 'components/monthly_sales.dart';
import 'components/periodic_reports.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        //padding: EdgeInsets.all(defaultPadding),
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: const Column(
            children: [
              Header(),
              SizedBox(height: defaultPadding),
              MonthlySales(),
              PeriodicReports(),
              // const MiniInformation(),
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expanded(
                  //   flex: 5,
                  //   child: Column(
                  //     children: [
                  //       //MyFiels(),
                  //       //SizedBox(height: defaultPadding),
                  //       const RecentUsers(),
                  //       const SizedBox(height: defaultPadding),
                  //       const RecentDiscussions(),
                  //       if (Responsive.isMobile(context))
                  //         const SizedBox(height: defaultPadding),
                  //       if (Responsive.isMobile(context))
                  //         const UserDetailsWidget(),
                  //     ],
                  //   ),
                  // ),
                  // if (!Responsive.isMobile(context))
                  //   const SizedBox(width: defaultPadding),
                  // // On Mobile means if the screen is less than 850 we dont want to show it
                  // if (!Responsive.isMobile(context))
                  //   const Expanded(
                  //     flex: 2,
                  //     child: UserDetailsWidget(),
                  //   ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
