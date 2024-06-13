#!/bin/env python3
import sys
import time
import argparse
import bluetooth as bt

DEFAULT_ADDRESS = "2C:BE:EB:DE:F0:55"
DEFAULT_CHANNEL = 15

def send_commands(address, channel, commands):
    sock = bt.BluetoothSocket(bt.RFCOMM)
    try:
        sock.connect((address, channel))
        for command in commands:
            print(f"Sending command: {command}")
            sock.send(bytes(int(x, 16) for x in command.split(":")))
            time.sleep(2)
    finally:
        sock.close()

def main():
    parser = argparse.ArgumentParser(description="Send commands over RFCOMM to a Bluetooth device")
    parser.add_argument("command", choices=["tra", "anc", "off", "bass", "in_ear", "latency", "find_r", "find_l"], help="Command group to send")
    parser.add_argument("--address", default=DEFAULT_ADDRESS, help=f"Bluetooth device address (default: {DEFAULT_ADDRESS})")
    parser.add_argument("--channel", type=int, default=DEFAULT_CHANNEL, help=f"RFCOMM channel number (default: {DEFAULT_CHANNEL})")
    parser.add_argument("value", nargs='?', help="Value for the bass or on/off commands")

    args = parser.parse_args()

    commands = {
        "tra": ["55:60:01:0f:f0:03:00:0e:01:07:00:f9:63"],
        "anc": ["55:60:01:0f:f0:03:00:10:01:01:00:fc:eb"],
        "off": ["55:60:01:0f:f0:03:00:0f:01:05:00:f9:ff"],
        "bass": {
            "0": ["55:60:01:51:f0:02:00:b6:00:0a:46:8c"],
            "1": ["55:60:01:51:f0:02:00:b1:01:02:f7:1b"],
            "2": ["55:60:01:51:f0:02:00:b2:01:04:87:19"],
            "3": ["55:60:01:51:f0:02:00:b3:01:06:57:18"],
            "4": ["55:60:01:51:f0:02:00:b4:01:08:67:1d"],
            "5": ["55:60:01:51:f0:02:00:b5:01:0a:b7:1c"]
        },
        "in_ear": {
            "on": ["55:60:01:04:f0:03:00:cd:01:01:01:46:f4"],
            "off": ["55:60:01:04:f0:03:00:ce:01:01:00:87:70"]
        },
        "latency": {
            "on": ["55:60:01:40:f0:02:00:cf:01:00:17:c3"],
            "off": ["55:60:01:40:f0:02:00:d0:02:00:26:f5"]
        },
        "find_r": {
            "on": ["55:60:01:02:f0:02:00:d8:03:01:05:63"],
            "off": ["55:60:01:02:f0:02:00:d9:03:00:95:63"]
        },

        "find_l": {
            "on": ["55:60:01:02:f0:02:00:d6:02:01:65:30"],
            "off": ["55:60:01:02:f0:02:00:d7:02:00:f5:30"]
        },
    }

    command_value = commands[args.command]
    if args.command == "bass" or args.command in ["in_ear", "latency", "find_r", "find_l"]:
        command_value = command_value.get(args.value)
        if not command_value:
            print(f"Invalid or missing value for the {args.command} command.")
            sys.exit(1)

    send_commands(args.address, args.channel, command_value)

if __name__ == "__main__":
    main()
