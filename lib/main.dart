import 'app/bootstrap.dart';
import 'core/config/app_flavor.dart';

/// Default entrypoint used by `flutter run` with no target. Mirrors
/// `main_development.dart`. Release builds must use the explicit flavor
/// entrypoints (`main_staging.dart`, `main_production.dart`).
void main() {
  bootstrap(AppFlavor.development);
}
