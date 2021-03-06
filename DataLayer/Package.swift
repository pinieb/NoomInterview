// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "DataLayer",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DataLayer",
            targets: ["DataLayer"]),
    ],
    dependencies: [
        .package(path: "../NetworkEngine")
    ],
    targets: [
        .target(
            name: "DataLayer",
            dependencies: ["NetworkEngine"]),
    ]
)
