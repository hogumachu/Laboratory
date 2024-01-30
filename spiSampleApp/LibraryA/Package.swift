// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LibraryA",
    products: [
        .library(
            name: "LibraryA",
            targets: ["LibraryA"]
        ),
    ],
    targets: [
        .target(
            name: "LibraryA"
        )
    ]
)
