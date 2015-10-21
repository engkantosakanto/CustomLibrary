
import time
import robot
from sikuli import *
from keywordgroup import KeywordGroup
from FreelancerSikuliXRobotLibrary.locators import PatternFinder
from FreelancerSikuliXRobotLibrary import utils

class _WaitingKeywords(KeywordGroup):
    def __init__(self):
        self._pattern_finder = PatternFinder()

    # Public

    def wait_in_seconds(self, timeout):
        assert timeout is not None and len(timeout) > 0
        self._info("Setting wait value to '%s' seconds." % (timeout))
        timeout = float(timeout)
        wait(timeout)

    def wait_for_pattern_to_be_visible(self, pattern):
        self._set_ROI_to_active_app()
        self._info("Waiting for pattern '%s' to be visible." % (pattern))
        try:
            pattern = self._pattern_finder._find_pattern(pattern)
            wait(pattern)
        except FindFailed, err:
            raise AssertionError("Element locator '%s' did not match any elements" % (pattern))

    def wait_until_pattern_is_visible(self, pattern, timeout):
        self._info("Setting wait value to '%s'." % (timeout))
        self._set_ROI_to_active_app()
        try:
            timeout = self._set_timeout(timeout)
            pattern = self._pattern_finder._find_pattern(pattern)
            if (timeout == "FOREVER"):
                wait(pattern, FOREVER)
            else:
                timeout = float(timeout)
                wait(pattern, timeout)
        except FindFailed, err:
            raise AssertionError("Element locator '%s' did not match any elements after %s" % (pattern, timeout))

    def wait_for_pattern_to_vanish(self, pattern):
        self._info("Waiting for pattern '%s' to vanish." % (pattern))
        self._set_ROI_to_active_app()
        pattern = self._pattern_finder._find_pattern(pattern)
        hidden = waitVanish(pattern)
        self._debug(hidden)

        if not hidden:
           raise AssertionError("Element '%s' was still visible" % (pattern))

    def wait_until_pattern_vanish(self, pattern, timeout):
        self._info("Setting wait value to '%s'." % (timeout))
        self._set_ROI_to_active_app()
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
           raise AssertionError("Element '%s' was still visible in %s" % (pattern, timeout))

    # Private
    """***************************** Internal methods ************************************"""
    def _set_timeout(self, timeout):
        assert timeout is not None and len(timeout) > 0
        timeout = timeout.strip().upper()
        return timeout