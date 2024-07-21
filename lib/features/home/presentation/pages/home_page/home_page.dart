// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:tv_guide/app/app_route_manager.dart';
import 'package:tv_guide/core/theme/app_colors.dart';
import 'package:tv_guide/core/theme/app_images_paths.dart';
import 'package:tv_guide/core/widgets/custom_scaffold.dart';
import 'package:tv_guide/features/home/presentation/cubit/home_page_cubit.dart';
import 'package:tv_guide/features/home/presentation/pages/home_page/home_page_initial.dart';
import 'package:tv_guide/features/home/presentation/pages/home_page/home_page_load_error.dart';
import 'package:tv_guide/features/home/presentation/pages/home_page/home_page_load_success.dart';

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

        if (state.pageStatus.isLoadSuccess && state.selectedShow != null) {
          context.goToShowDetails(state.selectedShow!);
        }

        if (state.logOutStatus.isLoadSuccess) {
          context.goToLogin();
        }
      },
      builder: (context, state) {
        return CustomScaffold(
          overlayPortalController: overlayController,
          appBar: AppBar(
            leading: Image.asset(AppImagePaths.logoTransparentBg, height: 56),
            centerTitle: true,
            title: Text(
              'TV GUIDE',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
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
          body: Column(
            children: [
              TextFormField(
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(HeroiconsOutline.magnifyingGlass),
                ),
                onFieldSubmitted: (value) {
                  homePageCubit.fetchShows(name: value);
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Builder(
                    builder: (context) {
                      if (state.pageStatus.isInitial) {
                        return const HomePageInitial();
                      }

                      if (state.pageStatus.isLoadFailure) {
                        return const HomePageLoadError();
                      }

                      if (state.pageStatus.isLoadInProgress && state.showsList.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      return HomePageLoadSuccess(
                        showsList: state.showsList,
                        onShowSelected: homePageCubit.fetchShowById,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
