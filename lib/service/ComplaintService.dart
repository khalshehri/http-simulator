import 'package:backend_api/entity/Complaint.dart';
import 'package:backend_api/repository/ComplaintRepository.dart';
import 'package:backend_api/utils/SequenceUtil.dart';
import '../repository/RepositoryFacroty.dart';

class ComplaintService {
  final ComplaintRepository? _complaintRepository =
      RepositoryFactory.getComplaintRepository;

  void save(Complaint input) {
    input.setId = SequenceUtils.nextComplaintSequence;
    _complaintRepository?.save(input);
  }

  List<Complaint>? findAll(int userId) {
    return _complaintRepository?.findAllComplaintsByUserId(userId);
  }

  Complaint? findOneById(int complainId) {
    return _complaintRepository?.findEntityById(complainId) as Complaint;
  }
}
