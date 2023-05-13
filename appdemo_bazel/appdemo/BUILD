load("@rules_cc//cc:defs.bzl", "objc_library")
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load(
    "@rules_xcodeproj//xcodeproj:defs.bzl",
    "top_level_target",
    "xcodeproj",
)

objc_library(
    name = "demoClasses",
    srcs = [
        "demo/AppDelegate.m",
        "demo/ViewController.m",
        "demo/SceneDelegate.m",
        "demo/main.m",
    ],
    hdrs = glob(["demo/*.h"]),
    data = glob(["demo/Base.lproj/*.storyboard", "demo/Assets.xcassets/*/*.*"]),
)

ios_application(
    name = "appdemo",
    bundle_id = "live.bilibili.cn",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = [":demo/Info.plist"],
    launch_storyboard = "demo/Base.lproj/LaunchScreen.storyboard",
    app_icons = select({
       "//conditions:default": glob([
            "demo/Assets.xcassets/AppIcon.appiconset/*.png", 
            "demo/Assets.xcassets/AppIcon.appiconset/*.json",
        ]) 
    }),
    minimum_os_version = "13.0",
    provisioning_profile = "App_custom.mobileprovision",
    visibility = ["//visibility:public"],
    deps = [":demoClasses"],
)

xcodeproj(
    name = "xcodeproj",
    build_mode = "bazel",
    project_name = "appdemo",
    tags = ["manual"],
    top_level_targets = [
        top_level_target(
            ":appdemo",
            target_environments = ["device", "simulator"],
        ),
    ],
)
