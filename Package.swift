// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "swift_concurrency_hooks",
    targets: [
        .target(name: "ConcurrencyRuntimeC"),
        .executableTarget(
            name: "swift_concurrency_hooks",
            dependencies: [.target(name: "ConcurrencyRuntimeC")])
    ]
)
