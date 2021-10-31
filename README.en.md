Tänään jäljellä calculator for Sailfish OS
==========================================
This app calculates the number of days left in military service in Finland.

***I'm looking for a maintainer for this app. If you are interested, please email me.***

Frequently Asked Questions
--------------------------
Here you may find some answers to questions asked from me.

### Why is this app not available in English or some other language?
This app is written in QML and it uses sailfish-qml which doesn't support loading translations.
Additionally I have not tried to figure out the terms used in the app in English.

### Why is some of the code in Finnish? Wouldn't it be better to write it completely in English?
Again, I haven't figured out those terms in English so it was much easier to keep using Finnish for
them. Surely English is more widely understood language and Qt uses it, thus it would be nice to
have it consistently in single language (English).

Building your own version
-------------------------
It can be done easily with Sailfish SDK's sfdk command. First pick the target that you want:

    sfdk config --push target SailfishOS-4.1.0.24-i486

And compile:

    sfdk build

Install the created package to your device.

License
-------
All of the code is GNU General Publice License version 3. Read [COPYING](COPYING) file for full
license.

The app icon has been created from Sailfish icon template.
