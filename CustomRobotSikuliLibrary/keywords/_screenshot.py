import os
import sys
script_dir = os.path.dirname(os.path.realpath(__file__))
sys.path.append('script_dir/..')

import robot
import utils
import datetime
import shutil
from sikuli import *
from keywordgroup import KeywordGroup

class _ScreenshotKeywords(KeywordGroup):
    def __init__(self):
        self.screenshot_directory = None

    def capture_screenshot_of_active_app(self):
        self.capture_screenshot("activeapp")

    def capture_screenshot(self, target):
        wait(1)
        self._info("Capturing screenshot of '%s'." % target)
        self._set_screenshot_directory(self.screenshot_directory)
        folder = self.screenshot_directory
        name = self._get_unique_name(prefix="screenshot_", suffix=".png")
        img_src = capture(*self._screenshot_targert_coordinates(target))
        img_path =  folder + '/' + name
        msg = "Captured Screenshot " + target + ":" + img_path + "\n"
        shutil.copy(img_src, img_path)
        self._html('%s </td></tr><tr><td colspan="3"><a href="%s">'
                   '<img src="%s" width="800px"></a>' % (msg, img_path, img_path))

    def _screenshot_targert_coordinates(self, target):
        assert target is not None and len(target) > 0
        target = target.lower()
        if (target == "activeapp"):
            target = self.get_active_app_coordinates()
        elif(target == "screen"):
            target = self.get_active_screen_coordinates()
        else:
            target = self.get_reference_pattern_coordinates(target)
        return target

    # Private
    """***************************** Internal methods ************************************"""
    def _get_unique_name(self, prefix="", suffix=""):
        now = datetime.datetime.now()
        return prefix + now.strftime('%Y-%m-%d_%H-%M-%S') + suffix

    def _create_screenshot_directory(self, path):
        self._set_screenshot_directory(path)
        if not os.path.exists(self.screenshot_directory):
            os.makedirs(self.screenshot_directory)

    def _set_screenshot_directory(self, path):
        self.screenshot_directory = path

    def _get_screenshot_directory(self):
        if self.screenshot_directory is not None:
            return self.screenshot_directory
        return self._get_log_dir()