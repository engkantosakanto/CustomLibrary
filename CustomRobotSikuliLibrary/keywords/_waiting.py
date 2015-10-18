import os
import sys
script_dir = os.path.dirname(os.path.realpath(__file__))
sys.path.append('script_dir/..')

import time
import robot
from sikuli import *
from keywordgroup import KeywordGroup
from locators import PatternFinder
from _logging import FindFailedError

class _WaitingKeywords(KeywordGroup):
    def __init__(self):
        self._pattern_finder = PatternFinder()

    def wait_in_seconds(self, timeout):
        assert timeout is not None and len(timeout) > 0
        self._info("Setting wait value to '%s' seconds." % (timeout))
        timeout = float(timeout)
        wait(timeout)

    def wait_for_pattern_to_be_visible(self, pattern):
        self._set_ROI()
        self._info("Waiting for pattern '%s' to be visible." % (pattern))
        try:
            pattern = self._pattern_finder._find_pattern(pattern)
            wait(pattern)
        except FindFailed:
            error_message = "Element locator '%s' did not match any elements" % (pattern)
            raise FindFailedError(error_message)

    def wait_until_pattern_is_visible(self, pattern, timeout):
        self._info("Setting wait value to '%s'." % (timeout))
        self._set_ROI()
        try:
            timeout = self._set_timeout(timeout)
            pattern = self._pattern_finder._find_pattern(pattern)
            if (timeout == "FOREVER"):
                wait(pattern, FOREVER)
            else:
                timeout = float(timeout)
                wait(pattern, timeout)
        except FindFailed:
            error_message = "Element locator '%s' did not match any elements after %s" % (pattern, timeout)
            raise FindFailedError(error_message)

    def wait_for_pattern_to_vanish(self, pattern):
        self._info("Waiting for pattern '%s' to vanish." % (pattern))
        self._set_ROI()
        pattern = self._pattern_finder._find_pattern(pattern)
        hidden = waitVanish(pattern)
        self._debug(hidden)

        if not hidden:
           error_message  = "Element '%s' was still visible" % (pattern)
           raise FindFailedError(error_message)

    def wait_until_pattern_vanish(self, pattern, timeout):
        self._info("Setting wait value to '%s'." % (timeout))
        self._set_ROI()
        timeout = self._set_timeout(timeout)
        pattern = self._pattern_finder._find_pattern(pattern)
        hidden = None
        if (timeout == "FOREVER"):
            hidden = waitVanish(pattern, FOREVER)
        else:
            timeout = float(timeout)
            hidden = waitVanish(pattern, timeout)
        self._debug(hidden)
        if not hidden:
           error_message  = "Element '%s' was still visible in %s" % (pattern, timeout)
           raise FindFailedError(error_message)

    # Private
    """***************************** Internal methods ************************************"""
    def _set_timeout(self, timeout):
        assert timeout is not None and len(timeout) > 0
        timeout = timeout.strip().upper()
        return timeout

    def _set_ROI(self):
        setROI(*self.get_active_app_coordinates())