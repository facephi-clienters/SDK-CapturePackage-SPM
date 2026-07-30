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
        .package(url: "https://github.com/airbnb/lottie-spm.git", .upToNextMinor(from: "4.4.0")),
        .package(url: "https://github.com/facephi-clienters/SDK-CorePackage-SPM.git", .exactItem("2.10.0")),
        .package(url: "https://github.com/facephi-clienters/FPHICaptureWidget-SPM.git", .exactItem("1.4.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SDK-CapturePackage-SPM",
            dependencies: ["captureComponent",
                           "SDK-CorePackage-SPM",
                           .product(name: "Lottie", package: "lottie-spm"),
                           .product(name: "FPHICaptureWidget", package: "FPHICaptureWidget-SPM")
                          ],
        ),
        .binaryTarget(name: "captureComponent",
        url: "https://facephicorp.jfrog.io/artifactory/spm-pro-fphi/SDK/FPHISDKCaptureComponent/2.10.0/captureComponent.zip",
        checksum: "c7bc8ca09abb3a6e7771247023c04f479ffdbc9fc704c93bc00b814e365fc770"),
    ]
)
