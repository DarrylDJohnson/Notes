import 'package:flutter/material.dart';

enum SortBy { dateCreated, dateLastUpdated, alphabetic }

extension SortByExt on String {

  SortBy toSortBy() {
    switch (this) {
      case "dateCreated":
        return SortBy.dateCreated;
      case "dateLastUpdated":
        return SortBy.dateLastUpdated;
      case "alphabetic":
        return SortBy.alphabetic;
      default:
        return SortBy.dateCreated;
    }
  }
}