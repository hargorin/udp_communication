# udp_socket
UDP/IP communication between two PCs in Python

## Requirements
* Python 3.0 or higher

## Test
To test the udp_socket do the following steps:

1. Change the IP of the following files:
	* udp_filereceiver.py
	* udp_filesender.py
2. Start the udp_filesender.py with a payload
	```bash
	python3 udp_filesender.py payload/testfile.txt
	```
3. Start the udp_filereceiver.py with a target file
	```bash
	python3 udp_filereceiver.py received.txt
	```

