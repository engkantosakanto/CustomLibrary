import os
import sys
script_dir = os.path.dirname(os.path.realpath(__file__))
sys.path.append('script_dir/..')

from sikuli import *
from keywordgroup import KeywordGroup
from locators import PatternFinder

class _RegionKeywords(KeywordGroup):
    def __init__(self):
        self.target_coordinates = (SCREEN.getX(), SCREEN.getY(), SCREEN.getW(), SCREEN.getH())
        self.screen = Screen()
        self._pattern_finder = PatternFinder()

    def set_search_region(self, coordinates):
        self._info("Setting search region to '%s'." % coordinates)
        self._set_coordinates(coordinates)
        setROI(*self.target_coordinates)

    def get_active_screen_coordinates(self):
        coordinates = (SCREEN.getX(), SCREEN.getY(), SCREEN.getW(), SCREEN.getH())
        self._set_coordinates(coordinates)
        return self.target_coordinates

    def get_active_app_coordinates(self):
        activeWindow = App.focusedWindow();
        coordinates = (activeWindow.getX(), activeWindow.getY(), activeWindow.getW(), activeWindow.getH())
        self._set_coordinates(coordinates)
        return self.target_coordinates

    def get_reference_pattern_coordinates(self, pattern):
        matched_pattern = find(self._pattern_finder._find_pattern(pattern))
        #matched_pattern = getLastMatch()
        coordinates = (matched_pattern.getX(), matched_pattern.getY(), matched_pattern.getW(), matched_pattern.getH())
        self._set_coordinates(coordinates)
        return self.target_coordinates

    def get_active_screen_region(self):
        return Region(*self.get_active_screen_coordinates())

    def get_active_app_region(self):
        return Region(*self.get_active_app_coordinates())

    def get_reference_pattern_region(self, pattern):
        return Region(*self.get_reference_pattern_coordinates(pattern))

    # Private
    def _set_coordinates(self, target_coordinates):
        self.target_coordinates = target_coordinates

    def _get_coordinates(self):
        return self.target_coordinates

