# Dotzz

Dotzz is a mobile app to support domestic abuse survivors in their journey to safety and self-empowerment.

SugarCube Security package is built by Cornell Tech Spec Team. We are aiming to provide three features, which are: 

- blur/hide the screen when the app is at background
- change icon dynamically
- build a gate and hide the software behind the gate




## Usage of Blur/hide the screen when the app is at background:

In main.dart, wrap the target screen with Overlay() and AppLifecycleOverlay():

```
          home: Overlay(
            initialEntries: <OverlayEntry>[
              OverlayEntry(
                builder: (BuildContext context) => AppLifecycleOverlay(
                  child: LoginScreen(),
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


## Usage of Dynamically change the App icons feature:

Reference: 
- https://pub.dev/packages/flutter_dynamic_icon
- https://medium.com/flutter-community/programatically-change-ios-app-icon-in-flutter-c9e84bc541a2

IMPORTANT! This feature requires to use a flutter plugin that currently only supports ios.
Please refer to the documents above on how to create an App icon and setup parameters inside ios folder.
For demo purpose, 2 App icons have been pre-created to showcase the feature.

In login_screen.dart, call the function DynamicIconChangeField()

```
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                  child: ElevatedButton(
                onPressed: () =>
                    DotzzNavigator.pushNamed(context, DotzzRoutes.homeScreen),
                child: Text(localize('Login')),
              )),
            ]),
            DynamicIconChangeField(),

```




