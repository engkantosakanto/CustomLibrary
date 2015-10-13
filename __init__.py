import os
from keywords import *
from version import VERSION
from utils import LibraryListener

__version__ = VERSION

class CustomSikuliLibrary(
    _LoggingKeywords,
    _RunOnFailureKeywords,
    _BrowserManagementKeywords,
    _ElementKeywords,
    _TableElementKeywords,
    _FormElementKeywords,
    _SelectElementKeywords,
    _JavaScriptKeywords,
    _CookieKeywords,
    _ScreenshotKeywords,
    _WaitingKeywords,
    _AlertKeywords
):
    """CustomSikuliLibrary is a gui testing library for Robot Framework.

    It uses the SikuliX 1.1.0 libraries internally to control a gui.
    See http://sikulix-2014.readthedocs.org/en/latest/index.html# for more information on SikuliX 1.1.0.

    Selenium2Library runs tests in a real browser instance. It should work in
    most modern browsers and can be used with both Python and Jython interpreters.
    """

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    ROBOT_LIBRARY_VERSION = VERSION

    def __init__(self,
                 timeout=5.0,
                 implicit_wait=0.0,
                 run_on_failure='Capture Page Screenshot',
                 screenshot_root_directory=None
    ):

        """CustomSikuliLibrary can be imported with optional arguments.

        `timeout` is the default timeout used to wait for all waiting actions.
        It can be later set with `Set Selenium Timeout`.

        """
        for base in Selenium2Library.__bases__:
            base.__init__(self)
        self.screenshot_root_directory = screenshot_root_directory
        self.set_selenium_timeout(timeout)
        self.set_selenium_implicit_wait(implicit_wait)
        self.register_keyword_to_run_on_failure(run_on_failure)
        self.ROBOT_LIBRARY_LISTENER = LibraryListener()
