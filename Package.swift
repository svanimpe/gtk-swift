// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "gtk-swift",
    targets: [
        .systemLibrary(name: "CGTK", pkgConfig: "gtk+-3.0"),
        .target(
            name: "GTK",
            dependencies: ["CGTK"]),
        .target(
            name: "example0",
            dependencies: ["GTK"]),
        .target(
            name: "example1",
            dependencies: ["GTK"]),
        .target(
            name: "example2",
            dependencies: ["GTK"]),
        .target(
            name: "example3",
            dependencies: ["CGTK"]),
        .target(
            name: "demo",
            dependencies: ["GTK"])
    ]
)
