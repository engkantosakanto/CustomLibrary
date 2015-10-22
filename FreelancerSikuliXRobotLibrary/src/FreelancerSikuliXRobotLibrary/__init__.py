from sikuli import *
from keywords import *
from version import VERSION
from utils import LibraryListener

__version__ = VERSION

class FreelancerSikuliXRobotLibrary(
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

    """FreelancerSikuliXRobotLibrary is sikuli-based testing library for Robot Framework.

    It uses the SikuliX version 1.1.0 methods internally to control matching PSMRL (pattern, string, match, region or location).
    See http://sikulix-2014.readthedocs.org/en/latest/index.html for more information on SikuliX.

    FreelancerSikuliXRobotLibrary runs tests by matching instance of PSMRL. It should work in
    most modern OS.

    = Before running tests =
    The following must be installed:
    Jython
    SikuliX v1.1.0 See https://launchpad.net/sikuli/sikulix/1.1.0

    *Set the Environment Variables*
    The following must be included in the environment variables:
    CLASSPATH = <sikulixapi.jar's directory>
    JYTRHON = <sikulixapi.jar's directory>/Lib

    = Locating or specifying elements =
    All keywords in FreelancerSikuliXRobotLibrary that need to find an pattern or any of the PSMRL on the screen
    take an argument that serves as the `locator`. `locator` is a string that describes how to locate an element 
    using a syntax specifying a pattern to search for in a screen, which is a representation of the element.

    PNG format must be used for reference patterns for better image resolution and better image detection.

    *Using locators*
    By default, when a locator value is provided, it is checked if a png with image sensitivity otherwise,
    it is treated as a string. When a locator is a string, the Ocr setting must be set to `True`.

    For example:
    | *Keywords*     | *Locators or PSMRL*        | *Description*                                                                             |
    | Click Pattern  |  freelancerlogo.png = 0.90 | Locator is a PNG image format with image sensitivity set to 0.90                        |
    | Click Pattern  |  freelancerlogo.png        | Locator is a PNG image format with image sensitivity set to the default value 0.70      |
    | Click Pattern  |  Password                  | Locator as a string or non-PNG images are matched against any string or image on screen |
    """
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    ROBOT_LIBRARY_VERSION = VERSION

    Settings.OcrTextSearch = True
    Settings.OcrTextRead = True



    def __init__(self,
                 application_coordinates = None,
                 screenshot_directory = None,
                 run_on_failure ='Capture Screenshot Of Active App'
    ):

        """FreelancerSikuliXRobotLibrary can be imported with optional arguments.

        `timeout` is the default timeout used to wait for all waiting actions.
        It can be later set with `Set Selenium Timeout`.

        'implicit_wait' is the implicit timeout that Selenium waits when
        looking for elements.
        It can be later set with `Set Selenium Implicit Wait`.
        See `WebDriver: Advanced Usage`__ section of the SeleniumHQ documentation
        for more information about WebDriver's implicit wait functionality.

        __ http://seleniumhq.org/docs/04_webdriver_advanced.html#explicit-and-implicit-waits

        `run_on_failure` specifies the name of a keyword (from any available
        libraries) to execute when a FreelancerSikuliXRobotLibrary keyword fails. By default
        `Capture Page Screenshot` will be used to take a screenshot of the current page.
        Using the value "Nothing" will disable this feature altogether. See
        `Register Keyword To Run On Failure` keyword for more information about this
        functionality.

        `screenshot_root_directory` specifies the default root directory that screenshots should be
        stored in. If not provided the default directory will be where robotframework places its logfile.

        Examples:
        | Library `|` FreelancerSikuliXRobotLibrary `|` 15                                            | # Sets default timeout to 15 seconds                                       |
        | Library `|` FreelancerSikuliXRobotLibrary `|` 0 `|` 5                                       | # Sets default timeout to 0 seconds and default implicit_wait to 5 seconds |
        | Library `|` FreelancerSikuliXRobotLibrary `|` 5 `|` run_on_failure=Log Source               | # Sets default timeout to 5 seconds and runs `Log Source` on failure       |
        | Library `|` FreelancerSikuliXRobotLibrary `|` implicit_wait=5 `|` run_on_failure=Log Source | # Sets default implicit_wait to 5 seconds and runs `Log Source` on failure |
        | Library `|` FreelancerSikuliXRobotLibrary `|` timeout=10      `|` run_on_failure=Nothing    | # Sets default timeout to 10 seconds and does nothing on failure           |
        """
        for base in FreelancerSikuliXRobotLibrary.__bases__:
            base.__init__(self)
        self.application_coordinates = application_coordinates
        self.screenshot_directory = screenshot_directory
        self.register_keyword_to_run_on_failure(run_on_failure)
        self.ROBOT_LIBRARY_LISTENER = LibraryListener()