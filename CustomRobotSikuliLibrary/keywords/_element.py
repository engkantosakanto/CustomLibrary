import os
import sys
script_dir = os.path.dirname(os.path.realpath(__file__))
sys.path.append('script_dir/..')

from sikuli import *
from locators import PatternFinder
from keywordgroup import KeywordGroup
from _logging import FindFailedError


class _ElementKeywords(KeywordGroup):
    def __init__(self):
        self._pattern_finder = PatternFinder()

    """***************************** MOUSE ACTIONS ************************************"""
    def click_pattern(self, locator):
        self._info("Clicking element '%s'." % locator)
        self._pattern_find(locator, None, None).click()

    def click_pattern_at_coordinates(self, locator, xoffset, yoffset):
        self._info("Click element '%s' in coordinates '%s', '%s'." % (locator, xoffset, yoffset))
        self._pattern_find(locator, xoffset, yoffset).click()

    def right_click_pattern(self, locator):
        self._info("Right-clicking element '%s'." % locator)
        self._pattern_find(locator, None, None).rightClick()

    def right_click_pattern_at_coordinates(self, locator, xoffset, yoffset):
        self._info("Right-clicking element '%s' in coordinates '%s', '%s'." % (locator, xoffset, yoffset))
        self._pattern_find(locator, xoffset, yoffset).rightClick()

    def double_click_pattern(self, locator):
        self._info("Double-clicking element '%s'." % locator)
        self._pattern_find(locator, None, None).doubleClick()

    def double_click_pattern_at_coordinates(self, locator, xoffset, yoffset):
        self._info("Double-clicking element '%s' in coordinates '%s', '%s'." % (locator, xoffset, yoffset))
        self._pattern_find(locator, xoffset, yoffset).doubleClick()

    #locator format locator.png = 0.7, locator.png, string
    def highlight_pattern(self, locator):
        self._info("Highlighting element '%s'." % locator)
        self._pattern_find(locator, None, None).highlight(1)

    def hover_at_pattern(self, locator):
        self._info("Hovering at element '%s'." % locator)
        self._pattern_find(locator, None, None).hover()

    def hover_at_pattern_at_coordinates(self, locator, xoffset, yoffset):
        self._info("Hovering at element '%s' in coordinates '%s', '%s'." % (locator, xoffset, yoffset))
        self._pattern_find(locator, xoffset, yoffset).hover()

    def move_mouse_at_coordinates(self, xoffset, yoffset):
        self._info("Moving mouse at coordinates '%s', '%s'." % (xoffset, yoffset))
        mouseMove(xoffset, yoffset)

    def mouse_button_down(self, mouse_button):
        self._info("Mouse down at, '%s' button." % (mouse_button))
        mouseDown(self._mouse_button(mouse_button))

    def mouse_button_up(self, mouse_button):
        self._info("Mouse up at, '%s' button." % (mouse_button))
        mouseUp(self._mouse_button(mouse_button))

    """scroll should be in the following format: Up = 12; Down = 12"""
    def scroll_from_pattern(self, locator, scroll):
        self.hover_at_pattern(locator)
        self._info("Scrolling '%s' in pattern '%s'." % (scroll, locator))
        self._scroll_direction_and_steps(locator, scroll, None, None)

    def scroll_from_pattern_at_coordinates(self, locator, scroll, xoffset, yoffset):
        self.hover_at_pattern_at_coordinates(locator, xoffset, yoffset)
        self._info("Scrolling '%s' in pattern '%s'  at coordinates '%s', '%s'." % (scroll, locator, xoffset, yoffset))
        self._scroll_direction_and_steps(locator, scroll, xoffset, yoffset)

    """************************** MOUSE ACTIONS DRAG AND DROP *****************************"""
    def drag_pattern(self, locator):
        self._info("Dragging element '%s'." % locator)
        drag(self._pattern_find(locator, None, None))

    def drop_at_pattern(self, locator):
        self._info("Dropping at element '%s'." % locator)
        dropAt(self._pattern_find(locator, None, None))

    def drag_pattern_in_coordinates(self, locator, xoffset, yoffset):
        self._info("Dragging element '%s' in coordinates '%s', '%s'." % (locator, xoffset, yoffset))
        drag(self._pattern_find(locator, xoffset, yoffset))

    def drop_pattern_at_coordinates(self, locator, xoffset, yoffset):
        self._info("Dropping element '%s' in coordinates '%s', '%s'." % (locator, xoffset, yoffset))
        dropAt(self._pattern_find(locator, xoffset, yoffset))

    """***************************** KEYBOARD ACTIONS ************************************"""
    def paste_text_in_pattern(self, locator, text):
        text = str(text)
        self._info("Pasting text '%s' in pattern '%s'." % (text, locator))
        self._pattern_find(locator, None, None).paste(text)

    def paste_text_in_pattern_at_coordinates(self, locator, text, xoffset, yoffset):
        self._info("Pasting text '%s' in '%s'  at coordinates '%s', '%s'." % (text, locator, xoffset, yoffset))
        self._pattern_find(locator, xoffset, yoffset).paste(text)

    def type_text_in_pattern(self, locator, text):
        text = str(text)
        self._info("Typing '%s' in pattern '%s'." % (text, locator))
        self._pattern_find(locator, None, None).type(text)

    def type_text_in_pattern_at_coordinates(self, locator, text, xoffset, yoffset):
        self._info("Typing text '%s' in '%s'  at coordinates '%s', '%s'." % (text, locator, xoffset, yoffset))
        self._pattern_find(locator, xoffset, yoffset).type(text)

    """***************************** READ TEXTS IN PATTERN ************************************
    Note: OCR tessdata should downloaded then put in a local directory
    For Windows, it should be put inside C:\Users\<user>\AppData\Roaming\Sikulix\SikulixTesseract
    """
    def get_text_in_pattern(self, locator):
        self._info("Getting texts in pattern '%s'." % (locator))
        return self._pattern_find(locator, None, None).text()

    def get_text_in_pattern_at_location_and_area(self, locator, location, search_area):
        self._info("Getting texts in pattern at '%s' '%s' of pattern '%s'." % (search_area, location, locator))
        return self._read_text(locator, location, search_area)

    # Private
    """***************************** Internal methods ************************************"""
    def _pattern_find(self, locator, xoffset, yoffset):
        active_app_window = App.focusedWindow();
        app_coordinates = (active_app_window.getX(), active_app_window.getY(), active_app_window.getW(), active_app_window.getH())
        setROI(*app_coordinates)
        matching_pattern = self._pattern_finder._find_pattern(locator)
        try:
            if (xoffset != None or yoffset != None):
                xoffset = int(xoffset); yoffset = int(yoffset)
                element = active_app_window.find(matching_pattern.targetOffset(xoffset, yoffset))
            else:
                element = active_app_window.find(matching_pattern)
            return element
        except FindFailed:
            message = "No matching pattern: %s found on screen." % (locator)
            raise FindFailedError(message)

    """Set Scroll direction according to Sikuli methods."""
    def _scroll_direction_and_steps(self, locator, scroll, xoffset, yoffset):
        (scroll_direction, scroll_steps) = self._pattern_finder._parse_scroll_details(scroll)
        if (scroll_direction == "up"):
            scroll_direction = WHEEL_UP
        elif (scroll_direction == "down"):
            scroll_direction = WHEEL_DOWN
        scroll_details = self._pattern_find(locator, xoffset, yoffset).wheel(scroll_direction, scroll_steps)
        return scroll_details

    def _read_text(self, locator, location, search_area):
        assert location is not None and len(location) > 0
        assert search_area is not None and len(search_area) > 0

        Settings.OcrTextSearch = True
        Settings.OcrTextRead = True

        location = location.strip().lower()
        search_area = int(search_area.strip().lower())
        pattern = self._pattern_find(locator, None, None)
        if (location == "left"):
            _read_text_in_locator = pattern.left(search_area).text()
        elif (location == "right"):
            _read_text_in_locator = pattern.right(search_area).text()
        elif (location == "above"):
            _read_text_in_locator = pattern.above(search_area).text()
        elif (location == "below"):
            _read_text_in_locator = pattern.below(search_area).text()
        #self._info(_read_text_in_locator)
        return _read_text_in_locator

    def _mouse_button(self, mouse_button):
        assert mouse_button is not None and len(mouse_button) > 0
        mouse_button = mouse_button.lower()
        if(mouse_button == "left"):
            mouse_button = Button.LEFT
        elif(mouse_button == "middle"):
            mouse_button = Button.MIDDLE
        elif(mouse_button == "right"):
            mouse_button = Button.RIGHT
        return mouse_button

    def _set_ROI(self):
        setROI(*self.get_active_app_coordinates())

