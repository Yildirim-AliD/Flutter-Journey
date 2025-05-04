# 📦 Değişiklik Günlüğü – Flutter Isar Projesi

## [v1.0.0] - İlk Stabil Yapılandırma (Isar ile Uyumlu)

### ✅ 1. `isar_flutter_libs` manifest sorunu giderildi
- **Dosya:**  
  `~/.pub-cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/android/src/main/AndroidManifest.xml`
- **Değişiklik:**
  ```diff
  - <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="dev.isar.isar_flutter_libs">
  + <manifest xmlns:android="http://schemas.android.com/apk/res/android">

###  ✅  2. namespace eksikliğine karşı proje yapılandırması
 - **Dosya:**
   `android/build.gradle.kts`
   - **Değişiklik:**
    ```diff
    allprojects {
        repositories {
            google()
            mavenCentral()
        }
        subprojects {
        afterEvaluate {
            val ext = project.extensions.findByName("android")
            if (ext is com.android.build.gradle.BaseExtension) {
                if (ext.namespace == null) {
                    ext.namespace = project.group.toString()
                }
            }
        }
    }
    }
###  ✅  3. ndkVersion güncellemesi
- **Dosya:**
   `android/app/build.gradle.kts`
- **Değişiklik:**
    ```diff
    ndkVersion = "27.0.12077973"
### ✅ 4. Gradle Plugin ve Kotlin versiyonları güncellendi
    - **Dosya:**
   `android/settings.gradle.kts`
- **Değişiklik:**
    ```diff
    id("com.android.application") version "8.7.0" apply false
    id("org.jetbrains.kotlin.android") version "2.0.20" apply false

  
