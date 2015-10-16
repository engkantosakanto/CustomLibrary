from robot.api import logger
from robot.utils import NormalizedDict

class PSMRLFinder(object):
    def __init__(self):
        strategies:{
            'pattern': self._find_by_pattern,
            'string': self._find_by_string,
            'match': self._find_by_match,
            'region': self._find_by_region,
            'location': self._find_by_location

        }
        
        def _find_by_pattern(self, locator):
            return locator

        def _find_by_string(self, locator):
            return locator

        def _find_by_match(self, locator):
            return locator

        def _find_by_region(self, locator):
            return locator

        def _find_by_location(self, locator):
            return locator
            