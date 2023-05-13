# iOSBazelDemo
这是一个Bazel学习的仓库，通过将Xcode创建的Demo工程原封不动采用Bazel进行改造，同时提供Bazel命令帮助大家熟悉Bazel环境和命令。

## Xcode原始工程

AppDemo_Xcode文件夹下面是Xcode创建的原始工程，工程目录结构如下：

```bash
├── AppDemo
│   ├── AppDelegate.h
│   ├── AppDelegate.m
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   └── Contents.json
│   │   ├── Contents.json
│   │   └── Test.imageset
│   │       ├── Contents.json
│   │       └── Test.jpg
│   ├── Base.lproj
│   │   ├── LaunchScreen.storyboard
│   │   └── Main.storyboard
│   ├── Info.plist
│   ├── SceneDelegate.h
│   ├── SceneDelegate.m
│   ├── ViewController.h
│   ├── ViewController.m
│   └── main.m
└── AppDemo.xcodeproj
    ├── project.pbxproj
    ├── project.xcworkspace
    │   ├── contents.xcworkspacedata
    │   ├── xcshareddata
    │   │   ├── IDEWorkspaceChecks.plist
    │   │   └── swiftpm
    │   │       └── configuration
    │   └── xcuserdata
    │       └── tingyue.xcuserdatad
    │           └── UserInterfaceState.xcuserstate
    └── xcuserdata
        └── tingyue.xcuserdatad
            └── xcschemes
                └── xcschememanagement.plist
```

## Bazel工程

我其实就把原Xcode工程中的`AppDemo.xcodeproj`工程文件删除了，同时新增了一个`WORKSPACE`文件、一个`BUILD`文件和一个描述文件，对原Xcode工程改造后的Bazel项目目录如下：

```bash
├── WORKSPACE
└── appdemo
    ├── App_custom.mobileprovision
    ├── BUILD
    └── demo
        ├── AppDelegate.h
        ├── AppDelegate.m
        ├── Assets.xcassets
        │   ├── AccentColor.colorset
        │   │   └── Contents.json
        │   ├── AppIcon.appiconset
        │   │   ├── AppIcon.png
        │   │   └── Contents.json
        │   ├── Contents.json
        │   └── Test.imageset
        │       ├── Contents.json
        │       └── Test.jpg
        ├── Base.lproj
        │   ├── LaunchScreen.storyboard
        │   └── Main.storyboard
        ├── Info.plist
        ├── SceneDelegate.h
        ├── SceneDelegate.m
        ├── ViewController.h
        ├── ViewController.m
        └── main.m
```

删除`AppDemo.xcodeproj`工程文件后不用担心项目如何开发，最终开发还是使用Xcode进行开发，只不过Bazel提供了命令动态生成`AppDemo.xcodeproj`，所以有了Bazel之后，每次开发的流程大概是，命令行生成xcodeproj工程文件 --> 使用Xcode打开xcodeproj进行开发。

### 项目环境

- Mac Monterey Version 12.6.1

- Xcode 14.1
- Bazel  6.0.0

### Bazel安装命令

```bash
$ brew install bazel
```

### Bazel命令编译项目

```bash
$ git clone https://github.com/DavidWanderer/iOSBazelDemo.git
$ cd iOSBazelDemo/appdemo_bazel
$ bazel build //appdemo:appdemo
```

在我电脑上编辑的结果如下：

```bash
➜  appdemo_bazel git:(main) ✗ bazel build //appdemo:appdemo
Starting local Bazel server and connecting to it...
DEBUG: Rule 'io_bazel_rules_appengine' indicated that a canonical reproducible form can be obtained by modifying arguments sha256 = "318042aa6990eddcef719e0c2c3370f9246bd5424c7744493dbcabf0aefa8d3b"
DEBUG: Repository io_bazel_rules_appengine instantiated at:
  /Users/tingyue/Documents/git/iOSBazelDemo/appdemo_bazel/WORKSPACE:57:13: in <toplevel>
Repository rule http_archive defined at:
  /private/var/tmp/_bazel_tingyue/9ee30cbcb4fbda6c163b45a5cdeef334/external/bazel_tools/tools/build_defs/repo/http.bzl:372:31: in <toplevel>
INFO: Analyzed target //appdemo:appdemo (63 packages loaded, 863 targets configured).
INFO: Found 1 target...
Target //appdemo:appdemo up-to-date:
  bazel-bin/appdemo/appdemo.ipa
INFO: Elapsed time: 22.283s, Critical Path: 6.15s
INFO: 52 processes: 35 internal, 11 darwin-sandbox, 6 local.
INFO: Build completed successfully, 52 total actions
➜  appdemo_bazel git:(main)
```

可见Bazel编译完成后，会生成ipa安装包，存储在Bazel创建的目录中：`bazel-bin/appdemo/appdemo.ipa`。

### Bazel命令将项目运行到模拟器上

```bash
$ bazel run //appdemo:appdemo
```

### Bazel命令生成`xcodeproj`工程文件

```bash
$ bazel run //appdemo:xcodeproj
```

## 参考链接

[Bazel 教程：构建 iOS 应用程序](https://github.com/bazelbuild/rules_apple/blob/master/doc/tutorials/ios-app.md)

[Bazel学习笔记](https://blog.gmem.cc/bazel-study-note)

[用 bazel 更快更稳定的构建 iOS 项目](https://bilibili.github.io/2020/07/22/bazel_ios.html)

[官方文档：Bazel 简介](https://bazel.build/about/intro?hl=zh-cn)
