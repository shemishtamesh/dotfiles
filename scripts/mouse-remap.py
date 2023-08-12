#!/bin/python3
from pynput import mouse, keyboard


mouse_controller = mouse.Controller()
keyboard_controller = keyboard.Controller()


def on_click(x, y, button, pressed):
    match (button, pressed):
        case (mouse.Button.button9, True):
            keyboard_controller.press(keyboard.Key.cmd)
            print(f'{button=}, {pressed=} (super)')
        case (mouse.Button.button9, False):
            keyboard_controller.release(keyboard.Key.cmd)
            print(f'{button=}, {pressed=} (super)')
        case (button, pressed):
            print(f'{button=}, {pressed=}')


# Collect events until released
with mouse.Listener(on_click=on_click) as listener:
    listener.join()
