import os, errno
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
        self._screenshot_index = {}
        self._screenshot_path_stack = []
        self.screenshot_root_directory = None

    def capture_screenshot_of_active_app(self):
        self.capture_screenshot("activeapp")

    def capture_screenshot(self, target):
        wait(1)
        self._info("Capturing screenshot of '%s'." % target)

        name = self._get_unique_name(prefix="selenium-screenshot-", suffix=".png")
        path, link = self._get_screenshot_paths(name)
        self._create_directory(path)

        img_src = capture(*self._screenshot_targert_coordinates(target))
        img_path =  path + '/' + name
        msg = "Captured Screenshot " + target + ":" + img_path + "\n"
        shutil.copy(img_src, img_path)
        self._html('%s <img src="%s"/>' % (msg, img_path))

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

    def set_screenshot_directory(self, path, persist=False):
        """Sets the root output directory for captured screenshots.

        ``path`` argument specifies the absolute path where the screenshots
        should be written to. If the specified ``path`` does not exist,
        it will be created. Setting ``persist`` specifies that the given
        ``path`` should be used for the rest of the test execution, otherwise
        the path will be restored at the end of the currently executing scope.
        """
        path = os.path.abspath(path)
        self._create_directory(path)
        if persist is False:
            self._screenshot_path_stack.append(self.screenshot_root_directory)
            # Restore after current scope ends
            utils.events.on('scope_end', 'current',
                            self._restore_screenshot_directory)

        self.screenshot_root_directory = path

    # Private
    """***************************** Internal methods ************************************"""
    def _get_unique_name(self, prefix="", suffix=""):
        now = datetime.datetime.now()
        return prefix + now.strftime('%Y%m%d%H%M%S') + suffix

    def _create_directory(self, path):
        target_dir = os.path.dirname(path)
        if not os.path.exists(target_dir):
            try:
                os.makedirs(target_dir)
            except OSError as exc:
                if exc.errno == errno.EEXIST and os.path.isdir(target_dir):
                    pass
                else:
                    raise

    def _get_screenshot_directory(self):

        # Use screenshot root directory if set
        if self.screenshot_root_directory is not None:
            return self.screenshot_root_directory

        # Otherwise use RF's log directory
        return self._get_log_dir()

    # should only be called by set_screenshot_directory
    def _restore_screenshot_directory(self):
        self.screenshot_root_directory = self._screenshot_path_stack.pop()

    def _get_screenshot_paths(self, filename):
        filename = filename.format(
            index=self._get_screenshot_index(filename))
        filename = filename.replace('/', os.sep)
        screenshotdir = self._get_screenshot_directory()
        logdir = self._get_log_dir()
        path = os.path.join(screenshotdir, filename)
        link = robot.utils.get_link_path(path, logdir)
        return path, link

    def _get_screenshot_index(self, filename):
        if filename not in self._screenshot_index:
            self._screenshot_index[filename] = 0
        self._screenshot_index[filename] += 1
        return self._screenshot_index[filename]
