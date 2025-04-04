// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Feature",
  platforms: [.iOS(.v18)],
  products: [
    .library(
      name: "Detail",
      targets: ["Detail"]
    ),
    .library(
      name: "Home",
      targets: ["Home"]
    ),
  ],
  dependencies: [
    .package(path: "../Shared")
  ],
  targets: [
    .target(
      name: "Detail",
      dependencies: [
        .product(name: "DesignSystem", package: "Shared"),
        .product(name: "Entity", package: "Shared"),
      ]
    ),
    .target(
      name: "Home",
      dependencies: [
        .product(name: "DesignSystem", package: "Shared"),
        .product(name: "Entity", package: "Shared"),
      ]
    ),
  ]
)
