# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.0] - 2021-03-04

### `Added`
- Upgrage major version to `2.0.0`
- Optimizing the `integration testing` and `feature testing`

### `Change`
- Changing out internal git repository name to `maven-packages`

## [1.2.4] - 2021-02-04

### `Added`
- Introducing the property `mvn.github.repository` as the way to export and variabilize the target github hoster maven package

## [1.2.3] - 2020-10-29

### `Fixed`
- Switch maven repo url protocol from `http` to `https`

## [1.2.2] - 2020-10-15

### `Removed`
- Removed `org.mockserver.maven.StopMockServerTestListener` from `mockserver` junit steps listener
- Remove `mockserver` maven profile activation configuration: 
```xml
<activation>
  <property>
    <name>skipTests</name>
    <value>false</value>
  </property>
</activation>
```

### `Added`
- Upgrage `mockserver` dependency version to `5.10.0`
- Adding to dependencies `BOM` mockserver junit rule dependencies: `org.mock-server` and `mockserver-junit-jupiter`

## [1.2.1] - 2020-04-29
### `Fixed`
- Update the project(POM)  profile `license` by excluding any folder started by (.) e.g: `<exclude>**/.*/**</exclude>`

## [1.2.0] - 2020-04-10
### `Deprecated`
- Since the version [1.2.0] have become the latest validated global used, the following version till [1.1.9] are now deprecated for used.

### `Removed`
- Removed `DependencyManagment` from the parent (POM) and moved to dependency (BOM)
- Remove deprecated `github` release and tag invalid badge.

### `Fixed`
- Fix external `gpg` secure key sharing throug module [build gpg](https://github.com/djanta/djanta-build-gpg.git) repository
- Fix maven plugin `org.apache.maven.plugins:maven-gpg-plugin` to support shared external credential variable through `github` secret setting for each repository configuration
- Introducing the project explicit name `<name>${project.artifactId}</name>` in order to avoid following ossrh error:
```shell
ossrh deploy (Invalid POM: xxx.pom: Project name missing
```
while releasing or tempting to close the `ossrh` node for release or promoting purpose.


### `Security`
- Introducing `gpg` key(s) sharing [build gpg](https://github.com/djanta/djanta-build-gpg.git) to support `org.apache.maven.plugins:maven-gpg-plugin`

### `Changed`
- Introducing `djanta-java-bom` to support global shared `DependencyManagment`.

## [1.0.0] - 2019-06-20
### `Added`
- Version navigation.

## [0.0.3] - 2019-08-09
### `Added`
- "Why should I care?" section mentioning The Changelog podcast.

## [0.0.2] - 2019-07-10
### `Added`
- Explanation of the recommended reverse chronological release ordering.

## [0.0.1] - 2019-05-31
### `Added`
- This CHANGELOG file to hopefully serve as an evolving example of a
  standardized open source project CHANGELOG.
- CNAME file to enable GitHub Pages custom domain
- README now contains answers to common questions about CHANGELOGs

[Unreleased]: https://github.com/djanta/djanta-java-parent/compare/v2.0.0...HEAD
[2.0.0]: https://github.com/djanta/djanta-java-parent/compare/v1.2.3...v2.0.0
[1.2.3]: https://github.com/djanta/djanta-java-parent/compare/v1.2.3...v1.2.3
[1.2.2]: https://github.com/djanta/djanta-java-parent/compare/v1.2.1...v1.2.2
[1.2.1]: https://github.com/djanta/djanta-java-parent/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/djanta/djanta-java-parent/compare/v0.0.3...v1.2.0
[0.0.3]: https://github.com/djanta/djanta-java-parent/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/djanta/djanta-java-parent/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/djanta/djanta-java-parent/releases/tag/v0.0.1