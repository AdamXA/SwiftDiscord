// swift-tools-version:4.2

// The MIT License (MIT)
// Copyright (c) 2016 Erik Little

// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
// documentation files (the "Software"), to deal in the Software without restriction, including without
// limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
// Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
// Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
// BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
// EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

import PackageDescription

var deps: [Package.Dependency] = [
    .package(url: "https://github.com/vapor/websocket-kit", .revision("d2fbfc28cb08e7a41644a92da16a383c8f9cc6f4")),
    .package(url: "https://github.com/IBM-Swift/BlueSocket", .upToNextMinor(from: "1.0.0"))
]

var targetDeps: [Target.Dependency] = ["WebSocketKit", "COPUS", "Sodium", "Socket"]

let package = Package(
    name: "SwiftDiscord",
    products: [
        .library(name: "SwiftDiscord", targets: ["SwiftDiscord"])
    ],
    dependencies: deps,
    targets: [
        .target(name: "SwiftDiscord", dependencies: targetDeps),
        .systemLibrary(name: "COPUS", pkgConfig: "opus"),
        .systemLibrary(name: "Sodium", pkgConfig: "libsodium"),
        .testTarget(name: "SwiftDiscordTests", dependencies: ["SwiftDiscord"]),
    ]
)
