// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:tv_guide/app/app_route_manager.dart';
import 'package:tv_guide/core/widgets/custom_scaffold.dart';
import 'package:tv_guide/features/home/presentation/cubit/home_page_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homePageCubit = GetIt.I.get<HomePageCubit>();
  final overlayController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      bloc: homePageCubit,
      listener: (context, state) {
        if (state.pageStatus.isLoadInProgress || state.logOutStatus.isLoadFailure) {
          overlayController.show();
        } else {
          overlayController.hide();
        }

        if (state.logOutStatus.isLoadSuccess) {
          context.goToLogin();
        }
      },
      builder: (context, state) => CustomScaffold(
        overlayPortalController: overlayController,
        appBar: AppBar(
          centerTitle: false,
          title: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(HeroiconsOutline.magnifyingGlass),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: homePageCubit.logOut,
                child: const Icon(HeroiconsOutline.arrowRightOnRectangle),
              ),
            ),
          ],
        ),
        body: switch (state.pageStatus) {
          HomePageStatus.initial => const SizedBox.shrink(),
          HomePageStatus.loadInProgress => const SizedBox.shrink(),
          HomePageStatus.loadSuccess => const SizedBox.shrink(),
          HomePageStatus.loadFailure => const SizedBox.shrink(),
        },
      ),
    );
  }
}
