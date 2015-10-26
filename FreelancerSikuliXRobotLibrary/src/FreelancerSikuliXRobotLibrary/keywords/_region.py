from sikuli import *
from keywordgroup import KeywordGroup
from FreelancerSikuliXRobotLibrary.locators import PatternFinder
from FreelancerSikuliXRobotLibrary import utils

class _RegionKeywords(KeywordGroup):
    def __init__(self):
        # Set target coordinates to Screen 1 as default
        self.target_coordinates = (SCREEN.getX(), SCREEN.getY(), SCREEN.getW(), SCREEN.getH())
        self.screen = Screen()
        self._pattern_finder = PatternFinder()

    # Public

    def set_search_region(self, coordinates):
        """Sets the ROI or the search area to a specified `coordinates`.
        Searching for pattern match is faster if the search region is smaller. 
        """
        self._info("Setting search region to '%s'." % coordinates)
        self._set_coordinates(coordinates)
        setROI(*self.target_coordinates)

    def set_new_search_region_in_active_app(self, offsets):
        """Sets new ROI or the search area to a specified `offsets` based on offsets of `active screen` region.

        Example:
        | Set New Search Region In Active App | 10, 60, -20, -270 | # Offsets x, y, height, width to 10, 60, -20, -270pixels respectively.|
        """
        (offsetx, offsety, offsetw, offseth) = self._parse_coordinate_offsets(offsets)
        active_app_region = self.get_active_app_region()
        new_coordinates = (active_app_region.x + offsetx, 
                           active_app_region.y + offsety,
                           active_app_region.w + offsetw,
                           active_app_region.h + offseth
                           )
        setROI(*new_coordinates)

    def set_new_search_region_in_active_screen(self, offsets):
        """Sets new ROI or new search area to a specified `offsets` based on offsets of `active app` region.

        Example:
        | Set New Search Region In Active App | 10, 60, -20, -270 | # Offsets x, y, height, width to 10, 60, -20, -270pixels respectively.|
        """
        (offsetx, offsety, offsetw, offseth) = self._parse_coordinate_offsets(offsets)
        active_screen_region = self.get_active_screen_region()
        new_coordinates = (active_screen_region.x + offsetx, 
                           active_screen_region.y + offsety,
                           active_screen_region.w + offsetw,
                           active_screen_region.h + offseth
                           )
        setROI(*new_coordinates)


    def get_active_screen_coordinates(self):
        """Returns the `coordinates` of the active screen.
        """
        coordinates = (SCREEN.getX(), SCREEN.getY(), SCREEN.getW(), SCREEN.getH())
        self._set_coordinates(coordinates)
        return self.target_coordinates

    def get_active_app_coordinates(self):
        """Returns the `coordinates` of the `application` in focus.
        Keyword must be combined with `Set Application Focus`.

        Examples:
        | Set Application Focus      | My Awesome App | # Sets the focus to `My Awesome App`      |
        | Get Active App Coordinates |                |# Gets the coordinates of `My Awesome App` |
        """
        activeWindow = App.focusedWindow();
        coordinates = (activeWindow.getX(), activeWindow.getY(), activeWindow.getW(), activeWindow.getH())
        self._set_coordinates(coordinates)
        return self.target_coordinates

    def get_reference_pattern_coordinates(self, pattern):
        """Returns the `coordinates` of the element identified by `pattern`.

        Example:
        | Get Reference Pattern Coordinates | pattern.png = 0.90 | # Gets the coordinates of pattern.png |
        """
        try:
            matched_pattern = find(self._pattern_finder._find_pattern(pattern))
            coordinates = (matched_pattern.getX(), matched_pattern.getY(), matched_pattern.getW(), matched_pattern.getH())
            self._set_coordinates(coordinates)
            return self.target_coordinates
        except FindFailed, err:
            raise AssertionError("Unable to find matching pattern '%s'." % (pattern))

    def get_active_screen_region(self):
        """Returns the `region` of the active screen.
        """
        return Region(*self.get_active_screen_coordinates())

    def get_active_app_region(self):
        """Returns the `region` of the `application` in focus.
        """
        return Region(*self.get_active_app_coordinates())

    def get_reference_pattern_region(self, pattern):
        """Returns the `region` of the element identified by `pattern`.
        """
        return Region(*self.get_reference_pattern_coordinates(pattern))

    # Private
    """***************************** Internal Methods ************************************"""
    def _set_coordinates(self, target_coordinates):
        self.target_coordinates = target_coordinates

    def _get_coordinates(self):
        return self.target_coordinates

    def _parse_coordinate_offsets(self, offsets):
        assert offsets is not None and len(offsets) > 0
        offsets = offsets.split(',')
        offset_list = []
        for offset in offsets:
            offset_list.append(int(self._clean_string(offset)))
        return offset_list
