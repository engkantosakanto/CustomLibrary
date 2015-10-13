from __future__ import with_statement
from sikuli import *
from keywords import *
from version import VERSION

class CustomRobotSikuliLibrary(_MouseAndKeyboardActionsKeywords):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    ROBOT_LIBRARY_VERSION = VERSION
    def __init__(self):
        addImagePath("C:/Users/calcifer/Desktop/SikuliTest/Images")