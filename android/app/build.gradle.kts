import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id ("com.google.gms.google-services")
}


android {
    namespace = "com.cashift"
    compileSdk = 35
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.cashift"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 24
        targetSdk = 35
        versionCode = 115
        versionName = "1.4.8"
        multiDexEnabled = true
    }
    val keystoreProperties = Properties()
    val keystorePropertiesFile = rootProject.file("key.properties")
    if (keystorePropertiesFile.exists()) {
        FileInputStream(keystorePropertiesFile).use {
            keystoreProperties.load(it)
        }
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = keystoreProperties["storeFile"]?.let { file(it as String) }
            storePassword = keystoreProperties["storePassword"] as String
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            isDebuggable = false
            isShrinkResources = true
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }

    lint {
        disable.add("InvalidPackage")
        checkReleaseBuilds = false
    }

//    lintOptions {
//        disable "InvalidPackage";
//        checkReleaseBuilds false
//    }
}


flutter {
    source = "../.."
}
// ❶ Declare the version you want every module to use
// -------------------------------------------------------------
//val cameraxVersion = "1.4.2"       // or "1.4.2" if you upgrade EVERYTHING
//// -------------------------------------------------------------
//// ❷ Force every configuration to use that exact version
//// -------------------------------------------------------------
//configurations.all {
//    resolutionStrategy {
//        force(
//            "androidx.camera:camera-core:$cameraxVersion",
//            "androidx.camera:camera-camera2:$cameraxVersion",
//            "androidx.camera:camera-lifecycle:$cameraxVersion",
//            "androidx.camera:camera-video:$cameraxVersion",
//            "androidx.camera:camera-view:$cameraxVersion",
//            "androidx.camera:camera-extensions:$cameraxVersion"
//        )
//    }
//}
// -------------------------------------------------------------
// ❸ Explicitly pull the same coordinates into this module
// -------------------------------------------------------------
dependencies {
//    implementation("androidx.camera:camera-core:$cameraxVersion")
//    implementation("androidx.camera:camera-camera2:$cameraxVersion")
//    implementation("androidx.camera:camera-lifecycle:$cameraxVersion")
//    implementation("androidx.camera:camera-video:$cameraxVersion")
//    implementation("androidx.camera:camera-view:$cameraxVersion")
//    implementation("androidx.camera:camera-extensions:$cameraxVersion")
    // ─── NEW: runtime that L8 needs when desugaring ───────────
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    // 2.1.4 is the version the plugin docs show; 2.1.5 is the latest preview. :contentReference[oaicite:0]{index=0}
}