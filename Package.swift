// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "TreeSitterXML",
    products: [
        .library(name: "TreeSitterXML", targets: ["TreeSitterXML"]),
    ],
    dependencies: [
        // swift-tree-sitter main uses tree-sitter 0.25+ (matches grammar generated with tree-sitter 0.25.x).
        .package(url: "https://github.com/tree-sitter/swift-tree-sitter", branch: "main"),
    ],
    targets: [
        .target(
            name: "TreeSitterXML",
            dependencies: [],
            path: ".",
            exclude: [
                ".editorconfig",
                ".gitattributes",
                ".github",
                "binding.gyp",
                "bindings/c",
                "bindings/go",
                "bindings/node",
                "bindings/python",
                "bindings/rust",
                "Cargo.toml",
                "Cargo.lock",
                "CMakeLists.txt",
                "dtd",
                "go.mod",
                "go.sum",
                "package-lock.json",
                "package.json",
                "pyproject.toml",
                "README.md",
                "setup.py",
                "test",
                "tree-sitter.json",
                "xml/grammar.js",
                "xml/src/grammar.json",
                "xml/src/node-types.json",
            ],
            sources: [
                "xml/src/parser.c",
                "xml/src/scanner.c",
            ],
            resources: [
                .copy("queries/xml"),
            ],
            publicHeadersPath: "bindings/swift/xml/TreeSitterXML",
            cSettings: [
                .headerSearchPath("xml/src"),
            ],
        ),
        .testTarget(
            name: "TreeSitterXMLTests",
            dependencies: [
                .product(name: "SwiftTreeSitter", package: "swift-tree-sitter"),
                "TreeSitterXML",
            ],
            path: "bindings/swift/TreeSitterXMLTests",
        ),
    ],
    cLanguageStandard: .c11,
)
