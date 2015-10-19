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

    """CustomRobotSikuliLibrary is sikuli-based testing library for Robot Framework.

    It uses the SikuliX version 1.1.0 methods internally to control matching PSMRL (pattern, string, match, region or location).
    See http://sikulix-2014.readthedocs.org/en/latest/index.html for more information on SikuliX.

    CustomRobotSikuliLibrary runs tests by matching instance of PSMRL. It should work in
    most modern OS.

    = Before running tests = 
    SikuliX v1.1.0 must be installed.

    All keywords in CustomRobotSikuliLibrary that need to find an pattern or any of the PSMRL on the screen
    take an argument that serves as the `locator`.
    `locator` is a string that describes how to locate an element using a syntax
    specifying a pattern to search for in a screen, which is a representation of the element.

    PNG format must be used for reference patterns for better image resolution and better image detection.

    *Using locators*
    ---------------
    By default, when a locator value is provided, it is checked if a png with image sensitivity otherwise,
    it is treated as a string. When a locator is a string, the Ocr setting must be set to `True`.

    For example:
    |  Click Pattern    freelancerlogo.png = 0.90
    |  Click Pattern    freelancerlogo.png
    |  Click Pattern    Password

    The first example is evaluated as a PNG image format with image sensitivity set to 0.90.
    The second example is evaluated as a PNG image format with image sensitivity set to the default value 0.70.
    The third example is evaluated as a string and is matched against any string on screen.
    """

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    ROBOT_LIBRARY_VERSION = VERSION

    """ Set Ocr settings to True to enable text searching and reading in patterns."""
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
