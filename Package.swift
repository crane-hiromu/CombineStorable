// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CombineStorable",
    products: [
        .library(
            name: "CombineStorable",
            targets: ["CombineStorable"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CombineStorable",
            dependencies: []),
        .testTarget(
            name: "CombineStorableTests",
            dependencies: ["CombineStorable"]),
    ]
)
