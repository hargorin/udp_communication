import socket
import sys

serverAddressPort   = ("192.168.178.39", 60611)
bufferSize          = 1024 

msgFromClient       = "Hello UDP Server"
bytesToSend         = str.encode(msgFromClient)
 

# Create a UDP socket at client side
UDPClientSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)

# Send to server using created UDP socket
UDPClientSocket.sendto(bytesToSend, serverAddressPort)
msgFromServer = UDPClientSocket.recvfrom(bufferSize)
msg = "Message from Server {}".format(msgFromServer[0])
print(msg)