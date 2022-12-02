import ProjectDescription
import ProjectDescriptionHelpers

/*
 +-------------+
 |             |
 |     App     | Contains SampleAppTuist App target and SampleAppTuist unit-test target
 |             |
 +------+-------------+-------+
 |         depends on         |
 |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+
 
 */

// MARK: - Project

// Creates our project using a helper function defined in ProjectDescriptionHelpers

//let project = Project.app(name: "SampleAppTuist", platform: .iOS, additionalTargets: ["SampleAppTuistKit"])


let commonTarget = Target(
    name: "Common",
    platform: .iOS,
    product: .dynamicLibrary,
    bundleId: "common",
    sources: ["Packages/Common/**"]
)

let sampleAppTarget = Target(
    name: "SampleApps",
    platform: .iOS,
    product: .app,
    bundleId: "com.renjun.sample",
    infoPlist: .file(path: "SamplesApp/Info.plist"),
    sources: ["SamplesApp/**"],
    resources: ["SamplesApp/Resources/**"
               ],
    dependencies: [.target(name: "Common")]
)


let sampleAppUTTarget = Target(
    name: "SamplesAppTests",
    platform: .iOS,
    product: .unitTests,
    bundleId: "com.renjun.sampleUT",
    sources: ["SamplesAppTests/**"],
    dependencies: [
        .target(name: "SampleApps")
    ]
)

let project = Project(
    name: "SampleAppTuist",
    organizationName: "renjun",
    packages: [.remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .exact("5.6.1"))],
    targets: [
        sampleAppTarget,
        commonTarget,
        sampleAppUTTarget
    ]
)
