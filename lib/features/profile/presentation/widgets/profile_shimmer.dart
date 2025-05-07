import 'package:flutter/material.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/helpers/spacing.dart';

class ProfileSkeleton extends StatelessWidget {
  const ProfileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    // Same structure as shimmer but using static skeleton widgets
    return Column(
      children: [
        // Header container
        Container(
          color: AppColors.black,
          child: Column(
            children: [
              // User info and buttons area
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // User info row with skeleton elements
                    _buildUserInfoRowSkeleton(),
                    verticalSpace(16),
                    // Button rows with skeleton elements
                    _buildButtonsRowSkeleton(),
                  ],
                ),
              ),
              // Tab bar skeleton
              _buildTabBarSkeleton(),
            ],
          ),
        ),
        // Content area skeleton
        Expanded(child: _buildTabBarViewSkeleton()),
      ],
    );
  }

  Widget _buildUserInfoRowSkeleton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Avatar skeleton
        Column(
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: const BoxDecoration(
                color: Color(0xFF303030),
                shape: BoxShape.circle,
              ),
            ),
            verticalSpace(8),
            // Username skeleton
            Container(
              width: 60.0,
              height: 12.0,
              decoration: BoxDecoration(
                color: Color(0xFF303030),
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ],
        ),

        // Stats column skeletons
        _buildStatColumnSkeleton(),
        _buildStatColumnSkeleton(),
      ],
    );
  }

  Widget _buildStatColumnSkeleton() {
    return Column(
      children: [
        Container(
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
            color: Color(0xFF303030),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        verticalSpace(4),
        Container(
          width: 60.0,
          height: 12.0,
          decoration: BoxDecoration(
            color: Color(0xFF303030),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonsRowSkeleton() {
    return Row(
      children: [
        // Edit Profile button skeleton
        Expanded(
          flex: 3,
          child: Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: Color(0xFF303030),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        horizontalSpace(10),
        // Logout button skeleton
        Expanded(
          flex: 2,
          child: Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: Color(0xFF303030),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBarSkeleton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          // Watch List tab skeleton
          Expanded(
            child: Container(
              height: 46.0,
              margin: const EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                color: Color(0xFF303030),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          // History tab skeleton
          Expanded(
            child: Container(
              height: 46.0,
              margin: const EdgeInsets.only(left: 8.0),
              decoration: BoxDecoration(
                color: Color(0xFF303030),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBarViewSkeleton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemCount: 6, // Show 6 movie cards in skeleton
        itemBuilder: (_, __) => Container(
          decoration: BoxDecoration(
            color: Color(0xFF303030),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
