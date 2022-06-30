import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ropstam_task/app/providers/account_provider.dart';
import 'package:ropstam_task/features/home/presentation/manager/home_view_model.dart';
import 'package:ropstam_task/features/splash/presentation/pages/splash_page.dart';
import 'package:ropstam_task/utils/extension/extensions.dart';

import '../../../../app/globals.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  HomePageContentState createState() => HomePageContentState();
}

class HomePageContentState extends State<HomePageContent> {
  AccountProvider get _accountProvider => sl();

  @override
  void initState() {
    context.read<HomeViewModel>().onErrorMessage = (value) => context.show(message: value);
    context.read<HomeViewModel>().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ropstam Posts'),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await _accountProvider.logout();
              if (result) {
                Navigator.of(context).pushNamedAndRemoveUntil(SplashPage.routeName, (route) => false);
              }
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: context.read<HomeViewModel>().isLoadingNotifier,
        builder: (_, value, __) {
          if (value) {
            return Center(
              child: SizedBox(
                width: 40.w,
                height: 40.w,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                ),
              ),
            );
          } else {
            return ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 24.h),
              itemCount: context.read<HomeViewModel>().posts.length,
              itemBuilder: (_, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text('${context.read<HomeViewModel>().posts[index].id}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                  ),
                  title: Text(context.read<HomeViewModel>().posts[index].title, maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Text(context.read<HomeViewModel>().posts[index].body, maxLines: 4, overflow: TextOverflow.ellipsis),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          }
        },
      ),
    );
  }
}
