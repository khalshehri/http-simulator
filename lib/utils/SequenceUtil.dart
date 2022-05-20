class SequenceUtils {
  static int _userSequence = 1;
  static int _offerSequence = 1;
  static int _taskSequence = 1;
  static int _complaintSequence = 1;
  static int _badgeSequence = 1;

  static int get nextUserSequence => _userSequence++;
  static int get nextOfferSequence => _offerSequence++;
  static int get nextTaskSequence => _taskSequence++;
  static int get nextBadgeSequence => _complaintSequence++;
  static int get nextComplaintSequence => _badgeSequence++;
}
