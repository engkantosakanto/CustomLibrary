
from _logging import _LoggingKeywords

class _ElementKeywords():
    def __init__(self):
        self._pattern_finder = PatternFinder()

    #locator format pattern = locator.png=0.7, locator.png, string
    def click_pattern(self, locator):
        self._info("Clicking element '%s'." % locator)
        self._pattern_find(locator).click()

    # Private

    def _pattern_find(self, locator):
        active_app_window = App.focusedWindow();
        app_coordinates = (active_app_window.getX(), active_app_window.getY(), active_app_window.getW(), active_app_window.getH())
        patterns = self.find_pattern(self, locator)
        return patterns


    def _parse_locator(self, locator):
        if not ".png" in locator:
            pattern = locator
            sensitivity = None
        elif ".png" in locator:
            if not locator.endswith('.png'):
                locator_parts = locator.partition('=')
                if len(locator_parts[1]) > 0:
                    pattern = locator_parts[0]
                    sensitivity = locator_parts[2].strip()
            else:
                pattern = locator
                sensitivity = 0.70
        return (pattern, sensitivity)

    def find_pattern(self, locator):
        assert locator is not None and len(locator) > 0
        (pattern, sensitivity) = self._parse_locator(locator)
        if (sensitivity = None):

        