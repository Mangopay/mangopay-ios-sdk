// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "checkout-ios-sdk",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v11),
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "checkout-ios-sdk",
            targets: ["checkout-ios-sdk"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/apollographql/apollo-ios", from: "0.9.5"),
         .package(url: "https://github.com/realm/SwiftLint", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "checkout-ios-sdk",
            dependencies: [
                .product(name: "Apollo", package: "apollo-ios"),
            ]),
        .testTarget(
            name: "checkout-ios-sdkTests",
            dependencies: ["checkout-ios-sdk"]),
        .plugin(name: "SwiftLintCommandPlugin.swift",
                capability: .command(
                    intent: .sourceCodeFormatting(),
                    permissions: [
                        .writeToPackageDirectory(reason: "This command reformats source files")
                    ]
                )
               )
    ]
)
