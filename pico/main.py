#!/usr/bin/env python3
"""Pico 2W 4x3 keypad test.

Wiring for the keypad:
- Rows (outputs): GP1, GP2, GP3, GP4
- Cols (inputs with pull-ups): GP5, GP6, GP7
- Keypad ground: connect to GND

This script prints pressed keys to the serial console.
Place `boot.py` and this `main.py` on the Pico 2W.
"""

import machine
import time

ROW_PINS = [1, 2, 3, 4]
COL_PINS = [5, 6, 7]
KEYS = [
    ["1", "2", "3"],
    ["4", "5", "6"],
    ["7", "8", "9"],
    ["*", "0", "#"],
]

DEBOUNCE_MS = 20
REPEAT_DELAY_MS = 200


class PicoKeypad:
    def __init__(self, row_pins, col_pins, keys):
        self.row_pins = row_pins
        self.col_pins = col_pins
        self.keys = keys
        self.last_key_time = 0
        self.pressed_keys = set()

        self.rows = [machine.Pin(pin, machine.Pin.OUT) for pin in row_pins]
        for row in self.rows:
            row.value(1)

        self.cols = [
            machine.Pin(pin, machine.Pin.IN, machine.Pin.PULL_UP)
            for pin in col_pins
        ]

        print("[Keypad] Initialized")
        print(f"[Keypad] Rows: {row_pins}")
        print(f"[Keypad] Cols: {col_pins}")

    def scan(self):
        now = time.ticks_ms()

        for row_idx, row in enumerate(self.rows):
            row.value(0)
            time.sleep_ms(5)

            for col_idx, col in enumerate(self.cols):
                if col.value() == 0:
                    key = self.keys[row_idx][col_idx]
                    if key not in self.pressed_keys and now - self.last_key_time >= REPEAT_DELAY_MS:
                        self.pressed_keys.add(key)
                        self.last_key_time = now
                        row.value(1)
                        return key

            row.value(1)

        if now - self.last_key_time >= REPEAT_DELAY_MS:
            self.pressed_keys.clear()

        return None

    def cleanup(self):
        for row in self.rows:
            row.value(1)
        print("[Keypad] Cleanup complete")


def main():
    print("\n=== Pico 2W Keypad Test ===")
    print("Wiring:")
    print("  Rows -> GP1, GP2, GP3, GP4")
    print("  Cols -> GP5, GP6, GP7")
    print("  GND  -> keypad ground")
    print("Press keys to test, Ctrl+C to exit.\n")

    keypad = PicoKeypad(ROW_PINS, COL_PINS, KEYS)

    try:
        while True:
            key = keypad.scan()
            if key:
                print(f"[Key Pressed] {key}")
            time.sleep_ms(10)
    except KeyboardInterrupt:
        print("\n[Exit] Keyboard interrupt detected")
    finally:
        keypad.cleanup()
        print("Done.")


if __name__ == "__main__":
    main()

