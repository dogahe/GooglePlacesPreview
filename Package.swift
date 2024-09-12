// swift-tools-version: 5.5

import PackageDescription

let package = Package(
  name: "GooglePlacesSwift", platforms: [.iOS(.v15)],
  products: [.library(name: "GooglePlacesSwift", targets: ["GooglePlacesSwiftTarget"])],
  dependencies: [.package(url: "https://github.com/googlemaps/ios-places-sdk", from: "9.1.0")],
  targets: [
    .binaryTarget(
      name: "GooglePlacesSwift",
      url: "https://dl.google.com/geosdk/swiftpm/0.2.0/google_places_swift.xcframework.zip",
      checksum: "0b1daed4bff0d629fe9f939577b16a985ccbb8af9df42d5682ff09a22cf619b4"
    ),
    .target(
      name: "GooglePlacesSwiftTarget",
      dependencies: [
        "GooglePlacesSwift",
        .product(name: "GooglePlaces", package: "ios-places-sdk"),
      ],
      path: "PlacesSwift",
      sources: ["Empty.swift"],
      resources: [.copy("Resources/GooglePlacesSwiftResources/GooglePlacesSwift.bundle")],
      publicHeadersPath: "Sources"
    ),
  ]
)
