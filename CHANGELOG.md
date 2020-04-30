# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://github.com/djanta/djanta-java-parent/compare/v1.2.1...HEAD
[1.2.1]: https://github.com/djanta/djanta-java-parent/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/djanta/djanta-java-parent/compare/v0.0.3...v1.2.0
[0.0.3]: https://github.com/djanta/djanta-java-parent/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/djanta/djanta-java-parent/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/djanta/djanta-java-parent/releases/tag/v0.0.1