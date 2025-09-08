// ============================
// file: lib/provider/student_profile_provider.dart
// Provider for state management with algorithms for selection & sorted insert
// ============================
import 'dart:collection';
import 'package:eduwise/screens/student-dashboard/profile/profile_model.dart';
import 'package:flutter/foundation.dart';

class StudentProfileProvider extends ChangeNotifier {
  // ✅ Map for O(1) access by id (Data Structure for performance)
  final Map<String, StudenProfileModel> _profiles = {};

  // currently selected user id (so UI can switch profiles)
  String? _currentId;

  UnmodifiableMapView<String, StudenProfileModel> get profiles =>
      UnmodifiableMapView(_profiles);
  StudenProfileModel? get current =>
      _currentId != null ? _profiles[_currentId] : null;

  // ✅ Load demo users (3 as requested)
  void loadDemoUsers() {
    if (_profiles.isNotEmpty) return;

    final u1 = StudenProfileModel(
      id: 'u1',
      fullName: 'Ariana Rahman',
      email: 'ariana.rahman@example.com',
      phone: '+8801711000001',
      imageUrl: 'https://i.pravatar.cc/300?img=16',
      personal: StudentPersonalDetails(
        gender: Gender.female,
        presentAddress: 'House 12, Road 8',
        presentCity: 'Dhaka',
        presentCountry: 'Bangladesh',
        dateOfBirth: DateTime(1999, 6, 12),
        nationality: 'Bangladeshi',
        idType: IdType.passport,
        idNumber: 'BX1234567',
        passportIssue: DateTime(2021, 1, 10),
        passportExpiry: DateTime(2031, 1, 9),
      ),
      education: [
        StudentEducation(
          degree: 'BSc in CSE',
          institution: 'BUET',
          startDate: DateTime(2018, 1, 1),
          endDate: DateTime(2022, 12, 31),
          grade: 'CGPA 3.80/4.00',
        ),
        StudentEducation(
          degree: 'HSC (Science)',
          institution: 'Viqarunnisa Noon College',
          startDate: DateTime(2016, 1, 1),
          endDate: DateTime(2017, 12, 31),
          grade: 'GPA 5.00/5.00',
        ),
      ],
    );

    final u2 = StudenProfileModel(
      id: 'u2',
      fullName: 'Md. Farhan Islam',
      email: 'farhan.islam@example.com',
      phone: '+8801711000002',
      imageUrl: 'https://i.pravatar.cc/300?img=32',
      personal: StudentPersonalDetails(
        gender: Gender.male,
        presentAddress: 'Lane 5, Block C',
        presentCity: 'Chattogram',
        presentCountry: 'Bangladesh',
        dateOfBirth: DateTime(1997, 11, 2),
        nationality: 'Bangladeshi',
        idType: IdType.nid,
        idNumber: '1987654321',
      ),
      education: [
        StudentEducation(
          degree: 'MBA',
          institution: 'IBA, University of Dhaka',
          startDate: DateTime(2022, 1, 1),
          endDate: DateTime(2024, 12, 31),
          grade: 'CGPA 3.70/4.00',
        ),
        StudentEducation(
          degree: 'BBA',
          institution: 'University of Dhaka',
          startDate: DateTime(2018, 1, 1),
          endDate: DateTime(2021, 12, 31),
          grade: 'CGPA 3.65/4.00',
        ),
      ],
    );

    final u3 = StudenProfileModel(
      id: 'u3',
      fullName: 'Nusrat Jahan',
      email: 'nusrat.jahan@example.com',
      phone: '+8801711000003',
      imageUrl: 'https://i.pravatar.cc/300?img=47',
      personal: StudentPersonalDetails(
        gender: Gender.female,
        presentAddress: 'Sector 4, Uttara',
        presentCity: 'Dhaka',
        presentCountry: 'Bangladesh',
        dateOfBirth: DateTime(2000, 2, 20),
        nationality: 'Bangladeshi',
        idType: IdType.passport,
        idNumber: 'BY7654321',
        passportIssue: DateTime(2022, 5, 1),
        passportExpiry: DateTime(2032, 4, 30),
      ),
      education: [
        StudentEducation(
          degree: 'BA in English',
          institution: 'Jahangirnagar University',
          startDate: DateTime(2019, 1, 1),
          endDate: DateTime(2023, 12, 31),
          grade: 'CGPA 3.92/4.00',
        ),
      ],
    );

    // Maintain desc order by endDate for each user’s education
    _profiles[u1.id] = _sortedByEndDate(u1);
    _profiles[u2.id] = _sortedByEndDate(u2);
    _profiles[u3.id] = _sortedByEndDate(u3);

    _currentId = 'u1'; // default selection
    notifyListeners();
  }

  // ✅ Utility: keeps education sorted DESC by endDate (simple algorithm)
  StudenProfileModel _sortedByEndDate(StudenProfileModel m) {
    final sorted = [...m.education]
      ..sort((a, b) => b.endDate.compareTo(a.endDate));
    return m.copyWith(education: sorted);
  }

  // ✅ Switch profiles in O(1)
  void selectProfile(String id) {
    if (!_profiles.containsKey(id)) return;
    _currentId = id;
    notifyListeners();
  }

  // ✅ Insert education keeping list sorted (binary insertion style)
  void addEducation(StudentEducation e) {
    if (current == null) return;
    final list = [...current!.education];

    // Find insertion index (desc by endDate)
    int low = 0, high = list.length;
    while (low < high) {
      final mid = (low + high) >> 1;
      if (list[mid].endDate.isAfter(e.endDate)) {
        low = mid + 1;
      } else {
        high = mid;
      }
    }
    list.insert(low, e);

    final updated = current!.copyWith(education: list);
    _profiles[updated.id] = updated;
    notifyListeners();
  }

  // ✅ Update top-level info
  void updateBasics({
    String? fullName,
    String? email,
    String? phone,
    String? imageUrl,
  }) {
    if (current == null) return;
    final updated = current!.copyWith(
      fullName: fullName,
      email: email,
      phone: phone,
      imageUrl: imageUrl,
    );
    _profiles[updated.id] = updated;
    notifyListeners();
  }

  // ✅ Update personal details
  void updatePersonal(StudentPersonalDetails personal) {
    if (current == null) return;
    final updated = current!.copyWith(personal: personal);
    _profiles[updated.id] = updated;
    notifyListeners();
  }

  void setCurrentById(int i) {}
}
