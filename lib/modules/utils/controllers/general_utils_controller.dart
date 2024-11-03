// Packages
import 'package:intl/intl.dart';

class GeneralUtilsController {
  String toUpperCase(String text) {
    if (text.isEmpty) {
      return text; // Retorna a string vazia se estiver vazia
    }
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  formatDate(timestamp) {
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);

    String formattedDate = DateFormat('HH:mm    dd/MM/yyyy ').format(date);

    return formattedDate;
  }
}
