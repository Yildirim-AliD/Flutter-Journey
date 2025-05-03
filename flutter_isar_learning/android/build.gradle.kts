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

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
