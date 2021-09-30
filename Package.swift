// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RefactoringForSwift",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "RefactoringForSwift",
            targets: ["RefactoringForSwift"]),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "RefactoringForSwift",
            dependencies: []),
        .testTarget(
            name: "RefactoringForSwiftTests",
            dependencies: ["RefactoringForSwift"]),
    ]
)
