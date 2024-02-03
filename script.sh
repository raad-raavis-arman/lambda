function pub {
    echo "Flutter clean..."
    flutter clean
    echo "Flutter pub get..."
    flutter pub get
    echo "Flutter upgrade..."
    flutter pub upgrade
}

function buildRunner {
    echo "build_runner..."
    dart run build_runner build --delete-conflicting-outputs
}

function podUpdate {
    echo "Pod install..."
    cd ios
    rm Podfile.lock
    pod install
    pod update
    cd ..
}

function runDev {
    echo "Flutter run development.."
    flutter run --flavor development --target lib/main_development.dart
}

function runStage {
    echo "Flutter run staging.."
    flutter run --flavor staging --target lib/main_staging.dart
}

function runProd {
    echo "Flutter run production.."
    flutter run --flavor production --target lib/main_production.dart
}

function releaseAndroidProd {
    echo "Build release for Android in production flavor.."
    echo "Make sure you are in right branch.."
    pub
    buildRunner
    flutter build appbundle --flavor "prod" --target "lib/main_production.dart"
    # the flavor name in android set to prod so we use prod instead of production
    cd android
    fastlane deploy
    echo "app bundle deployed on internal testing track"
}

function releaseIosProd {
    echo "Build release for Ios in production flavor.."
    echo "Make sure you are in right branch.."
    pub
    buildRunner
    podUpdate
    flutter build ios --release --flavor "prod" --target "lib/main_production.dart"
    # the flavor name in ios set to prod so we use prod instead of production
    cd ios
    fastlane beta
    echo "ios ipa deployed on internal testing track"
}



