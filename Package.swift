// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "IQTextInputViewNotification",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "IQTextInputViewNotification",
            targets: ["IQTextInputViewNotification"]
        )
    ],
    targets: [
        .target(name: "IQTextInputViewNotification",
            path: "IQTextInputViewNotification",
            resources: [
                .copy("Assets/PrivacyInfo.xcprivacy")
            ],
            linkerSettings: [
                .linkedFramework("Combine"),
                .linkedFramework("UIKit")
            ]
        )
    ]
)
