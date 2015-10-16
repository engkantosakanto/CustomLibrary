import os
import sys
script_dir = os.path.dirname(os.path.realpath(__file__))
sys.path.append('script_dir/..')

import utils
from robot.api import logger
from robot.utils import NormalizedDict
from sikuli import *

class PatternFinder(object):
    def __init__(self):
        self.locator = None


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

    def find_pattern(self, locator):
        assert locator is not None and len(locator) > 0
        (pattern, sensitivity) = self._parse_locator(locator)


        if (sensitivity != None):
            sensitivity = float(sensitivity)
            return Pattern(pattern).similar(sensitivity)
        else:
            return pattern
