import 'package:flutter/cupertino.dart';
import 'package:foodegaapp/models/FoodData.dart';

class ProfileInheritedData extends InheritedWidget {
  final List<FoodData> selectedListItems;

  const ProfileInheritedData({
    Key key,
    Widget child,
    @required this.selectedListItems,
  })  : assert(selectedListItems != null),
        super(key: key, child: child);

  static ProfileInheritedData of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<ProfileInheritedData>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return oldWidget != this;
  }
}
