enum RideStatus {
  pendingApproval,
  rejected,
  pending,
  onGoing,
  cancelled,
  completed,
}

enum ChecksheetStatus { submitted, draft, review }

enum BookingStatus {
  pendingApproval,
  rejected,
  pending,
  onGoing,
  cancelled,
  completed,
}

enum QuestionType {
  multipleChoice,
  mupltipleSelect,
  shortAnswer,
  longAnswer,
  number,
  date,
  mupltipleSelectYN
}

class EnumValues<T> {
  Map<int, T>? map;
  Map<T, int>? reverseMap;

  EnumValues(this.map);

  Map<T, int> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
