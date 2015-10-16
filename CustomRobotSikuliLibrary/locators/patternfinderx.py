from robot.api import logger
from robot.utils import NormalizedDict

class PatternFinder(object):
    def __init__(self):
        strategies:{
            'pattern': self._find_by_pattern,
            'string': self._find_by_string,
            'match': self._find_by_match,
            'region': self._find_by_region,
            'location': self._find_by_location
        }
        self._strategies = NormalizedDict(initial=strategies, caseless=True, spaceless=True)
        self._default_strategies = strategies.keys()
        
    def _find_by_pattern(self, locator, sensitivity):
        return locator

    def _find_by_string(self, locator):
        return locator

    def _find_by_match(self, locator):
        return locator

    def _find_by_region(self, locator):
        return locator

    def _find_by_location(self, locator):
        return locator

    def _parse_locator(self, locator):
    prefix = None
    criteria = locator
    if not locator.endswith('.png'):
        locator_parts = locator.partition('=')
        if len(locator_parts[1]) > 0:
            prefix = locator_parts[0]
            criteria = locator_parts[2].strip()
    return (prefix, criteria)