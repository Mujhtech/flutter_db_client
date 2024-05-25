xcode:
	open ios/Runner.xcworkspace

install:
	flutter pub get

ci:
	make format && make analyze && make test

build_runner:
	dart run build_runner build --delete-conflicting-outputs

clean:
	flutter clean
	cd ios && rm -rf Podfile.lock
	cd ios && rm -rf Pods
	cd macos && rm -rf Podfile.lock
	cd macos && rm -rf Pods
	flutter pub get
	cd ios && pod install --repo-update
	cd macos && pod install --repo-update

format:
	dart format --set-exit-if-changed -l 120 lib

analyze:
	flutter analyze lib

test:
	flutter test --no-pub --coverage --test-randomize-ordering-seed random

# iOS
prod_ios:
	flutter build ios

# Android

prod_android:
	make clean && flutter build apk --split-per-abi

prod_android_bundle:
	make clean && flutter build appbundle

launcher_icon:
	flutter pub run flutter_launcher_icons