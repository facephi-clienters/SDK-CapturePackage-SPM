// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDK-CapturePackage-SPM",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SDK-CapturePackage-SPM",
            targets: ["SDK-CapturePackage-SPM", "captureComponent"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "git@github.com:airbnb/lottie-spm", .upToNextMinor(from: "4.4.0")),
        .package(url: "git@github.com:facephi-clienters/SDK-CorePackage-SPM.git", .exactItem("2.7.0")),
        .package(url: "git@github.com:facephi-clienters/FPHICaptureWidget-SPM.git", .exactItem("1.1.3"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SDK-CapturePackage-SPM",
            dependencies: ["captureComponent",
                           "SDK-CorePackage-SPM",
                           .product(name: "Lottie", package: "lottie-spm"),
                           "FPHICaptureWidget-SPM"],
        ),
        .binaryTarget(name: "captureComponent",
        url: "https://facephicorp.jfrog.io/artifactory/spm-pro-fphi/SDK/FPHISDKCaptureComponent/2.7.0/captureComponent.zip",
        checksum: "74269d89fb216d25ad845bf2b16d2b225a786b21c04e6974ded4c0104495a411"),
    ]
)
