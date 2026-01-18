# Home automation
Work in progress


## Software
- [Home Assistant](https://www.home-assistant.io/)
  - The central open-source hub for home automation
  - Configuration is provided in the [home_assistant](./home_assistant) folder.
  - Can be run in a Docker container, but to use Bluetooth-connected devices the server must have a Bluetooth adapter.
  - Can be controlled with an [Android app](https://play.google.com/store/apps/details?id=io.homeassistant.companion.android).
- [Tasmota](https://tasmota.github.io/docs/)
  - Open-source firmware for ESP8266- and ESP32-based IoT devices
  - When buying IoT devices, prefer ones that [have support for Tasmota](https://templates.blakadder.com/) or some other custom firmware. This ensures that you won't be dependent on the software updates by the manufacturer.
  - Prefer devices with [ESP32](https://en.wikipedia.org/wiki/ESP32) over other chips,
    including the second-best option [ESP8266](https://en.wikipedia.org/wiki/ESP8266),
    since ESP32 has:
    - WPA3
      - ESP8266 does not support WPA3, but it does support networks with:
        - Hybrid WPA2/WPA3
        - 802.11w Management Frame protection set as optional
        - KRACK countermeasures
    - TLS in the pre-built Tasmota binaries
    - IPv6 in the pre-built Tasmota binaries
- [Thingino](https://thingino.com/)
  - Open-source firmware for security cameras with an Ingenic SoC
- [Tuya-Convert](https://github.com/ct-Open-Source/tuya-convert)
  - OTA jailbreak for ESP826c6-based devices with old stock firmware
- [OpenBeken](https://github.com/openshwprojects/OpenBK7231T_App)
  - [Supported devices](https://openbekeniot.github.io/webapp/devicesList.html)
  - Tasmota-like firmware for devices based on Tuya modules
  - Not as feature-rich as Tasmota, but rapidly improving.
- [Tuya Cloudcutter](https://github.com/tuya-cloudcutter/tuya-cloudcutter)
  - OTA jailbreak for Tuya-based devices


### Tasmota configuration
- Reset
  - Full reset: press the button for 40 s
  - Wi-Fi reset: [press the button six times](https://tasmota.github.io/docs/FAQ/#i-entered-wrong-wi-fi-information)
- Other &rarr; template &rarr; copy-paste from Tasmota website & activate
- Wi-Fi
  - It's a good idea to also configure a secondary network name in the case the primary one has problems.
- Power monitoring calibration
  - For new calibration, please see the
    [Tasmota instructions](https://tasmota.github.io/docs/Power-Monitoring-Calibration/)
  - To load existing calibration, use the `PowerCal`, `VoltageCal` and `CurrentCal` commands.
- MQTT: host, user & password
  - This should be configured after the power monitoring calibration
    so that incorrect data is not saved by the MQTT server.
- Optional: reboot with button or with `Restart 1`


## Devices

### Control panel
Egobas Smart Monitor 15.6"
- Do not buy this without considering the drawbacks below!
- [AliExpress](https://www.aliexpress.com/item/1005001380819089.html)
- With Android, touchscreen and Bluetooth remote
- SoC: MediaTek MT5862
- CPU: 4x [ARM Cortex A53](https://en.wikipedia.org/wiki/ARM_Cortex-A53)
- RAM: 1 GB
- Flash: 8 GB
- As of 2021-12 the device comes with
  - Android 9.0 (version eng.jinwen.20211209.155520)
  - Android security patch 2021-01-05
  - Kernel 4.9.118+
- As of 2022-05-16 the device can be manually updated to
  - Android 9.0 (version eng.jingwen.20220418.080715)
  - The security patch level and kernel stay the same
  - The update adds the Google Play Store to the main menu
  - SHA256 checksum for the update file: `e6684517a2f3256ee9b34e736a441b455c0c4217de3b39ebf8e7643fbe37333b`
- How to update the firmware manually
  - Note that this may factory reset the device! (Or at least it did so for me without warning.)
  - Get the firmware file from the manufacturer (~ 1.5 GB) by e.g. asking in the AliExpress chat
  - Place the file to the root of a USB flash drive with the filename `MTK368P.bin`
  - Turn off the device and disconnect the power cable
  - Connect the USB drive to the Micro-USB port of the device
  - Hold the power button and connect the power cable
  - The device should boot to the firmware update screen
  - Release the power button and wait for the update to complete
- The recovery is unusable
  - It can be entered by holding down the menu button when booting.
    However, the menu cannot be navigated with the buttons, nor can the entries be selected.
- The USB port works only in OTG mode, not client mode
  - Therefore ADB is not supported
- These limitations are intentional by the manufacturer
  - According to the customer support: "It is closed by default and will not be opened specifically"
  - This means, that if the user interface of the device crashes for some reason, there is no way to reset the device,
    and you have to throw it away.
  - However, they may be willing to make exceptions for big corporate clients but not for individual customers
- Sometimes the touchscreen stops working, and the menu dot from the top-left corner disappears
  This can be fixed by factory resetting the device using the remote or an external USB mouse,
  but this wipes all the data on the device.
- There is no way to lock the screen with a PIN code or password, or to encrypt the device.
  - This is horrible for security, and therefore no sensitive information should be stored on the device.
- The display has good colors but there's some ghosting
  - The backlight may make an audible high-pitched hum for brightness levels between 20 - 90 %.
  - Excess pressure will make the affected region of the display permanently brighter,
    resulting in uneven image brightness. Use an additional cover when carrying the monitor in a backpack!
- There are several issues with Netflix
  - The device is not certified by Netflix, and therefore Netflix for Android TV does not work.
    This gives the error "Sorry, your account can't be used on this device."
    [`tvq-pb-101 (1.10.5005)`](https://help.netflix.com/en/node/110819)
  - The device theoretically has support for Widevine L1 DRM, but Netflix sees only Widevine L3,
    limiting the resolution to 480p.
- The device is not suitable for children
  - The main menu of the device showcases trending videos recommended by some weird algorithm,
    and this includes NSFW videos.
    There is no way to disable this except by switching to an alternative launcher such as
    [Nova Launcher](https://play.google.com/store/apps/details?id=com.teslacoilsw.launcher).


### Bluetooth adapter
Please see the
[Bluetooth page](https://agx.fi/it/bluetooth)
on my website.


### Lighting
Philips Hue
- Starter kit, white and colour ambiance, E27
  - [Verkkokauppa.com](https://www.verkkokauppa.com/fi/product/13805/rcgdv/Philips-Hue-Starter-kit-pakkaus-White-and-Color-ambiance-E27)
- Dimmer switch V2
  - [Geizhals](https://geizhals.eu/philips-hue-dimmer-switch-v2-8719514274617-a2464675.html)
  - [Verkkokauppa.com](https://www.verkkokauppa.com/fi/product/36702/qjkdx/Philips-Hue-Dimmer-switch-himmenninkytkin)
- GU10 White and colour ambiance
  - [Geizhals](https://geizhals.eu/philips-hue-white-and-colour-ambiance-gu10-5-7w-629250-00-a2116456.html)
- E14 white and colour ambiance
  - [Geizhals](https://geizhals.eu/philips-hue-white-and-colour-ambiance-led-bulb-e14-6-5w-929002294202-a2448894.html)


### Socket
I recommend to buy only sockets with 16 A current rating and energy monitoring,
as these features are highly useful and don't increase the price significantly,
For the calibration you need one device that has a resistive load (e.g. a ligth bulb),
and a power monitor that can preferably measure the power factor.

Athom 16A EU V2
- [AliExpress](https://www.aliexpress.com/item/4001230982267.html)
- [Tasmota](https://templates.blakadder.com/athom_PG01V2-EU16A-TAS.html) preinstalled
  - Template: `{"NAME":"Athom Plug V2","GPIO":[0,0,0,3104,0,32,0,0,224,576,0,0,0,0],"FLAG":0,"BASE":18}`
- Energy monitoring is provided by the integrated
  [HLW8032](https://www.electrodragon.com/product/energy-meter-hlw8032-breakout-board/)
  power monitoring chip. Calibration is not necessary, but it can improve the accuracy.
- 16 A / 3680 W

CozyLife 16A
- [AliExpress](https://www.aliexpress.com/item/1005004541903825.html)
- [Tasmota](https://templates.blakadder.com/cozylife_homekit_plug.html)
  - Template: `{"NAME":"CozyLife 16A","GPIO":[0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,2720,0,0,2656,576,0,224,2624,0,0,0,0,0,0,0,0,0,0,0,0,0],"FLAG":0,"BASE":1}`
- Looks promising, but I haven't tested these yet
- Energy monitoring
- Based on ESP32-SOLO1
- Requires flashing over serial
- 16 A / 3750 W

Nous A1T
- Same hardware as Nous A1 used to have,
  but with [Tasmota](https://templates.blakadder.com/nous_A1T.html) preinstalled
  - Template: `{"NAME":"NOUS A1T","GPIO":[32,0,0,0,2720,2656,0,0,2624,320,224,0,0,0],"FLAG":0,"BASE":49}`
- [Amazon](https://www.amazon.de/-/en/gp/product/B0054PSIPA/)
- Energy monitoring
- 16 A / 3450 W

Nous A1
- [Amazon](https://www.amazon.de/gp/product/B0054PSES6/)
- [Tasmota](https://templates.blakadder.com/nous_A1.html)
  - Template: `{"NAME":"NOUS A1","GPIO":[320,0,576,0,2656,2720,0,0,2624,32,0,224,0,0],"FLAG":0,"BASE":45}`
  - Now comes with a Wi-Fi module that is not compatible with Tasmota.
  - Used to be flashable with Tuya-Convert.
- Energy monitoring
- 16 A / 3450 W

Gosund SP112
- Amazon (no longer available)
- Tasmota
  - [Old version](https://templates.blakadder.com/gosund_SP112.html)
  - [New version](https://templates.blakadder.com/gosund_SP112_v3_4.html)
  - Template: `{"NAME":"SP112new","GPIO":[57,0,56,0,132,134,0,0,131,30,21,0,0],"FLAG":4,"BASE":18}`
  - Now comes with a Wi-Fi module that is not compatible with Tasmota.
- 2 USB ports with a separate relay (but no physical button)
- 16 A / 3680 W

Gosund SP211
- Amazon (no longer available)
- [AliExpress](https://www.aliexpress.com/item/1005002198374650.html)
- [Tasmota](https://templates.blakadder.com/gosund_SP211.html)
  - At least previously flashable with Tuya-Convert
  - Used to be flashable over serial, can be opened with screws.
  - Now probably comes with a Wi-Fi module that is not compatible with Tasmota.
- Energy monitoring (total only, not per socket)
- 15 A


### Power strip
Nous A5T
- [Amazon](https://www.amazon.de/-/en/gp/product/B0054PSH9C/)
- [Tasmota](https://templates.blakadder.com/nous_A5T.html) preinstalled
  - Template: `{"NAME":"NOUS A5T","GPIO":[0,3072,544,3104,0,259,0,0,225,226,224,0,35,4704],"FLAG":1,"BASE":18}`
- Same hardware as Gosund P1

Gosund P1
- Amazon (no longer available)
- [Tasmota](https://templates.blakadder.com/gosund_P1.html)
  - Template: `{"NAME":"Gosund_P1","GPIO":[0,3072,544,3104,0,259,0,0,225,226,224,0,35,4704],"FLAG":0,"BASE":18}`
  - Required flashing over serial
  - Now probably comes with a Wi-Fi module that is not compatible with Tasmota.
- Buttons are quirky with default settings, and pressing one button may affect another socket.
- Energy monitoring (total only, not per socket)

Power strip box
- With "wooden" cover: [AliExpress](https://www.aliexpress.com/item/4001237800573.html)
- Plastic: [Verkkokauppa.com](https://www.verkkokauppa.com/fi/catalog/4402d/Kaapelihallinta/products?query=kaapelikotelo)


### Security cameras
Wuuk Y0510
- Please see the
  [physical security page](https://agx.fi/it/physical-security)
  on my website.


### Motion sensors
Philips Hue indoor motion sensor
- Please see the
  [physical security page](https://agx.fi/it/physical-security)
  on my website.


### Kettle
ProfiCook PC-WKS 1167G 1.5L
- [Amazon](https://www.amazon.de/gp/product/B07PQPZ8HH/)
- [Tasmota](https://templates.blakadder.com/proficook_PC-WKS_1167.html)
  - Flashable over serial
  - Requires custom configuration, but instructions are available on the template page.


### Surge protection
APC Surge Protector PME1WU2B-GR
- [Amazon](https://www.amazon.de/gp/product/B07Z5KD7CJ/)
- [Verkkokauppa.com](https://www.verkkokauppa.com/fi/product/71958/nmbjs/APC-PME1WU2B-GR-ylijannitesuoja)
- 16 A / 4000 W
- EMI/RFI filtering < 40 dB
- With USB ports
- Slightly obstructs adjacent sockets

Hama Surge Protection Adaptor
- [Amazon](https://www.amazon.de/gp/product/B01JCKRHOK/)
- 16 A / 3500 W
- Small, does not obstruct adjacent sockets


### Temperature and humidity sensor
Xiaomi LYWSD03MMC
- [AliExpress](https://www.aliexpress.com/item/4000406818501.html)
- [Custom firmware](https://github.com/pvvx/ATC_MiThermometer)
  - [Flashing may only work when done with a phone instead of a computer!](https://github.com/pvvx/ATC_MiThermometer/issues/67#issuecomment-942660040)
  - Connecting to the sensor may also require a browser based on Google Chrome.
- [Supported](https://custom-components.github.io/ble_monitor/by_brand#xiaomi)
  by the [Passive BLE Monitor integration](https://github.com/custom-components/ble_monitor) for Home Assistant

Xiaomi MHO-C303
- [AliExpress](https://www.aliexpress.com/item/4001227289167.html)
- With clock and timer
- Not compatible with the custom firmware. Therefore I recommend buying one of the supported models instead.
- Adjusting the settings with a phone requires that the
  [Xiaomi Home](https://play.google.com/store/apps/details?id=com.xiaomi.smarthome)
  app is set to the mainland China region, which is a privacy concern.
- [Supported](https://custom-components.github.io/ble_monitor/by_brand#xiaomi)
  by the [Passive BLE Monitor integration](https://github.com/custom-components/ble_monitor) for Home Assistant


### Plant sensor
MiFlora HHCCJCY01
- [AliExpress](https://www.aliexpress.com/item/33017406335.html)
- Monitors temperature, moisture, conductivity and illuminance
- The default [Flower Care](https://play.google.com/store/apps/details?id=com.huahuacaocao.flowercare)
  app has severe login issues
- [Supported](https://custom-components.github.io/ble_monitor/by_brand#miflora)
  by the [Passive BLE Monitor integration](https://github.com/custom-components/ble_monitor) for Home Assistant


### Smoke alarm
Tuya YG400A
- [AliExpress](https://www.aliexpress.com/item/4000818367545.html)
- Old version: [Tasmota](https://templates.blakadder.com/YG400A.html)
- New version
  - With [CB3S](https://developer.tuya.com/en/docs/iot/cb3s?id=Kai94mec0s076), which is based on BK7231N
  - Not compatible with Tasmota
  - Compatible with [OpenBeken](https://openbekeniot.github.io/webapp/devices/Tuya_WiFi_Smoke_Detector.html)
  - [Elektroda forum discussion](https://www.elektroda.com/rtvforum/topic3941698.html)
  - I haven't been able to get these working yet


### Thermometer
Withings Thermo
- Controlled with the Withings Thermo Android app


### Scale
Withings ASDFASDF
- Controlled with the Withings Health Mate Android app


### Toothbrush
Oral-B Genius X
- [Amazon](https://www.amazon.de/-/en/gp/product/B094HNRZT4/)
- [At least partially supported](https://custom-components.github.io/ble_monitor/)
  by the
  [Passive BLE Monitor integration](https://github.com/custom-components/ble_monitor)
  for Home Assistant

Philips Sonicare
- The [Philips Sonicare app](https://play.google.com/store/apps/details?id=com.philips.cdp.ohc.tuscany)
  refuses to start on rooted phones. Therefore stay away from their products!
