// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "md5_file_checksum",
  platforms: [
    .iOS("12.0"),
  ],
  products: [
    .library(name: "md5-file-checksum", targets: ["md5_file_checksum"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "md5_file_checksum",
      dependencies: []
    ),
  ]
)
