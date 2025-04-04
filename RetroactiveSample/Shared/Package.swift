// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "Shared",
  platforms: [.iOS(.v18)],
  products: [
    .library(
      name: "DesignSystem",
      targets: ["DesignSystem"]
    ),
    .library(
      name: "Entity",
      targets: ["Entity"]
    ),
  ],
  targets: [
    .target(
      name: "DesignSystem"
    ),
    .target(
      name: "Entity"
    ),
  ]
)
