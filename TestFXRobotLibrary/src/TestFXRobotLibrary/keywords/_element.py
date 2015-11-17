from org.testfx import *
import javafx.scene.input.MouseButton
from TestFXRobotLibrary import utils
from keywordgroup import KeywordGroup

class _ElementKeywords(KeywordGroup):
    # Public
    # Public
    def __init__(self):
        self._mouse_robot = MouseRobot()
        self._move_robot = MoveRobot()
        self._sleep_Robot = SleepRobot()
        self._click_robot = ClickRobot(_mouse_robot, _move_robot, _sleep_Robot)

    def testfx_click(self):
        self._click_robot.clickOn(MouseButton.PRIMARY)