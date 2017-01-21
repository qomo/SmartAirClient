-- 创建一个mqtt client，保持连接包时间120s.
m = mqtt.Client("clientid", 120, "user", "password")

--设置Last Will和Testament (可选).
--如果mqtt client不发送保持连接包，服务器会向标题"/lwt"发送一个qos = 0, retain = 0, data = "offline"的消息.
m:lwt("/lwt", "offline", 0, 0)

m:on("connect", function(con) print ("connected") end)
m:on("offline", function(con) print ("offline") end)

-- 接收到消息事件
m:on("message", function(conn, topic, data) 
  print(topic .. ":" ) 
  if data ~= nil then
    print(data)
  end
end)

-- 如果需要安全连接，则m:connect("192.168.11.118", 1880, 1)
m:connect("192.168.11.118", 1880, 0, function(conn) print("connected") end)

-- 订阅"/topic"消息，qos = 0
m:subscribe("/topic",0, function(conn) print("subscribe success") end)

-- 向"/topic"标题发送消息，消息设置：data = hello, QoS = 0, retain = 0
m:publish("/topic","hello",0,0, function(conn) print("sent") end)

m:close();
-- 或者可以再次调用m:connect()
