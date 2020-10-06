import argparse
import sys
import os
import socket
import select

serverAddressPort   = ("192.168.178.39", 60611)
bufferSize          = 1024 

msgFromClient       = "Connection established"
bytesToSend         = str.encode(msgFromClient)


def create_arg_parser():
    # Creates and returns the ArgumentParser object.

    parser = argparse.ArgumentParser(description='Received file over UDP')
    parser.add_argument('outputFile',
                    help='Path to the output file.')
    return parser 

if __name__ == "__main__":
    arg_parser = create_arg_parser()
    parsed_args = arg_parser.parse_args(sys.argv[1:])
    f = open(parsed_args.outputFile, "w")


    # Create a UDP socket at client side
    UDPClientSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)

    # Send to server using created UDP socket
    UDPClientSocket.sendto(bytesToSend, serverAddressPort)

    data, address = UDPClientSocket.recvfrom(bufferSize)
    try:
        while(data):
            f.write(data.decode())
            UDPClientSocket.settimeout(2)
            data, address = UDPClientSocket.recvfrom(bufferSize)
    except socket.timeout:
        UDPClientSocket.close()
        f.close()
        print("File downloaded")