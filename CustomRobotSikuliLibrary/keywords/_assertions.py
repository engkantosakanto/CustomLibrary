import os
import sys
script_dir = os.path.dirname(os.path.realpath(__file__))
sys.path.append('script_dir/..')

from sikuli import *
from locators import PatternFinder
from keywordgroup import KeywordGroup

class _AssertionKeywords(KeywordGroup):

    def __init__(self):
        self._pattern_finder = PatternFinder()

    def assert_pattern_is_visible(self, pattern):
        self._info("Asserting that pattern, '%s' is visible in app." % (pattern))
        self._set_ROI()
        assert exists(self._pattern_finder._find_pattern(pattern))

    def assert_pattern_is_not_visible(self, pattern):
        self._info("Asserting that pattern, '%s' is not visible in app." % (pattern))
        self._set_ROI()
        assert not exists(self._pattern_finder._find_pattern(pattern))