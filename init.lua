app = require("application")
config = require("config")
setup = require("setup")

setup.start()







--print(wifi.sta.getip())
--ssid = "OpenWrt_B38C15"
--pw_key = "13817486091"
--wifi.setmode(wifi.STATION)
--wifi.sta.config(ssid, pw_key)
--print(wifi.sta.getip())




--
--
--led_pin = 0
--fan_pin = 4
--gpio.mode(led_pin, gpio.OUTPUT)
--
--lighton=0
--tmr.alarm(0,3000,1,function()
--if lighton==0 then 
--    lighton=1 
--    gpio.write(led_pin, gpio.HIGH)
--    gpio.write(fan_pin, gpio.HIGH)
--else 
--    lighton=0 
--    gpio.write(led_pin, gpio.LOW)
--    gpio.write(fan_pin, gpio.LOW)
--end 
--end)
--
--              
