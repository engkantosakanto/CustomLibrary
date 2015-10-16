import os
import sys
script_dir = os.path.dirname(os.path.realpath(__file__))
sys.path.append('script_dir/..')

import utils
from sikuli import *
from locators import PatternFinder
from keywordgroup import KeywordGroup

class _ElementKeywords(KeywordGroup):
    def __init__(self):
        self._pattern_finder = PatternFinder()

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

    def click_pattern(self, locator):
        self._info("Clicking element '%s'." % locator)
        self._pattern_find(locator, None, None).click()

    def click_pattern_at_coordinates(self, locator, xoffset, yoffset):
        self._info("Click element '%s' in coordinates '%s', '%s'." % (locator, xoffset, yoffset))
        self._pattern_find(locator, xoffset, yoffset).click()

    def rigt_click_pattern(self, locator):
        self._info("Right-clicking element '%s'." % locator)
        self._pattern_find(locator, None, None).rightClick()

    def click_pattern_at_coordinates(self, locator, xoffset, yoffset):
        self._info("Right-clicking element '%s' in coordinates '%s', '%s'." % (locator, xoffset, yoffset))
        self._pattern_find(locator, xoffset, yoffset).rightClick()

    def double_click_pattern(self, locator):
        self._info("Double-clicking element '%s'." % locator)
        self._pattern_find(locator, None, None).doubleClick()

    def double_click_pattern_at_coordinates(self, locator, xoffset, yoffset):
        self._info("Double-clicking element '%s' in coordinates '%s', '%s'." % (locator, xoffset, yoffset))
        self._pattern_find(locator, xoffset, yoffset).doubleClick()

    def type_text_in_pattern(self, locator, text):
        text = str(text)
        self._info("Typing '%s' in pattern '%s'." % (text, locator))
        self._pattern_find(locator, None, None).type(text)

    def type_text_in_pattern_at_coordinates(self, locator, text, xoffset, yoffset):
        self._info("Typing text '%s' in '%s'  at coordinates '%s', '%s'." % (text, locator, xoffset, yoffset))
        self._pattern_find(locator, xoffset, yoffset).type(text)

    def paste_text_in_pattern(self, locator, text):
        text = str(text)
        self._info("Pasting text '%s' in pattern '%s'." % (text, locator))
        self._pattern_find(locator, None, None).paste(text)

    def paste_text_in_pattern_at_coordinates(self, locator, text, xoffset, yoffset):
        self._info("Pasting text '%s' in '%s'  at coordinates '%s', '%s'." % (text, locator, xoffset, yoffset))
        self._pattern_find(locator, xoffset, yoffset).paste(text)

    # Private
    def _pattern_find(self, locator, xoffset, yoffset):
        active_app_window = App.focusedWindow();
        app_coordinates = (active_app_window.getX(), active_app_window.getY(), active_app_window.getW(), active_app_window.getH())
        setROI(*app_coordinates)
        matching_pattern = self._pattern_finder.find_pattern(locator)
        if (xoffset != None or yoffset != None):
            xoffset = int(xoffset); yoffset = int(yoffset)
            element = active_app_window.find(matching_pattern.targetOffset(xoffset, yoffset))
        else:
            element = active_app_window.find(matching_pattern)
        return element