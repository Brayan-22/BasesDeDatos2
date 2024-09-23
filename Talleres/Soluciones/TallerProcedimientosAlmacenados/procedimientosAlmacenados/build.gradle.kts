plugins {
    id("java")
    id("com.github.johnrengelman.shadow") version "7.1.2"
}
group = "org.bd2"
//version = "1.0"

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(platform("org.junit:junit-bom:5.10.0"))
    testImplementation("org.junit.jupiter:junit-jupiter")
    implementation("org.postgresql:postgresql:42.7.3")
    implementation("com.massisframework:j-text-utils:0.3.4")
}

tasks.jar{
    manifest{
        attributes["Main-Class"] = "com.bd2.Main"
    }
}
tasks.test {
    useJUnitPlatform()
}