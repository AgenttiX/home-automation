# Home automation
Work in progress

## Software
- [Home Assistant](https://www.home-assistant.io/)
  - The central open-source hub for home automation
  - Configuration is provided in the [home_assistant](./home_assistant) folder.
  - Can be run in a Docker container, but to use Bluetooth-connected devices the server must have a Bluetooth adapter.
  - Can be controlled with an [Android app](https://play.google.com/store/apps/details?id=io.homeassistant.companion.android).
- [Tasmota](https://tasmota.github.io/docs/)
  - An open-source firmware for various IoT devices
  - When buying IoT devices, prefer ones that [have support for Tasmota](https://templates.blakadder.com/) or some other custom firmware. This ensures that you won't be dependent on the software updates by the manufacturer.
  - Prefer devices with [ESP32](https://en.wikipedia.org/wiki/ESP32) over other chips,
    including the second-best option [ESP8266](https://en.wikipedia.org/wiki/ESP8266),
    as ESP32 has pre-built TLS support in Tasmota. This improves security significantly.

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


### WiFi access point / router
Xiaomi Mi Router 3G v1
- [AliExpress](https://www.aliexpress.com/item/32837907107.html) (no longer available)
- [OpenWRT](https://openwrt.org/toh/xiaomi/mir3g)
- v2 is a completely different device with a lot worse hardware!
- Wi-Fi 5 (802.11ac)
- Flashable over serial
- WPA3 and 802.11w Management Frame Protection are not compatible with some old Android devices

ASUS RT-AX58U
- [Hinta.fi](https://hinta.fi/1780666/asus-rt-ax58u)
- [Geizhals](https://geizhals.eu/asus-rt-ax58u-ax3000-90ig04q0-mo3r10-a2152041.html)
- [Asuswrt-Merlin](https://www.asuswrt-merlin.net/)
- I don't have one, but have received positive feedback from friends and relatives who have these.
  - Not as customizable as OpenWRT, but good enough firmware for most purposes
- Wi-Fi 6 (802.11ax)

### Bluetooth adapter
Zexmte
- [Amazon](https://www.amazon.de/-/en/Bluetooth-anti-interference-transmission-headphones-compatible/dp/B08SC9M9K3/)
- [AliExpress](https://www.aliexpress.com/item/1005002931530115.html)
- Bluetooth 5.0
  - Bluetooth >= 4.0 is required for Bluetooth LE (BLE)
- Class 1 radio (100 m range)
- Realtek RTL8761B
  - Requires Linux kernel >= 5.8, which can be installed on Ubuntu 20.04 with
    `sudo apt-get install linux-generic-hwe-20.04`
  - [Requires additional firmware for Linux](https://linuxreviews.org/Realtek_RTL8761B)
    - On Ubuntu the firmware and config should be copied to `/lib/firmware/rtl_bt` with the file extension `.bin`.

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
Nous A1
- [Amazon](https://www.amazon.de/gp/product/B0054PSES6/)
- [Tasmota](https://templates.blakadder.com/nous_A1.html)
  - Flashable with Tuya-Convert
  - Only buy sockets with support for custom firmware!
- Energy monitoring
  - Only buy sockets with energy monitoring!
- 16 A / 3450 W

Gosund SP112
- Amazon (no longer available)
- [Tasmota](https://templates.blakadder.com/gosund_SP112.html)
  - [Newer version](https://templates.blakadder.com/gosund_SP112_v3_4.html) comes with a Wifi module that is not compatible with Tasmota!
- 2 USB ports with a separate relay (but no physical button)
- 16 A / 3680 W

Gosund SP211
- Amazon (no longer available)
- [AliExpress](https://www.aliexpress.com/item/1005002198374650.html)
- [Tasmota](https://templates.blakadder.com/gosund_SP211.html)
  - At least previously flashable with Tuya-Convert
  - Flashable over serial, can be opened with screws
- Energy monitoring (total only, not per socket)
- 15 A

### Power strip
Gosund P1
- Amazon (no longer available)
- [Tasmota](https://templates.blakadder.com/gosund_P1.html)
  - Now requires flashing over serial
  - Only buy power strips with support for custom firmware!
- Buttons are quirky with default settings, and pressing one button may affect another socket.
- Energy monitoring (total only, not per socket)
  - Only buy sockets with energy monitoring!

Power strip box
- With "wooden" cover: [AliExpress](https://www.aliexpress.com/item/4001237800573.html)
- Plastic: [Verkkokauppa.com](https://www.verkkokauppa.com/fi/catalog/4402d/Kaapelihallinta/products?query=kaapelikotelo)

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
- [Tasmota](https://templates.blakadder.com/YG400A.html)
- New version comes with a different chip (CB3S instead of TYWE3S) that is not compatible with Tasmota.

### Thermometer
Withings Thermo
- Controlled with the Withings Thermo Android app

### Scale
Withings ASDFASDF
- Controlled with the Withings Health Mate Android app

### Toothbrush
Oral-B
- I might test these in the future
- [At least partially supported](https://custom-components.github.io/ble_monitor/)
  by the [Passive BLE Monitor integration](https://github.com/custom-components/ble_monitor) for Home Assistant

Philips Sonicare
- The [Philips Sonicare app](https://play.google.com/store/apps/details?id=com.philips.cdp.ohc.tuscany)
  refuses to start on rooted phones. Therefore stay away from their products!
