# Arks: Tide Builders

An original idle survival game for mobile. You build an ark at sea, pick up drifting debris, rescue survivors and sail through **100 stages** to reach the Last Shore.

## Play
- **Android:** install `Arks.apk` on your phone. You may need to allow "Install unknown apps" first.
- **Browser / PWA:** open `www/index.html`, or host the `www/` folder and use "Add to Home screen".

## How to play
- Tap floating debris (🪵 🔩 🧵 🛢️ 🙋 🎁) to collect it.
- Build platforms (tiles), drift nets, shelters, gardens, sails, looms, bulwarks, workshops, engines and lighthouses.
- Give your crew jobs: gatherer, scavenger, fisher, rower or weaver. Keep them fed!
- Every 10th stage is a storm wall. You need enough hull strength to cross it.
- From stage 16 on, "Seek New Tides" restarts your voyage for pearls. Each pearl gives +10% to everything.
- Progress saves automatically, and your crew keeps working while you're away (up to 8h).

## Rebuild the APK
`ANDROID_HOME=/path/to/sdk android/build.sh` builds the APK without Gradle. It needs build-tools 34, platform 34 and a JDK.
