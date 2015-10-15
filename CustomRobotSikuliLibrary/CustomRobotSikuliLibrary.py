from __future__ import with_statement
from sikuli import *
from keywords import *
from version import VERSION

__version__ = VERSION

class CustomRobotSikuliLibrary(
    _ApplicationKeywords,
    _ElementKeywords,
    _ImageLibraryKeywords,
    _OperatingSystemKeywords,
    _RegionKeywords
    ):

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    ROBOT_LIBRARY_VERSION = VERSION
    Settings.OcrTextSearch = True
    Settings.OcrTextRead = True

    def __init__(self,
        application_coordinates = None
        ):
        for base in CustomRobotSikuliLibrary.__bases__:
            base.__init__(self)
        self.application_coordinates = application_coordinates