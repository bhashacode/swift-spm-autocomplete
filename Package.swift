// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "CCAutocomplete",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "CCAutocomplete",
            targets: ["CCAutocomplete"]
        )
    ],
    targets: [
        .target(
            name: "CCAutocomplete",
            path: "Sources/CCAutocomplete",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
