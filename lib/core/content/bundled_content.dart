import 'package:freezed_annotation/freezed_annotation.dart';

part 'bundled_content.freezed.dart';
part 'bundled_content.g.dart';

/// Types of bundled content items.
enum ContentType {
  holiday,
  observance,
  // Future: seasonal, awareness, etc.
}

/// Calendar system used by the content item.
enum ContentCalendarBasis { ethiopian, gregorian }

/// A single bundled content item (holiday, observance, etc.).
///
/// Items have stable IDs, four-language titles, and either fixed or
/// recurring dates. Fixed dates use month/day; recurring dates use a
/// rule string (e.g., "easter_offset:-2" for Ethiopian Easter).
@freezed
abstract class BundledContent with _$BundledContent {
  const factory BundledContent({
    /// Unique stable identifier (e.g., 'et_holiday_genna').
    required String id,

    /// Content type (holiday, observance).
    required ContentType type,

    /// Calendar basis for the date.
    required ContentCalendarBasis calendarBasis,

    /// Ethiopian month (1-13) if calendarBasis is ethiopian.
    int? ecMonth,

    /// Day of month (1-30/31) if calendarBasis is ethiopian.
    int? ecDay,

    /// Gregorian month (1-12) if calendarBasis is gregorian.
    int? gcMonth,

    /// Gregorian day of month (1-31) if calendarBasis is gregorian.
    int? gcDay,

    /// Recurrence rule string (null for fixed-date items).
    /// Format: "type:param" (e.g., "easter_offset:-2", "orthodox_easter:-1").
    String? recurrenceRule,

    /// English title.
    required String titleEn,

    /// Amharic title.
    required String titleAm,

    /// Afaan Oromo title.
    required String titleOm,

    /// Tigrinya title.
    required String titleTi,

    /// English description (nullable).
    String? descriptionEn,

    /// Amharic description (nullable).
    String? descriptionAm,

    /// Afaan Oromo description (nullable).
    String? descriptionOm,

    /// Tigrinya description (nullable).
    String? descriptionTi,

    /// Source or authority for this item.
    String? source,

    /// Content bundle version.
    @Default('1.0.0') String bundleVersion,

    /// Schema version for forward compatibility.
    @Default(1) int schemaVersion,
  }) = _BundledContent;

  factory BundledContent.fromJson(Map<String, dynamic> json) =>
      _$BundledContentFromJson(json);
}

/// A content bundle (collection of content items).
@freezed
abstract class ContentBundle with _$ContentBundle {
  const factory ContentBundle({
    /// Bundle identifier.
    required String id,

    /// Bundle display name.
    required String name,

    /// Whether this bundle is enabled by default.
    @Default(true) bool enabledByDefault,

    /// Content items in this bundle.
    required List<BundledContent> items,

    /// Bundle version.
    @Default('1.0.0') String version,
  }) = _ContentBundle;

  factory ContentBundle.fromJson(Map<String, dynamic> json) =>
      _$ContentBundleFromJson(json);
}
