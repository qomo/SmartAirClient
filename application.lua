local module = {}

m = nil

led_pin = 0
fan_pin = 1
gpio.mode(led_pin, gpio.OUTPUT)
gpio.mode(fan_pin, gpio.OUTPUT)

-- Sends a simple ping to the broker
local function send_ping()
    m:publish(config.ENDPOINT .. "ping", "id=" .. config.ID, 0, 0)
end

-- Sends my id to the broker registraction
local function register_myself()
    m:subscribe(config.ENDPOINT .. config.ID, 0, function(conn)
        print("Successfully subscribed to data endpoint")
    end)
end

local function mqtt_start()  
    m = mqtt.Client(config.ID, 120)
    -- register message callback beforehand
    m:on("message", function(conn, topic, data) 
      if data ~= nil then
        print(topic .. ": " .. data)
        -- do something, we have received a message
        if data == "0" then
            gpio.write(fan_pin, gpio.LOW)
            gpio.write(led_pin, gpio.HIGH)
        elseif data == "1" then
            gpio.write(fan_pin, gpio.HIGH)
            gpio.write(led_pin, gpio.LOW)
        end
      end
    end)
    -- Connect to broker
    m:connect(config.HOST, config.PORT, 0, 1, function(con) 
        register_myself()
        -- And then pings each 1000 milliseconds
        tmr.stop(6)
        tmr.alarm(6, 1000, 1, send_ping)
    end) 
end

function module.start()
    mqtt_start()
end

return module