import '../entity/Complaint.dart';
import '../repository/ComplaintRepository.dart';
import '../repository/RepositoryFacroty.dart';
import '../utils/SequenceUtil.dart';

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
