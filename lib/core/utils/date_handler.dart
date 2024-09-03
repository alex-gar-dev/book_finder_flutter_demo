import 'package:intl/intl.dart';

class DateHandler {
  static int getYearsOld({
    required String birthdate
  }) {
    try {
      DateTime birth = DateFormat('dd/MM/yyyy').parse(birthdate);
      DateTime now = DateTime.now();

      int edad = now.year - birth.year;
      
      if (now.month < birth.month || 
          (now.month == birth.month && now.day < birth.day)) {
        edad--;
      }
      return edad;
    } catch (_) {
      return 0;
    }
  }
}