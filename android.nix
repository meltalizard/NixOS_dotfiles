{ pkgs, ... }:
let
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "13.0";
    platformToolsVersion = "35.0.2";
    buildToolsVersions = [ "34.0.0" ];
    platformVersions = [ "34" ];
    includeNDK = true;
    ndkVersions = [ "26.1.10909125" ];
    includeEmulator = false;
    includeSources = false;
    includeSystemImages = false;
    extraLicenses = [
      "android-sdk-license"
      "android-sdk-preview-license"
    ];
  };
  androidSdk = androidComposition.androidsdk;
in
{
  home.sessionVariables = {
    ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
    ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
    JAVA_HOME = "${pkgs.jdk17}";
    ANDROID_NDK_ROOT = "${androidSdk}/libexec/android-sdk/ndk/26.1.10909125";
  };
  home.sessionPath = [
    "${androidSdk}/libexec/android-sdk/platform-tools"
    "${androidSdk}/libexec/android-sdk/ndk/26.1.10909125"
  ];
}
