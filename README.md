# Home automation

## Devices

### Bluetooth adapter
Zexmte
- [Amazon](https://www.amazon.de/-/en/Bluetooth-anti-interference-transmission-headphones-compatible/dp/B08SC9M9K3/)
- [AliExpress](https://www.aliexpress.com/item/1005002931530115.html)
- Bluetooth 5.0
  - Bluetooth >= 4.0 is required for Bluetooth LE (BLE)
- Class 1 radio (100 m range)
- Realtek RTL8761B
  - [Requires additional firmware for Linux](https://linuxreviews.org/Realtek_RTL8761B)

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
  - Requires custom configuration, but instructions are available on the template page

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
Xiaomi
- [AliExpress](https://www.aliexpress.com/item/4000406818501.html)
- [Custom firmware](https://github.com/pvvx/ATC_MiThermometer)
  - [Flashing may only work when done with a phone instead of a computer!](https://github.com/pvvx/ATC_MiThermometer/issues/67#issuecomment-942660040)

### Smoke alarm
Tuya YG400A
- [AliExpress](https://www.aliexpress.com/item/4000818367545.html)
- [Tasmota](https://templates.blakadder.com/YG400A.html)
- Now comes with a slightly different motherboard than in the Tasmota instructions
