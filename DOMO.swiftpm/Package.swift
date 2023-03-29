// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "DOMO",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "DOMO",
            targets: ["AppModule"],
            bundleIdentifier: "ID.DOMO",
            teamIdentifier: "Q6S8GWB6BP",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .movieReel),
            accentColor: .presetColor(.yellow),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/matteopuc/swiftui-navigation-stack", "1.0.0"..<"2.0.0")
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "NavigationStack", package: "swiftui-navigation-stack")
            ],
            path: "."
        )
    ]
)