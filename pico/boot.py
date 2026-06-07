# boot.py
KNOWN_NETWORKS = {
    "Master":     "paconnect",
    "blackpaint": "fashionweek2026",
    "whitepaint": "fashionweek2026",
}
# --- Do not edit below this line ---
import network
import time
import rp2

rp2.country('PH')

wlan = network.WLAN(network.STA_IF)
wlan.active(True)
network.hostname("karpinter")  # <-- ADD THIS (must be before connect)

wlan.config(pm=0xa11140)
print("Scanning for networks...")
available_ssids = [net[0].decode() for net in wlan.scan()]
print("Found:", available_ssids)

connected = False
for ssid, password in KNOWN_NETWORKS.items():
    if ssid in available_ssids:
        print(f"Connecting to {ssid}...")
        wlan.connect(ssid, password)
        for _ in range(10):
            if wlan.status() < 0 or wlan.status() >= 3:
                break
            print("Waiting...")
            time.sleep(1)
        if wlan.status() == 3:
            print(f"Connected! IP: {wlan.ifconfig()[0]}")
            connected = True
            break
        else:
            print(f"Failed to connect to {ssid}, trying next...")

if not connected:
    print("No known network available.")
