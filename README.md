A minimum SPM project with swift-subprocess fail to run swift-testing tests when targeting macOS 15.

* macOS 26
* swiftly 1.0.1
* swift-6.2-RELEASE toolchains

When targeting macOS 15, it fails to run swift-testing tests.

```swift
let package = Package(
    name: "swift-6.2-test",
    platforms: [
        // .macOS(.v26) works but .macOS(.v15) fail
        .macOS(.v15),
    ],
```

```
% swiftly --version
1.0.1
% swift --version
Apple Swift version 6.2 (swift-6.2-RELEASE)
Target: arm64-apple-macosx26.0
Build config: +assertions
 % swift test
[1/1] Planning build
Building for debugging...
[25/25] Compiling Subprocess Thread.swift
Build complete! (2.23s)
Test Suite 'All tests' started at 2025-09-20 01:16:02.008.
Test Suite 'All tests' passed at 2025-09-20 01:16:02.009.
	 Executed 0 tests, with 0 failures (0 unexpected) in 0.000 (0.001) seconds
swiftpm_testing_helper/Entrypoint.swift:34: Fatal error: Failed to open test bundle at path /Users/ainame/ghq/github.com/ainame/swift-6.2-test/.build/arm64-apple-macosx/debug/swift-6.2-testPackageTests.xctest/Contents/MacOS/swift-6.2-testPackageTests: dlopen(/Users/ainame/ghq/github.com/ainame/swift-6.2-test/.build/arm64-apple-macosx/debug/swift-6.2-testPackageTests.xctest/Contents/MacOS/swift-6.2-testPackageTests, 0x0101): Library not loaded: @rpath/libswiftCompatibilitySpan.dylib
  Referenced from: <FACAF584-A249-3974-818B-3974660C3121> /Users/ainame/ghq/github.com/ainame/swift-6.2-test/.build/arm64-apple-macosx/debug/swift-6.2-testPackageTests.xctest/Contents/MacOS/swift-6.2-testPackageTests
  Reason: tried: '/Users/ainame/Library/Developer/Toolchains/swift-6.2-RELEASE.xctoolchain/usr/lib/swift/macosx/testing/libswiftCompatibilitySpan.dylib' (no such file), '/Applications/Xcode-26.0.0.app/Contents/Developer/Platforms/MacOSX.platform/Developer/usr/lib/libswiftCompatibilitySpan.dylib' (no such file), '/Users/ainame/ghq/github.com/ainame/swift-6.2-test/.build/arm64-apple-macosx/debug/swift-6.2-testPackageTests.xctest/Contents/MacOS/../../../libswiftCompatibilitySpan.dylib' (no such file), '/Users/ainame/ghq/github.com/ainame/swift-6.2-test/.build/arm64-apple-macosx/debug/swift-6.2-testPackageTests.xctest/Contents/MacOS/../../../libswiftCompatibilitySpan.dylib' (no such file), '/Users/ainame/Library/Developer/Toolchains/swift-6.2-RELEASE.xctoolchain/usr/libexec/swift/lib/libswiftCompatibilitySpan.dylib' (no such file), '/Users/ainame/Library/Developer/Toolchains/swift-6.2-RELEASE.xctoolchain/usr/libexec/swift/lib/libswiftCompatibilitySpan.dylib' (no such file)
error: Exited with unexpected signal code 5
```

