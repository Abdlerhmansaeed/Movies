class AppStates {
  final int bottomNavBarIndex;
  final String userToken;

  const AppStates({
    required this.bottomNavBarIndex,
    required this.userToken,
  });

  factory AppStates.initial() =>
      const AppStates(bottomNavBarIndex: 0, userToken: '');

  AppStates copyWith({
    int? bottomNavBarIndex,
    String? userToken,
  }) =>
      AppStates(
        bottomNavBarIndex: bottomNavBarIndex ?? this.bottomNavBarIndex,
        userToken: userToken ?? this.userToken,
      );
}
