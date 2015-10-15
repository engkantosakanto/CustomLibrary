from sikuli import *

class _RegionKeywords():
    def __init__(self):
        self.screen_coordinates = None
        self.screen = Screen()

    def get_active_screen_coordinates(self):
        coordinates = (SCREEN.getX(), SCREEN.getY(), SCREEN.getW(), SCREEN.getH())
        self._get_coordinates(coordinates)
        return self.screen_coordinates

    def get_active_window_coordinates(self):
        activeWindow = App.focusedWindow();
        coordinates = (activeWindow.getX(), activeWindow.getY(), activeWindow.getW(), activeWindow.getH())
        self._get_coordinates(coordinates)
        return self.screen_coordinates

    def get_reference_pattern_coordinates(self, pattern):
        self.screen.find(pattern)
        matched_pattern = getLastMatch()
        coordinates = (matched_pattern.getX(), matched_pattern.getY(), matched_pattern.getW(), matched_pattern.getH())
        self._get_coordinates(coordinates)
        return self.screen_coordinates

    def get_active_screen_region(self):
        return Region(*self.get_active_screen_coordinates())

    def get_active_window_region(self):
        return Region(*self.get_active_window_coordinates())

    def get_reference_pattern_region(self, pattern):
        return Region(*self.get_reference_pattern_coordinates(pattern))

    # Private
    def _set_coordinates(self, screen_coordinates):
        self.screen_coordinates = screen_coordinates

    def _get_coordinates(self):
        # Use the image library directory if set
        if self.screen_coordinates is not None:
            return self.screen_coordinates