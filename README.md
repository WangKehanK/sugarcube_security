# Dotzz

Dotzz is a mobile app to support domestic abuse survivors in their journey to safety and self-empowerment.

SugarCube Security package is built by Cornell Tech Spec Team. We are aiming to provide three features, which are: 

- blur/hide the screen when the app is at background
- change icon dynamically
- build a gate and hide the software behind the gate




## Usage of Blur/hide the screen when the app is at background:

In main.dart, wrap the target screen with Overlay() and AppLifecycleOverlay():

To gain more flexibilities, I make three variable in AppLifecycleOverlay, which are imagePath, imageWidth, and imageHeight, so that we can adjust logo size from main.dart. 

```
          home: Overlay(
            initialEntries: <OverlayEntry>[
              OverlayEntry(
                builder: (BuildContext context) => AppLifecycleOverlay(
                  child: LoginScreen(),
                  imagePath: "images/logo.png",
                  imageWidth: MediaQuery.of(context).size.width * 1/3 ,
                  imageHeight: MediaQuery.of(context).size.height * 1/5,
                ),
              )
            ],
          ),
```

In android/app/src/main/AndroidManifest.xml, remove the following block
```
            <meta-data
              android:name="io.flutter.embedding.android.SplashScreenDrawable"
              android:resource="@drawable/launch_background"
              />

```