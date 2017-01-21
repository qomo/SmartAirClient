local module = {}

module.SSID = {}
module.SSID["OpenWrt_B38C15"] = "13817486091"

module.HOST = "104.194.66.13"
module.PORT = 1883
module.ID = node.chipid()

module.ENDPOINT = "nodemcu/"
return module