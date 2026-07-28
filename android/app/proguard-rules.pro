# Flutter
-keep class io.flutter.app.FlutterApplication { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.plugins.** { *; }

# Dart/JNI reflection
-keep class dart.** { *; }
-keepattributes Signature
-keepattributes *Annotation*

# Drift (database)
-keep class * extends org.simormc.jawn.sqlcipher.** { *; }
-keep class drift.** { *; }
-keep class ** extends drift.** { *; }

# Freezed / Json Serializable
-keep class com.google.gson.** { *; }
-keep class * extends com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}
-keep class **_$* { *; }

# WorkManager
-keep class * extends androidx.work.Worker
-keep class * extends androidx.work.ListenableWorker

# flutter_local_notifications
-keep class com.dexterous.** { *; }
-keep class me.carda.** { *; }

# flutter_secure_storage
-keep class com.itnomals.flutter_secure_storage.** { *; }

# connectivity_plus
-keep class com.baseflow.connectivityplus.** { *; }

# go_router
-keep class go_router.** { *; }

# shared_preferences
-keep class io.flutter.plugins.sharedpreferences.** { *; }

# path_provider
-keep class io.flutter.plugins.pathprovider.** { *; }

# Play Core (Flutter deferred components)
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
-dontwarn com.google.android.play.core.splitinstall.**
-dontwarn com.google.android.play.core.tasks.**
