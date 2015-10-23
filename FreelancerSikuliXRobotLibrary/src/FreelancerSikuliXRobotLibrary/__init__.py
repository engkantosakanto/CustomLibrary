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

    """FreelancerSikuliXRobotLibrary is a testing library for Robot Framework based on the SikuliX v1.1.0 methods.

    It uses the SikuliX version 1.1.0 methods internally to control matching PSMRL (pattern, string, match, region or location).
    See http://sikulix-2014.readthedocs.org/en/latest/index.html for more information on SikuliX.

    FreelancerSikuliXRobotLibrary runs tests by matching instance of PSMRL. It should work in
    most modern OS.

    = Before running tests =
    The following must be installed:
    | `Java`           | # Version 6, 7 or 8 (preferably 7, version 6 is deprecated) |
    | `Jython`         | # Version 2.7.0                                             |
    | `robotframework` | # Installed via `jython setup.py install` (jybot must be setup in the environment variable) |
    | `SikuliX` v1.1.0 | # The sikuli script (sikulixapi.jar) must be installed together with the Tesseract based OCR features
     in order to read texts on screen. The Settings.OcrTextSearch and Settings.OcrTextRead must be set to True. 
     see http://sikulix-2014.readthedocs.org/en/latest/) |

    *Set the Environment Variables*
    The following must be included in the environment variables:
    | `CLASSPATH` = <sikulixapi.jar's directory>      | # Must be setup in the environment variable in the test PC or Node |
    | `JYTHONPATH` = <sikulixapi.jar's directory>/Lib | # Must be setup in the environment variable in the test PC or Node |

    = Installing the FreelancerSikuliXRobotLibrary =
    | 1. Copy the FreelancerSikuliXRobotLibrary to a local directory.     |
    | 2. Open a terminal or command prompt then install via easy_install. |
    | 3. Installation is successful if error: None                        |

    = Locating or specifying elements =
    All keywords in FreelancerSikuliXRobotLibrary that need to find an pattern or any of the PSMRL on the screen take an argument that serves as the `locator` (for more information about PSMRL, see http://sikulix-2014.readthedocs.org/en/latest/) . 
    `locator` is a string that describes how to locate an element 
    using a syntax specifying a pattern to search for in a screen, which is a representation of the element.

    PNG format must be used for reference patterns for better image resolution and better image detection.

    *Using locators*
    By default, when a locator value is provided, it is checked if a png with image sensitivity otherwise,
    it is treated as a string. When a locator is a string, the Ocr setting must be set to `True`.

    For example:
    | *Keywords*     | *Locators or PSMRL* | *Description*                                                                            |
    | Click Pattern  |  pattern.png = 0.90 | Locator is a PNG image format with image sensitivity set to 0.90                         |
    | Click Pattern  |  pattern.png        | Locator is a PNG image format with image sensitivity set to the default value 0.70.      |
    | Click Pattern  |  Password           | Locator as a string or non-PNG images are matched against any string or image on screen. |
    """
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    ROBOT_LIBRARY_VERSION = VERSION
    Settings.OcrTextSearch = True
    Settings.OcrTextRead = True

    def __init__(self,
                 sikulix_timeout = 10.0,
                 sikulix_scanrate = 3.0,
                 application_coordinates = None,
                 screenshot_directory = None,
                 run_on_failure ='Capture Screenshot Of Active App'
    ):

        """FreelancerSikuliXRobotLibrary can be imported with optional arguments.

        `sikulix_timeout` is the default timeout used to wait for all waiting actions.
        Default `sikulix_timeout` value is 3 seconds. It can be later set with `Set SikuliX Timeout`.

        `sikulix_scanrate` is the default search rate for the given Visual rate times per second
        until `pattern` is found or the `timeout` is reached. Default `sikulix_scanrate` value is 3.
        It can be later set with `Set SikuliX Scanrate`.

        `run_on_failure` specifies the name of a keyword (from any available
        libraries) to execute when a FreelancerSikuliXRobotLibrary keyword fails. By default
        `Capture Screenshot Of Active App` will be used to take a screenshot of the Active
        application in focus. Using the value "Nothing" will disable this feature altogether. 
        See `Register Keyword To Run On Failure` keyword for more information about this
        functionality.

        `screenshot_root_directory` specifies the default root directory that screenshots should be
        stored in. If not provided the default directory will be where robotframework places its logfile.

        Examples:
        | Library `|` FreelancerSikuliXRobotLibrary `|` 15                                                    | # Sets default sikulix_timeout to 15 seconds                                          |
        | Library `|` FreelancerSikuliXRobotLibrary `|` 0 `|` 5                                               | # Sets default sikulix_timeout to 0 seconds and default sikulix_scanrate to 5 seconds |
        | Library `|` FreelancerSikuliXRobotLibrary `|` 5 `|` run_on_failure=Capture Screenshot Of Active App | # Sets default timeout to 5 seconds and runs `Log Source` on failure                  |
        | Library `|` FreelancerSikuliXRobotLibrary `|` sikulix_timeout=5       `|` run_on_failure=Log Source | # Sets default implicit_wait to 5 seconds and runs `Log Source` on failure            |
        | Library `|` FreelancerSikuliXRobotLibrary `|` sikulix_scanrate=10     `|` run_on_failure=Nothing    | # Sets default sikulix_scanrate to 10 seconds and does nothing on failure             |
        """
        for base in FreelancerSikuliXRobotLibrary.__bases__:
            base.__init__(self)
        self.sikulix_timeout = sikulix_timeout
        self.sikulix_scanrate = sikulix_scanrate
        self.application_coordinates = application_coordinates
        self.screenshot_directory = screenshot_directory
        self.register_keyword_to_run_on_failure(run_on_failure)
        self.ROBOT_LIBRARY_LISTENER = LibraryListener()