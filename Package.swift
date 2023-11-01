// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

/*
 This source file is part of the Swift.org open source project

 Copyright 2015 – 2021 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

mport PackageDescription
import Firebase

let package = Package(
    name: "Candied OG",
    platforms: [ .iOS(.v14) ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Candied OG",
            targets: ["Candied OG"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name:"Firebase", url:"https://github.com/firebase/firebase-ios-sdk.git", from: "10.0.0"),
        //.package(name:"CocoaPods", url:"https://github.com/square/cocoapods-generate.git")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Candied OG",
            dependencies: [
                .prodcut(name: "FirebaseAuth", package:"Firebase")
                .prodcut(name:"FirebaseAnalytics", package:"Firebase")
                .prodcut(name:"FirebaseAnalyticsOnDeviceConversion", package:"Firebase")
                .prodcut(name:"FirebaseAnalyticsSwift", package:"Firebase")
                .prodcut(name:"FirebaseAnalyticsWithoutAdldSupport", package:"Firebase")
                .prodcut(name:"FirebaseAppCheck", package:"Firebase")
                .prodcut(name:"CocoaPods", package:"cocoapods-generate")
            ],
        .testTarget(
            name: "CandiedOGTests",
            dependencies: ["Candied OG"],
            path: "CandiedOG/Tests/Candied OGTests"),
    ]
)
