from sikuli import *
from _logging import _LoggingKeywords

class _ElementKeywords():
    def __init__(self):
        self.appCoordinates = (SCREEN.getX(), SCREEN.getY(), SCREEN.getW(), SCREEN.getH())
        self.log = _LoggingKeywords()
        self.locator = None

    def click_element(self, locator):
        """Click a pattern, string, match, region or location matching the given locator"""
        self._set_locator(locator)
        try:
            click(self.locator)
        except FindFailed:
            self.log.failed("No matching UI detected on screen or '%s' does not exist." % (self.locator,))

    # Private
    def _set_locator(self, locator):
        self.locator = locator

    def _get_locator(self):
        return self.locator