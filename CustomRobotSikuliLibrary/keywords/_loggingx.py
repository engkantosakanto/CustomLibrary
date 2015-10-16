# -*- coding: utf-8 -*-
from __future__ import with_statement
import logging
import datetime
import shutil
import os
from robot.api import logger
from sikuli import *


# hack to properly handle WARNING log level
logging.addLevelName(logging.WARNING, 'WARN')
# add HTML log level
HTML = logging.INFO + 5
logging.addLevelName(HTML, 'HTML')

class _LoggingKeywordHandler(logging.Handler):
    def __init__(self):
        logging.Handler.__init__(self, level=logging.DEBUG)


    def emit(self, record):
        print self.format(record)

    def format(self, record):
        if not self.formatter:
            # add default formatter
            self.formatter = logging.Formatter('*%(levelname)s* %(message)s')
        return self.formatter.format(record)

class _LoggingKeywords(logging.Logger):
    def __init__(self, name='robot', level= logging.DEBUG):

        self.level = level
        logging.Logger.__init__(self, name, self.level)
        self.addHandler(_LoggingKeywordHandler())
        self.screenshot_directory = "logs/screenshots"

    def _set_logging_level(self, log_level):
        log_level = log_level.lower()
        if (log_level == 'info'): self.level = logging.info
        elif (log_level == 'debug'): self.level = logging.debug
        elif (log_level == 'warning'): self.level = logging.warning
        elif (log_level == 'error'): self.level = logging.error

    def _get_logging_level(self):
        return self.level

    def _get_unique_name(self, prefix="", suffix=""):
        now = datetime.datetime.now()
        return prefix + now.strftime('%Y-%m-%d_%H-%M-%S') + suffix

    def _create_screenshot_directory(self, dir):
        self._set_screenshot_directory(dir)
        if not os.path.exists(self.screenshot_directory):
            os.makedirs(self.screenshot_directory)

    def _set_screenshot_directory(self, dir):
        self.screenshot_directory = dir

    def _get_screenshot_directory(self):
        return self.screenshot_directory

    def capture_active_window_screenshot(self):
        activeWindow = App.focusedWindow()
        activeWindowsRegion = (activeWindow.getX(), activeWindow.getY(), activeWindow.getW(), activeWindow.getH())

        self._create_screenshot_directory(self.screenshot_directory)
        folder = self._get_screenshot_directory()
        name = self._get_unique_name(prefix="screenshot_", suffix=".png")
        img_src = capture(*activeWindowsRegion)
        img_path =  folder + '/' + name
        msg = "Captured Screenshot: " + img_path
        shutil.copy(img_src, img_path)
        #self.html_img(msg, img_path)
        #self.log(HTML,'%s <img src="%s"/>' % (msg, img_path))
        logger.info('%s <img src="%s"/>' % (msg, img_path), True, True)
        #self.log(HTML, '%s <img src="%s"/>' % (msg, img_path))


    def _get_result_from_clipboard(self):
        type('a', KEY_CTRL); wait(1)
        type('c', KEY_CTRL)
        return str(Env.getClipboard())

    def log_info(self, msg, *args, **kwargs):
        self.info(msg, *args, **kwargs)
        
    def passed(self, msg, *args, **kwargs):
        self.info('PASS: ' + msg, *args, **kwargs)

    def failed(self, msg, *args, **kwargs):
        if self.isEnabledFor(self.level):
            self.capture_active_window_screenshot()
        raise VerificationFailed(msg)

    def html(self, msg, *args, **kwargs):
        self.log(HTML, msg, *args, **kwargs)

    def html_img(self, msg, image):
        self.html('%s <img src="%s"/>' % (msg, image))

class VerificationFailed(Exception):
    def __init__(self, value):
        self.value = value
    def __str__(self):
        return self.value