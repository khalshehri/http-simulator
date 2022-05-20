import 'package:backend_api/repository/BadgeRepository.dart';
import 'package:backend_api/repository/ComplaintRepository.dart';
import 'package:backend_api/repository/OfferRepository.dart';
import 'package:backend_api/repository/TaskRepository.dart';
import 'package:backend_api/repository/UserRepository.dart';

class RepositoryFactory {
  static UserRepository? _userRepository;
  static BadgeRepository? _badgeRepository;
  static TaskRepository? _taskRepository;
  static OfferRepository? _offerRepository;
  static ComplaintRepository? _complaintRepository;

  static UserRepository? get getUserRepository {
    _userRepository ??= UserRepository();
    return _userRepository;
  }

  static BadgeRepository? get getBadgeRepository {
    _badgeRepository ??= BadgeRepository();
    return _badgeRepository;
  }

  static TaskRepository? get getTaskRepository {
    _taskRepository ??= TaskRepository();
    return _taskRepository;
  }

  static OfferRepository? get getOfferRepository {
    _offerRepository ??= OfferRepository();
    return _offerRepository;
  }

  static ComplaintRepository? get getComplaintRepository {
    _complaintRepository ??= ComplaintRepository();
    return _complaintRepository;
  }
}
