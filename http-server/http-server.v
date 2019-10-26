import net

fn main() {
	server := net.listen(8080) or {
		panic(err)
	}

	message := "HTTP/1.1 200 OK\n\nHello World\n"

	for {
		socket := server.accept() or {
			panic(err)
		}
		
		socket.send(message.str, message.len)
		socket.close()
	}

	server.close()
}
