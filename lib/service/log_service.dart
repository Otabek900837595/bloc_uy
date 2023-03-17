
import 'package:logger/logger.dart';

class LogService {


    static final Logger _logger = Logger(
      filter: DevelopmentFilter(),
      printer: PrettyPrinter(),
    );

    static void d(String messages) {
      _logger.d(messages);
    }

    static void i(String messages) {
      _logger.d(messages);
    }


    static void w(String messages) {
      _logger.d(messages);
    }

    static void e(String messages) {
      _logger.d(messages);
    }
}