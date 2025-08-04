allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
// add These lines from here. in android/build.gradle  (NOT android/app/build.gradle)
subprojects {
        afterEvaluate {
            if (project.plugins.hasPlugin("com.android.application") ||
                project.plugins.hasPlugin("com.android.library")) {
                project.extensions.findByName("android")?.let { ext ->
                    (ext as? com.android.build.gradle.BaseExtension)?.apply {
                        compileSdkVersion(35)
                        buildToolsVersion = "35.0.0"
                    }
                }
            }
        }
    }
// to here
subprojects {
    project.evaluationDependsOn(":app")
}
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
