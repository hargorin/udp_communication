import argparse
import sys
import os
import socket
import time

from progressbar import printProgressBar

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
        # File size
        fileSize = os.stat(parsed_args.inputFile).st_size
        # Open file
        f = open(parsed_args.inputFile, "r")

        
        # Create a datagram socket
        UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
        # Bind to address and ip
        UDPServerSocket.bind((localIP, localPort)) 
        print("UDP server up and listening")

        # Listen for incoming datagrams
        bytesAddressPair = UDPServerSocket.recvfrom(bufferSize)
        message = bytesAddressPair[0].decode()
        address = bytesAddressPair[1]
        clientMsg = "Message from Client: {}".format(message)
        clientIP  = "Client IP Address: {}".format(address) 
        print(clientMsg)
        print(clientIP)
        
        # Sending data to client
        printProgressBar(0, fileSize, prefix = 'File download:', suffix = 'Complete', length = 50)

        data = f.read(bufferSize).encode()
        itrSize = 0
        while(data):
            if(UDPServerSocket.sendto(data, address)):
                # Progress Bar
                if (itrSize + bufferSize) > fileSize:
                    itrSize = fileSize
                else:
                    itrSize += bufferSize
                printProgressBar(itrSize, fileSize, prefix = 'File download:', suffix = 'Complete', length = 50)

                data = f.read(bufferSize).encode()

        # Close 
        UDPServerSocket.close()
        f.close()

    else:
        print("File doesn't exist")