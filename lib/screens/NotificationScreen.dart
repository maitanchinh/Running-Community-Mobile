import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:running_community_mobile/cubit/notification/notification_cubit.dart';
import 'package:running_community_mobile/cubit/notification/notification_state.dart';
import 'package:running_community_mobile/utils/app_assets.dart';
import 'package:running_community_mobile/utils/gap.dart';

import '../components/NotificationComponent.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static const String routeName = '/notification';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification',
          style: TextStyle(fontSize: 20),
        ),
        // leading: const Icon(Icons.arrow_back),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await context.read<MarkAsReadNotificationCubit>().markAllAsRead();
              context.read<NotificationCubit>().getNotifications(pageSize: 1000);
            },
            icon: SvgPicture.asset(AppAssets.envelope_open, color: gray, height: 20, width: 20),
          )
        ],
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is NotificationSuccessState) {
            var notifications = state.notifications.notifications;
            return RefreshIndicator(
              onRefresh: () async {
                context.read<NotificationCubit>().getNotifications(pageSize: 1000);
              },
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: notifications!.length,
                separatorBuilder: (context, index) => Gap.k8.height,
                itemBuilder: (context, index) {
                  return NotificationComponent(notification: notifications[index]);
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
