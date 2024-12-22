from scapy.all import *
import time

# Set up variables
UDP_PORT = 5006  # Port to monitor
packets_received_prev = 0

# Function to monitor UDP traffic
def monitor_udp_throughput(packet):
    global packets_received_prev

    # Check if the packet is UDP and if it's on the specified port
    if packet.haslayer(UDP) and packet[UDP].dport == UDP_PORT:
        packets_received = packets_received_prev + 1
        packets_received_rate = packets_received - packets_received_prev  # Packets per second
        packets_received_prev = packets_received

        # Clear the terminal and print real-time packet rate
        os.system('cls' if os.name == 'nt' else 'clear')  # Clear the terminal screen
        print(f"Monitoring UDP traffic on port {UDP_PORT}...")
        print(f"Packets received: {packets_received_rate} packets/sec")
        print("-" * 40)

# Start sniffing on the network interface
def start_sniffing():
    print("Starting packet sniffing...")
    sniff(filter=f"udp port {UDP_PORT}", prn=monitor_udp_throughput, store=0)

if __name__ == "__main__":
    start_sniffing()
