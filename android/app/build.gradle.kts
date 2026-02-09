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
    ndkVersion = "28.0.12433566"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    // Enable 16KB page size support for Android 15+
    packaging {
        jniLibs {
            useLegacyPackaging = false
        }
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.cashift"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 24
        targetSdk = 35
        versionCode = 120
        versionName = "1.5.3"
        multiDexEnabled = true
        // Enable 16KB page alignment
        ndk {
            // Ensure 16KB page size alignment for Android 15+
            abiFilters += listOf("arm64-v8a", "x86_64")
        }
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
}

flutter {
    source = "../.."
}

dependencies {

    // ─── NEW: runtime that L8 needs when desugaring ───────────
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    // 2.1.4 is the version the plugin docs show; 2.1.5 is the latest preview. :contentReference[oaicite:0]{index=0}
}