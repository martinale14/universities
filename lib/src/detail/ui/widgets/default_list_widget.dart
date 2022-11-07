import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:universities/core/utils/app_colors.dart';
import 'package:universities/core/widgets/app_text.dart';
import 'package:universities/src/detail/viewmodel/university_detail_viewmodel.dart';

class DefaultListWidget extends HookViewModelWidget<UniversityDetailViewmodel> {
  const DefaultListWidget({
    super.key,
    required this.title,
    required this.items,
    this.onTap,
  });

  final List<String> items;
  final String title;
  final Function(String url)? onTap;

  @override
  Widget buildViewModelWidget(
          BuildContext context, UniversityDetailViewmodel viewModel) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            title,
            fontSize: 18,
            fontWeigth: AppFontWeigth.semibold,
          ),
          const SizedBox(height: 5),
          ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (_, itemIndex) => ListTile(
              onTap: onTap != null ? () => onTap!(items[itemIndex]) : null,
              leading: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
              ),
              title: AppText(
                items[itemIndex],
                color: AppColors.secondary,
              ),
              trailing: onTap != null
                  ? const Icon(
                      Icons.open_in_new_rounded,
                      color: AppColors.secondary,
                    )
                  : null,
            ),
          ),
        ],
      );
}
