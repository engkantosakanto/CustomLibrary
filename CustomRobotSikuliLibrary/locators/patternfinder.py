import os
import sys
script_dir = os.path.dirname(os.path.realpath(__file__))
sys.path.append('script_dir/..')

import utils
import robot
from robot.api import logger
from sikuli import *

class PatternFinder(object):
    def __init__(self):
        self.locator = None

    """Break down locator details to pattern and sensitivity"""
    def _parse_locator(self, locator):
        if not ".png" in locator:
            pattern = locator
            sensitivity = None
        elif ".png" in locator:
            if not locator.endswith('.png'):
                locator_parts = locator.partition('=')
                if len(locator_parts[1]) > 0:
                    pattern = locator_parts[0].strip()
                    sensitivity = locator_parts[2].strip()
            else:
                pattern = locator
                sensitivity = 0.70
        return (pattern, sensitivity)

    def _find_pattern(self, locator):
        assert locator is not None and len(locator) > 0
        locator = locator.strip().lower()
        (pattern, sensitivity) = self._parse_locator(locator)

        if (sensitivity != None):
            sensitivity = float(sensitivity)
            pattern = Pattern(pattern).similar(sensitivity)
        else:
            pattern = pattern
        return pattern

    """Break down scroll details to scroll direction and scroll steps"""
    def _parse_scroll_details(self, scroll):
        assert scroll is not None and len(scroll) > 0
        scroll = scroll.lower()
        scroll_parts = scroll.partition('=')
        if len(scroll_parts[1]) > 0:
            scroll_direction = scroll_parts[0].strip()
            scroll_steps = int(scroll_parts[2].strip())

        return (scroll_direction, scroll_steps)
