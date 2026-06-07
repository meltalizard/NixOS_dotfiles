import sys
import time
from machine import Pin

# 4x3 keypad layout
KEYS = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['*', '0', '#']
]

# Adjust these GPIO pins to match your wiring
ROW_PINS = [2, 3, 4, 5]    # R1 R2 R3 R4
COL_PINS = [6, 7, 8]       # C1 C2 C3

rows = [Pin(p, Pin.OUT) for p in ROW_PINS]
cols = [Pin(p, Pin.IN, pull=Pin.PULL_DOWN) for p in COL_PINS]

def scan_keypad():
    for r_idx, row in enumerate(rows):
        row.high()
        for c_idx, col in enumerate(cols):
            if col.value() == 1:
                row.low()
                return KEYS[r_idx][c_idx]
        row.low()
    return None

print("Keypad ready")
last_key = None
while True:
    key = scan_keypad()

    if key and key != last_key:
        sys.stdout.write(key + '\n')
    last_key = key
    time.sleep(0.05)
