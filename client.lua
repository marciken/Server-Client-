local socket = require("socket")
host = host or "192.168.254.130"
port = port or 8000

	if arg then
		host = arg[1] or host
		port = arg[2] or port
	end

	print("\nAttempting connection to Server [host: " ..host.. " , port: " ..port.."]...")

	c = assert(socket.connect(host, port))

	print("\nCONNECTED! \n\nEnter message to server:")
	l = io.read()

	while l and l ~= "" and not e do
		assert(c:send(l .. "\n"))
		msg, err = c:receive()
		
		if not err then
			print("\nReversed Message: " .. msg)

		end

	l = io.read()
	end
