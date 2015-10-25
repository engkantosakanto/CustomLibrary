from sikuli import *
from FreelancerSikuliXRobotLibrary.locators import PatternFinder
from FreelancerSikuliXRobotLibrary import utils
from keywordgroup import KeywordGroup

class _AssertionKeywords(KeywordGroup):

    def __init__(self):
        self._pattern_finder = PatternFinder()

    # Public
    
    def assert_pattern_is_visible(self, pattern):
        """Assert that pattern is visible on search region
        See `introduction` for details about locating elements.
        """
        self._info("Asserting that pattern, '%s' is visible in app." % (pattern))
        self._set_ROI_to_active_app()
        try:
            assert exists(self._pattern_finder._find_pattern(pattern))
        except AssertionError, err:
            raise AssertionError("No matching pattern: %s found in search region." % (pattern))

    def assert_pattern_is_not_visible(self, pattern):
        """Assert that `pattern` is not visible on search region
        See `introduction` for details about locating elements.
        """
        self._info("Asserting that pattern, '%s' is not visible in app." % (pattern))
        self._set_ROI_to_active_app()
        try:
            assert not exists(self._pattern_finder._find_pattern(pattern))
        except AssertionError, err:
            raise AssertionError("Pattern: %s is visible in search region." % (pattern))