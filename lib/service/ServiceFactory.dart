import 'BadgeService.dart';
import 'ComplaintService.dart';
import 'OfferService.dart';
import 'TaskService.dart';
import 'UserService.dart';

class ServiceFactory {
  static UserService? _userService;
  static BadgeService? _badgeService;
  static TaskService? _taskService;
  static OfferService? _offerService;
  static ComplaintService? _complaintService;

  static UserService? get getUserService {
    _userService ??= UserService();
    return _userService;
  }

  static BadgeService? get getBadgeService {
    _badgeService ??= BadgeService();
    return _badgeService;
  }

  static TaskService? get getTaskService {
    _taskService ??= TaskService();
    return _taskService;
  }

  static OfferService? get getOfferService {
    _offerService ??= OfferService();
    return _offerService;
  }

  static ComplaintService? get getComplaintService {
    _complaintService ??= ComplaintService();
    return _complaintService;
  }
}
