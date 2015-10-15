from sikuli import *

class _ElementKeywords():
    def __init__(self):
        self.appCoordinates = (SCREEN.getX(), SCREEN.getY(), SCREEN.getW(), SCREEN.getH())

    def click_element(self, locator):
        """Click a pattern, string, match, region or location matching the given locator"""
        click(self._element_find(locator))

    # Private
    def _element_find(self, locator):
        return locator