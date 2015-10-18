import os
from sikuli import *
from keywords import *
from version import VERSION
from utils import LibraryListener

THIS_DIR = os.path.dirname(os.path.abspath(__file__))
execfile(os.path.join(THIS_DIR, 'version.py'))

__version__ = VERSION

class CustomRobotSikuliLibrary(
    _ApplicationKeywords,
    _AssertionKeywords,
    _ElementKeywords,
    _KeyboardActionsKeywords,
    _ImageLibraryKeywords,
    _LoggingKeywords,
    _OperatingSystemKeywords,
    _RegionKeywords,
    _RunOnFailureKeywords,
    _ScreenshotKeywords,
    _WaitingKeywords
    ):

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    ROBOT_LIBRARY_VERSION = VERSION
    Settings.OcrTextSearch = True
    Settings.OcrTextRead = True

    def __init__(self,
                 application_coordinates = None,
                 screenshot_directory = "logs/screenshots",
                 level = "DEBUG",
                 run_on_failure ='Capture Screenshot Of Active App'
    ):
        for base in CustomRobotSikuliLibrary.__bases__:
            base.__init__(self)
        self.application_coordinates = application_coordinates
        self.screenshot_directory = screenshot_directory
        self.level = level
        self.ROBOT_LIBRARY_LISTENER = LibraryListener()
        self.register_keyword_to_run_on_failure(run_on_failure)
