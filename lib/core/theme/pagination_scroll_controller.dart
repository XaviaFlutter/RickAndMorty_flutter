import 'package:flutter/material.dart';

class PaginationScrollController {
  late ScrollController scrollController;
  bool isLoading = false;
  bool stopLoading = false;
  int currentPage = 2;
  double boundaryOffset = 0.7;
  late Future<void> Function() loadAction;

  void init(
      {Function? initAction, required Future<void> Function() loadAction}) {
    if (initAction != null) {
      initAction();
    }
    this.loadAction = loadAction;
    scrollController = ScrollController()..addListener(scrollListener);
  }

  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
  }

  void scrollListener() {
    if (!stopLoading) {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent * boundaryOffset &&
          !isLoading) {
        loadAction();
        isLoading = true;
        isLoading = false;
        currentPage++;
        boundaryOffset = 1 - 1 / (currentPage * 2);
        print(currentPage);
      }
    }
  }
}
