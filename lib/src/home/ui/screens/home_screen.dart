import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:universities/core/utils/enums.dart';
import 'package:universities/core/utils/translations.dart';
import 'package:universities/core/widgets/app_bar.dart';
import 'package:universities/core/widgets/app_base_screen.dart';
import 'package:universities/src/home/ui/widgets/app_bar_view_type_button_widget.dart';
import 'package:universities/src/home/ui/widgets/infinite_scroll_widget.dart';
import 'package:universities/src/home/viewmodel/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => AppBaseScreen(
        isLoading: viewModel.loading,
        appBar: appBar(
          lang.homeTittle,
          noBack: true,
          actions: const [
            AppBarViewTypeButtonWidget(Icons.grid_on_rounded, ViewType.grid),
            AppBarViewTypeButtonWidget(Icons.list_alt_rounded, ViewType.list),
          ],
        ),
        body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: InfiniteScrollwidget(
            universities: viewModel.universities ?? [],
            defineChild: viewModel.defineChild,
            setController: viewModel.setController,
          ),
        ),
      ),
    );
  }
}
