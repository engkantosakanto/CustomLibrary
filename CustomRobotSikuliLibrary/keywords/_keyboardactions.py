from sikuli import *
from keywordgroup import KeywordGroup

class _KeyboardActionsKeywords(KeywordGroup):
    #def __init__(self):

    def press_key(self, keyboard_key):
        keyboard_key = self._keyboard_key(keyboard_key)
        activeWindow = App.focusedWindow(); wait(0.5)
        if (keyboard_key == "ENTER"):
            activeWindow.type(Key.ENTER)
        elif (keyboard_key == "TAB"):
            activeWindow.type(Key.TAB)
        elif (keyboard_key == "ESC"):
            activeWindow.type(Key.ESC)
        elif (keyboard_key == "SPACE"):
            activeWindow.type(Key.SPACE)
        elif (keyboard_key == "UP"):
            activeWindow.type(Key.UP)
        elif (keyboard_key == "DOWN"):
            activeWindow.type(Key.DOWN)
        elif (keyboard_key == "LEFT"):
            activeWindow.type(Key.LEFT)
        elif (keyboard_key == "RIGHT"):
            activeWindow.type(Key.RIGHT)
        elif (keyboard_key == "DELETE"):
            activeWindow.type(Key.DELETE)
        elif (keyboard_key == "INSERT"):
            activeWindow.type(Key.INSERT)
        elif (keyboard_key == "PAGE_UP"):
            activeWindow.type(Key.PAGE_UP)
        elif (keyboard_key == "PAGE_DOWN"):
            activeWindow.type(Key.PAGE_DOWN)
        elif (keyboard_key == "HOME"):
            activeWindow.type(Key.HOME)
        elif (keyboard_key == "END"):
            activeWindow.type(Key.END)
        elif (keyboard_key == "F1"):
            activeWindow.type(Key.F1)
        elif (keyboard_key == "F2"):
            activeWindow.type(Key.F2)
        elif (keyboard_key == "F3"):
            activeWindow.type(Key.F3)
        elif (keyboard_key == "F4"):
            activeWindow.type(Key.F4)
        elif (keyboard_key == "F5"):
            activeWindow.type(Key.F5)
        elif (keyboard_key == "F6"):
            activeWindow.type(Key.F6)
        elif (keyboard_key == "F7"):
            activeWindow.type(Key.F7)
        elif (keyboard_key == "F8"):
            activeWindow.type(Key.F8)
        elif (keyboard_key == "F9"):
            activeWindow.type(Key.F9)
        elif (keyboard_key == "F10"):
            activeWindow.type(Key.F10)
        elif (keyboard_key == "F11"):
            activeWindow.type(Key.F11)
        elif (keyboard_key == "F12"):
            activeWindow.type(Key.F12)
        else:
            activeWindow.type(keyboard_key)

    # Simulates Ctrl + Alt + <key>
    def press_CtrlAlt_plus_key(self, keyboard_key):
        keyboard_key = self._keyboard_key(keyboard_key)
        activeWindow = App.focusedWindow(); wait(0.5)
        if (keyboard_key == "DELETE"):
            activeWindow.type(Key.DELETE, KeyModifier.CTRL | KeyModifier.ALT)
        elif (keyboard_key == "ESC"):
            activeWindow.type(Key.ESC, KeyModifier.CTRL | KeyModifier.ALT)
        else:
            sleep(1)
    
    # Simulates Ctrl + Shift + <key>
    def press_CtrlShift_plus_key(self, keyboard_key):
        keyboard_key = self._keyboard_key(keyboard_key)
        activeWindow = App.focusedWindow(); wait(0.5)
        if (keyboard_key == "DELETE"):
            activeWindow.type(Key.DELETE, KeyModifier.CTRL | KeyModifier.SHIFT)
        else:
            sleep(1)
    
    # Simulates Windows + Shift + <key>
    def press_WindowsKey_plus_key(self, keyboard_key):
        keyboard_key = self._keyboard_key(keyboard_key)
        activeWindow = App.focusedWindow(); wait(0.5)
        if (keyboard_key == "UP"):
            activeWindow.type(Key.UP, KeyModifier.KEY_WIN)
        elif (keyboard_key == "DOWN"):
            activeWindow.type(Key.DOWN, KeyModifier.KEY_WIN)
        else:
            sleep(1)

    # Simulates Ctrl + <key>
    def press_Ctrl_plus_key(self, keyboard_key):
        keyboard_key = self._keyboard_key(keyboard_key)
        activeWindow = App.focusedWindow(); wait(0.5)
        activeWindow.type(keyboard_key, KeyModifier.CTRL)
        sleep(1)
    
    # Simulates Alt + <key>
    def press_Alt_plus_key(self, keyboard_key):
        keyboard_key = self._keyboard_key(keyboard_key)
        activeWindow = App.focusedWindow(); wait(0.5)
        activeWindow.type(keyboard_key, KeyModifier.ALT)
        sleep(1)

    # Simulates key press at a specified number
    # arguments: arg[0] = keyboard key; args[1] : count
    def press_key_n_times(self, keyboard_key, count):
        keyboard_key = self._keyboard_key(keyboard_key)
        if(int(count) < 1):
            wait(0)
        else:
            pressCount = 1
            while( pressCount <= int(count)):
                self.pressKey(key)
                pressCount = pressCount + 1

    # Private
    """***************************** Internal methods ************************************"""
    def _keyboard_key(self, key):
        key = str(key)
        assert key is not None and len(key) > 0
        key = key.strip().upper()
        return key