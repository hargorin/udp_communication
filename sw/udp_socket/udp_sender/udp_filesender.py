import argparse
import sys
import os
import socket

localIP     = "192.168.178.39"
localPort   = 60611
bufferSize  = 1024

# msgFromServer       = "Hello UDP Client - Message from Jan"
# bytesToSend         = str.encode(msgFromServer)

def create_arg_parser():
    # Creates and returns the ArgumentParser object.

    parser = argparse.ArgumentParser(description='Send input file over UDP')
    parser.add_argument('inputFile',
                    help='Path to the input file.')
    return parser

if __name__ == "__main__":
    arg_parser = create_arg_parser()
    parsed_args = arg_parser.parse_args(sys.argv[1:])
    if os.path.isfile(parsed_args.inputFile):
   		print("File exist")
		f = open(parsed_args.inputFile, "r")
		#print(f.read())
		data = f.read(bufferSize)

		# Create a datagram socket
		UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)

		# Bind to address and ip
		UDPServerSocket.bind((localIP, localPort)) 

		print("UDP server up and listening")

		# Listen for incoming datagrams
		while(True):
		    bytesAddressPair = UDPServerSocket.recvfrom(bufferSize)
		    message = bytesAddressPair[0]
		    address = bytesAddressPair[1]
		    clientMsg = "Message from Client:{}".format(message)
		    clientIP  = "Client IP Address:{}".format(address) 
		    print(clientMsg)
		    print(clientIP)
		    
			# Sending data to client
			data = f.read(bufferSize)
			while(data):
				if(UDPServerSocket.sendto(data, address)):
					print "sending ..."
					data = f.read(bufferSize)

    	# Close	
		UDPServerSocket.close()
		f.close()