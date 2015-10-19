from sikuli import *
from keywordgroup import KeywordGroup

class _KeyboardActionsKeywords(KeywordGroup):
    #def __init__(self):

    """***************************** KEYBOARD ACTIONS ************************************
    Keyword to implement pressing keyboard keys.
    Note: If the key is not in the map of supported keyboard keys, the specified string or character
    is typed instead as a string or character respectively.
    """
    def press_key(self, key):
        activeWindow = App.focusedWindow(); wait(0.5)
        activeWindow.type(self._map_supported_keyboard_keys(key))

    """ Simulates pressing key combinations.
    2-key combination example: Ctrl + Shift
    3-key combination example: Ctrl + Shift + Delete
    For Example:
    | Press Two Key Combination    CTRL    A
    | Press Two Key Combination    CTRL    SHIFT
    | Press Three Key Combination    CTRL    ALT    DELETE

    """
    def press_two_key_combination(self, first_key, second_key):
        activeWindow = App.focusedWindow(); wait(0.5)
        first_key = self._map_supported_keyboard_keys(first_key)
        second_key = self._map_supported_keyboard_keys(second_key)
        activeWindow.type(second_key, first_key)

    def press_three_key_combination(self, first_key, second_key, third_key):
        activeWindow = App.focusedWindow(); wait(0.5)
        first_key = self._map_supported_keyboard_keys(first_key)
        second_key = self._map_supported_keyboard_keys(second_key)
        third_key = self._map_supported_keyboard_keys(third_key)
        activeWindow.type(third_key, first_key + second_key)

    """ Simulates pressing a key multiple times as specified by count value
    For Example:
    | Press Key N Times   BACKSPACE    5
    | Press Key N Times   A    5
    """
    def press_key_n_times(self, keyboard_key, count):
        activeWindow = App.focusedWindow(); wait(0.5)
        count = int(count)
        keyboard_key = self._map_supported_keyboard_keys(keyboard_key)
        activeWindow.type(keyboard_key * count)

    def type_string(self, string_param):
        string_param = self._clean_string(string_param)
        activeWindow = App.focusedWindow(); wait(0.5)
        activeWindow.type(string_param)

    # Privatell
    """***************************** INTERNAL METHODS ************************************"""
    def _clean_string(self, string_param):
        string_param = str(string_param)
        assert string_param is not None and len(string_param) > 0
        string_param = string_param.strip()
        return string_param

    def _map_supported_keyboard_keys(self, keyboard_key):
        assert keyboard_key is not None and len(keyboard_key) > 0
        map = {
            "WIN": Key.WIN,
            "ENTER": Key.ENTER,
            "ALT": Key.ALT,
            "CMD": Key.CMD,
            "CTRL": Key.CTRL,
            "META": Key.META,
            "SHIFT": Key.SHIFT,
            "ALTGR": Key.ALTGR,
            "TAB": Key.TAB,
            "ESC": Key.ESC,
            "SPACE": Key.SPACE,
            "UP": Key.UP,
            "DOWN": Key.DOWN,
            "LEFT": Key.LEFT,
            "RIGHT": Key.RIGHT,
            "DELETE": Key.DELETE,
            "BACKSPACE": Key.BACKSPACE,
            "INSERT": Key.INSERT,
            "PAGE_UP": Key.PAGE_UP,
            "PAGE_DOWN": Key.PAGE_DOWN,
            "HOME": Key.HOME,
            "END": Key.END,
            "PRINTSCREEN": Key.PRINTSCREEN,
            "PAUSE": Key.PAUSE,
            "CAPS_LOCK": Key.CAPS_LOCK,
            "SCROLL_LOCK": Key.SCROLL_LOCK,
            "NUM_LOCK": Key.NUM_LOCK,
            "NUM0": Key.NUM0,
            "NUM1": Key.NUM1,
            "NUM2": Key.NUM2,
            "NUM3": Key.NUM3,
            "NUM4": Key.NUM4,
            "NUM5": Key.NUM5,
            "NUM6": Key.NUM6,
            "NUM7": Key.NUM7,
            "NUM8": Key.NUM8,
            "NUM9": Key.NUM9,
            "SEPARATOR": Key.SEPARATOR,
            "ADD": Key.ADD,
            "MINUS": Key.MINUS,
            "MULTIPLY": Key.MULTIPLY,
            "DIVIDE": Key.DIVIDE,
            "F1": Key.F1,
            "F2": Key.F2,
            "F3": Key.F3,
            "F4": Key.F4,
            "F5": Key.F5,
            "F6": Key.F6,
            "F7": Key.F7,
            "F8": Key.F8,
            "F9": Key.F9,
            "F10": Key.F10,
            "F11": Key.F11,
            "F12": Key.F12
        }
        key = map.get(keyboard_key)
        if key is None:
            return keyboard_key
        return key