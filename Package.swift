// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FriendsScene",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FriendsScene",
            targets: ["FriendsScene"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ivanKispaj/LoadService.git", from: Version(stringLiteral: "1.0.4")),
        .package(url: "https://github.com/ivanKispaj/VKDataModel.git", from: Version(stringLiteral: "1.0.0")),
        .package(url: "https://github.com/ivanKispaj/CustomView.git", from: Version(stringLiteral: "1.0.1"))
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FriendsScene",
            dependencies: [
                .product(name: "LoadService", package: "LoadService"),
                .product(name: "VKDataModel", package: "VKDataModel"),
                .product(name: "CustomView", package: "CustomView")
            ]
        ),
//        .target(
//            name: "FriendsViewModel",
//            dependencies: ["FriendsScene"]),
//        
        .testTarget(
            name: "FriendsSceneTests",
            dependencies: ["FriendsScene"]),
    ]
)
