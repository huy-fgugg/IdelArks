#!/usr/bin/env bash
# Builds Arks.apk from ../www without Gradle. Needs ANDROID_HOME (build-tools 34, platform 34) and a JDK.
set -euo pipefail
cd "$(dirname "$0")"
BT="$ANDROID_HOME/build-tools/34.0.0"; JAR="$ANDROID_HOME/platforms/android-34/android.jar"
rm -rf build && mkdir -p build/res build/classes build/dex build/assets
cp ../www/index.html ../www/icon.svg ../www/manifest.webmanifest build/assets/
"$BT/aapt2" compile --dir res -o build/res/
"$BT/aapt2" link -o build/unsigned.apk -I "$JAR" --manifest AndroidManifest.xml -A build/assets build/res/*.flat
javac -source 8 -target 8 -classpath "$JAR" -d build/classes src/com/arks/tidebuilders/*.java 2>&1 | grep -v warning || true
"$BT/d8" --min-api 21 --lib "$JAR" --output build/dex $(find build/classes -name '*.class')
(cd build/dex && zip -q ../unsigned.apk classes.dex)
"$BT/zipalign" -f 4 build/unsigned.apk build/aligned.apk
KS=${KEYSTORE:-arks.keystore}
[ -f "$KS" ] || keytool -genkeypair -keystore "$KS" -storepass arkspass -keypass arkspass -alias arks -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Arks" >/dev/null 2>&1
"$BT/apksigner" sign --ks "$KS" --ks-pass pass:arkspass --key-pass pass:arkspass --out ../Arks.apk build/aligned.apk
echo "Built $(cd .. && pwd)/Arks.apk"
