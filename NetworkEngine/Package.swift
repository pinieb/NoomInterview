// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "NetworkEngine",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "NetworkEngine",
            targets: ["NetworkEngine"]),
    ],
    targets: [
        .target(
            name: "NetworkEngine",
            dependencies: []),
    ]
)
