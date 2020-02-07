![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/djanta/djanta-java-parent)
![GitHub All Releases](https://img.shields.io/github/downloads/djanta/djanta-java-parent/total)
[![Maven Central](https://img.shields.io/maven-central/v/io.djanta/djanta-java-parent.svg?maxAge=2592000)](http://search.maven.org/#artifactdetails%7Cio.djanta%7Cdjanta-java-parent)
![Build (Snapshot)](https://github.com/djanta/djanta-java-parent/workflows/Build%20(Verify%20&%20Deploy)/badge.svg)
![Build (Develop)](https://github.com/djanta/djanta-java-parent/workflows/Build%20(Verify%20&%20Test)/badge.svg?branch=develop)

# Our 3rd party Bill Of Materials (BOM)
This project houses either our community & enterprise Maven Bill Of Materials for third party usage.

# Maven `POM`

Our root parent `POM` provide some defaults plugin and dependency configurations that'll be used internally by 
out `community` and  `enterprise` applications and can also be used and any third external application as a base 
reference for their applications or maven based projects.

# Contribution

As an opensource project, anyone of you guys whom intent to enhance or fix any `issue` related to this repository is very welcome. To do so, you can then clone this repository as follow:

```shell
git clone git@github.com:djanta/djanta-java-parent.git
cd djanta-java-parent
mvn clean verify
```

Once you passed the verification step, you can start contributing to your enhancement or fixiture.

## Usage

Simply define the following `<parent>` in your `pom.xml`:
```xml
<parent>
  <groupId>io.djanta</groupId>
  <artifactId>parent</artifactId>
  <version>[THE VERSION YOU TARGET]</version>
</parent>
```

# Documentation

## Table Of Content
* [Using the BOM dependencies](#using-the-bom-dependencies)
* [Using the parent POM](#using-the-parent-pom)
* [How to update](#how-to-update)
* [Coding Style](#conding-styule)

### Using the BOM dependencies ([TOC](#table-of-content))

This BOM provides version and scope for all  3rd-party dependencies required we use for our own `community` and `enterprise` libraries, components and services.

As we provided all the 3rd-party dependencies as managed, importing this `BOM` does not automatically create your project dependencies, 
it just makes the version informations available so that the underling project `POM` dependencies section just needs to be update as needed with the `groupId` & `artifactId` for the given 3rd-party dependendy.

With this in mind, managing and maintaining your project dependencies version will be delegate by default the `BOM`.
To be able to use the 3rd-party managed version dependencies in your project, you'll be required to import the `BOM` as follow:

```xml
<dependencyManagement>
  <dependencies>
    <scope>import</scope>
    <groupId>io.djanta</groupId>
    <artifactId>djanta-java-bom</artifactId>
    <version>${io.djanta.version}</version>
    <type>pom</type>
  </dependencies>
</dependencyManagement>
```

### Using the parent POM ([TOC](#table-of-content))

As we also pre-bundle some sort of plugins configuration to perferm some minimum requirement such as: `jaccoco`, `Code stylecheck`, `Code formatting`, `Header licensing` and much more,
we strongly recommend that you take avantage on this by directly your main project `POM` as child of our root level `POM`.

Inhieriting from `io.djanta:parent:[VERSION]` give you the following capabilities for your maven build:

* Java `version` compiler. As today, the current verson of our parent `POM` provide a support for *java* (_8_) compiler. This will be updated as peer of the `djanta-java-parent` versioning.
* Enterprise *DevOps* compliant Maven reslease plugin setup
* Code analysis `prereqs` (Junit test running, Covertura coverage generation)
* Create a *-source* `JAR` and a *-javadoc* `JAR` as the component.

To inherit form `djanta-java-parent`, edit or create the parent element in your application's project `POM`, as follow:

```xml
<parent>
  <groupId>io.djanta</groupId>
  <artifactId>parent</artifactId>
  <version>${io.djanta.version}</version>
</parent>
```

### How to update ([TOC](#table-of-content))

When we update our `io.djanta:parent` or `io.djanta:djanta-java-bom` then we should follow the release process provided in `./travis/release.sh`.

Once we have release the artifacts, we also update their entries in all our `community` and/or `enterprise` subadjacent dependencies.

### Coding Style ([TOC](#table-of-content))

As we've strongly organize and normalized the project structure, if you occasionally need to either manually upgrade or downgrade a dependency or a plugin version, you can then do so. 

To specify which version of a dependency or plugin you'd like to use, simply place the following fragment within the property tag of your project `POM` configuration as global property or at 
at any `profile` property level.

```xml
<maven.plugin.{PLUGIN_NAME}.version>any expected version</maven.plugin.{PLUGIN_NAME}.version>
```

### Naming Convention

To ensure a better comprehension, better stability and easy maintainable either pluging version, dependency version or any specific configuration, we've established a simple naming convention as follow.

Doing so, we strongly recommend while declaring your:

#### Plugin version:

To prefix the property with: `maven.plugin.` then suffixed with `.version`. Therefore, the final result will look somewhat like this: *_<`maven.plugin.`{PLUGIN_NAME}.`version`>MY VERSION</`maven.plugin.`{PLUGIN_NAME}`.version`>_*

Example:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
    <modelVersion>4.0.0</modelVersion>
    
    ...

    <properties>
        <maven.plugin.resource.version>OVERRIDED_VERSION</maven.plugin.resource.version>
        ...
    </properties>
    ... or
    <profiles>
        <profile>
            <id>...</id>
            <properties>
                <maven.plugin.resource.version>OVERRIDED_VERSION</maven.plugin.resource.version>
                ...
            </properties>
        </profile>
    </profiles>
</project>
```

#### Dependency version:

To prefix with the dependency groupId: `org.slf4j.` then suffixed with `.version`. Therefore, the final result will look somewhat like this: *_<`org.`[slf4j].`version`>MY VERSION</`org.`[slf4j]`.version`>_*

Example:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
    <modelVersion>4.0.0</modelVersion>
    
    ...

    <properties>
        <org.slf4j.version>OVERRIDED_VERSION</org.slf4j.version>
        ...
    </properties>
    ... or
    <profiles>
        <profile>
            <id>...</id>
            <properties>
                <org.slf4j.version>OVERRIDED_VERSION</org.slf4j.version>
                ...
            </properties>
        </profile>
    </profiles>
</project>
```

#### Confguration:

Also to generalize your plugin configuration properties, we strongly recommend that you define that you define those properties as follow:  *_<`mvn.`{PLUGIN_NAME}.{PROPERTY_NAME}>MY VALUE</`mvn.`{PLUGIN_NAME}.{PROPERTY_NAME}>_*