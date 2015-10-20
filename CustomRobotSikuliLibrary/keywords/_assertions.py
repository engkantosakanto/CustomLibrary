from sikuli import *
from CustomRobotSikuliLibrary.locators import PatternFinder
from CustomRobotSikuliLibrary import utils
from keywordgroup import KeywordGroup

class _AssertionKeywords(KeywordGroup):

    def __init__(self):
        self._pattern_finder = PatternFinder()

    def assert_pattern_is_visible(self, pattern):
        """Assert that pattern is visible on search region"""
        self._info("Asserting that pattern, '%s' is visible in app." % (pattern))
        self._set_ROI_to_active_app()
        assert exists(self._pattern_finder._find_pattern(pattern))

    def assert_pattern_is_not_visible(self, pattern):
        """Assert that pattern is not visible on search region"""
        self._info("Asserting that pattern, '%s' is not visible in app." % (pattern))
        self._set_ROI_to_active_app()
        assert not exists(self._pattern_finder._find_pattern(pattern))