// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-6.2-test",
    platforms: [
        // .macOS(.v26) works but .macOS(.v15) fail
        .macOS(.v15),
    ],
    products: [
        .library(
            name: "swift-6.2-test",
            targets: [
                "swift-6.2-test"
            ],
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-subprocess.git", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "swift-6.2-test",
            dependencies: [
                .product(name: "Subprocess", package: "swift-subprocess"),
            ],
        ),
        .testTarget(
            name: "swift-6.2-testTests",
            dependencies: [
                "swift-6.2-test",
            ],
        ),
    ]
)
