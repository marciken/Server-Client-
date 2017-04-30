local socket = require("socket")
host = host or "192.168.254.129"
port = port or 8000

	if arg then
		host = arg[1] or host
		port = arg[2] or port
	end

	print("\nBinding to Client [host: " ..host.. " , port: " ..port.. "]...")

	s = assert(socket.bind(host, port))
	i, p   = s:getsockname()
	assert(i, p)

	print("\nWaiting connection from Client on " .. i .. ":" .. p .. "...")

	c = assert(s:accept())

	print("......CONNECTED! \n\nHere is the message received from client:")

	l, err = c:receive()

	while not err do
		reversedString = l.reverse(l)
		c:send(reversedString .. "\n")
		l, err = c:receive()
	end

print(err)
