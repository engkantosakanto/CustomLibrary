from sikuli import *
from CustomRobotSikuliLibrary.locators import PatternFinder
from CustomRobotSikuliLibrary import utils
from keywordgroup import KeywordGroup

class _ElementKeywords(KeywordGroup):
    def __init__(self):
        self._pattern_finder = PatternFinder()

    """***************************** MOUSE ACTIONS ************************************
    Performs mouse actions on matching pattern that will serve as locators.
    Search region or setROI() value is set to the application in focus as default.
    Locators or patterns must be any of the following format: <image.png>, <image.png> = <sensitivity from 0.00 to 0.99>, <string>
    For example:
    |  Click Pattern    freelancerlogo.png = 0.90
    |  Click Pattern    freelancerlogo.png
    |  Click Pattern    Password
    """
    def click_pattern(self, pattern):
        self._info("Clicking element '%s'." % pattern)
        self._pattern_find(pattern, None, None).click()

    def click_pattern_at_coordinates(self, pattern, xoffset, yoffset):
        self._info("Click element '%s' in coordinates '%s', '%s'." % (pattern, xoffset, yoffset))
        self._pattern_find(pattern, xoffset, yoffset).click()

    def right_click_pattern(self, pattern):
        self._info("Right-clicking element '%s'." % pattern)
        self._pattern_find(pattern, None, None).rightClick()

    def right_click_pattern_at_coordinates(self, pattern, xoffset, yoffset):
        self._info("Right-clicking element '%s' in coordinates '%s', '%s'." % (pattern, xoffset, yoffset))
        self._pattern_find(pattern, xoffset, yoffset).rightClick()

    def double_click_pattern(self, pattern):
        self._info("Double-clicking element '%s'." % pattern)
        self._pattern_find(pattern, None, None).doubleClick()

    def double_click_pattern_at_coordinates(self, pattern, xoffset, yoffset):
        self._info("Double-clicking element '%s' in coordinates '%s', '%s'." % (pattern, xoffset, yoffset))
        self._pattern_find(pattern, xoffset, yoffset).doubleClick()

    #pattern format pattern.png = 0.7, pattern.png, string
    def highlight_pattern(self, pattern):
        self._info("Highlighting element '%s'." % pattern)
        self._pattern_find(pattern, None, None).highlight(1)

    def hover_at_pattern(self, pattern):
        self._info("Hovering at element '%s'." % pattern)
        self._pattern_find(pattern, None, None).hover()

    """Note: Sikuli's x and y coordinates are as follows:
    negative x means offset left of center, positive x means offset right of center
    negative y means offset above center, positive y means offset below center
    """
    def hover_at_pattern_at_coordinates(self, pattern, xoffset, yoffset):
        self._info("Hovering at element '%s' in coordinates '%s', '%s'." % (pattern, xoffset, yoffset))
        self._pattern_find(pattern, xoffset, yoffset).hover()

    def move_mouse_at_coordinates(self, xoffset, yoffset):
        self._info("Moving mouse at coordinates '%s', '%s'." % (xoffset, yoffset))
        mouseMove(xoffset, yoffset)

    def mouse_button_down(self, mouse_button):
        self._info("Mouse down at, '%s' button." % (mouse_button))
        mouseDown(self._mouse_button(mouse_button))

    def mouse_button_up(self, mouse_button):
        self._info("Mouse up at, '%s' button." % (mouse_button))
        mouseUp(self._mouse_button(mouse_button))

    """scroll value should be in the following format: Up = 12; Down = 12"""
    def scroll_from_pattern(self, pattern, scroll):
        self.hover_at_pattern(pattern)
        self._info("Scrolling '%s' in pattern '%s'." % (scroll, pattern))
        self._scroll_direction_and_steps_from_pattern(pattern, scroll, None, None)

    def scroll_from_pattern_at_coordinates(self, pattern, scroll, xoffset, yoffset):
        self.hover_at_pattern_at_coordinates(pattern, xoffset, yoffset)
        self._info("Scrolling '%s' in pattern '%s'  at coordinates '%s', '%s'." % (scroll, pattern, xoffset, yoffset))
        self._scroll_direction_and_steps_from_pattern(pattern, scroll, xoffset, yoffset)

    def scroll_x_steps(self, scroll):
        self._info("Scrolling '%s'." % (scroll))
        self._scroll_direction_and_steps(scroll)


    """************************** MOUSE ACTIONS DRAG AND DROP *****************************
    `Drag Pattern` and `Drop At Pattern` keywords must be used in pairs for drag and drop actions.
    For example:
    |  Drag Pattern    freelancerlogo.png = 0.90
    |  Drop At Pattern    usernamefield.png
    """

    def drag_pattern(self, pattern):
        self._info("Dragging element '%s'." % pattern)
        drag(self._pattern_find(pattern, None, None))

    def drop_at_pattern(self, pattern):
        self._info("Dropping at element '%s'." % pattern)
        dropAt(self._pattern_find(pattern, None, None))

    def drag_pattern_in_coordinates(self, pattern, xoffset, yoffset):
        self._info("Dragging element '%s' in coordinates '%s', '%s'." % (pattern, xoffset, yoffset))
        try:
            drag(self._pattern_find(pattern, xoffset, yoffset))
        except FindFailed, err:
            raise AssertionError("No matching pattern: %s found on screen." % (pattern))

    def drop_pattern_at_coordinates(self, pattern, xoffset, yoffset):
        self._info("Dropping element '%s' in coordinates '%s', '%s'." % (pattern, xoffset, yoffset))
        try:
            dropAt(self._pattern_find(pattern, xoffset, yoffset))
        except FindFailed, err:
            raise AssertionError("No matching pattern: %s found on screen." % (pattern))

    def drag_and_drop(self, pattern1, pattern2):
        self._info("Performing drag and drop from element '%s' to element '%s'." % (pattern1, pattern2))
        try:
            dragDrop(self._pattern_find(pattern1, None, None), self._pattern_find(pattern2, None, None))
        except FindFailed, err:
            raise AssertionError("No matching pattern: %s found on screen." % (pattern))

    """***************************** KEYBOARD ACTIONS ************************************"""
    def paste_text_in_pattern(self, pattern, text):
        text = str(text)
        self._info("Pasting text '%s' in pattern '%s'." % (text, pattern))
        self._pattern_find(pattern, None, None).paste(text)

    def paste_text_in_pattern_at_coordinates(self, pattern, text, xoffset, yoffset):
        self._info("Pasting text '%s' in '%s'  at coordinates '%s', '%s'." % (text, pattern, xoffset, yoffset))
        self._pattern_find(pattern, xoffset, yoffset).paste(text)

    def type_text_in_pattern(self, pattern, text):
        text = str(text)
        self._info("Typing '%s' in pattern '%s'." % (text, pattern))
        self._pattern_find(pattern, None, None).type(text)

    def type_text_in_pattern_at_coordinates(self, pattern, text, xoffset, yoffset):
        self._info("Typing text '%s' in '%s'  at coordinates '%s', '%s'." % (text, pattern, xoffset, yoffset))
        self._pattern_find(pattern, xoffset, yoffset).type(text)

    """***************************** READ TEXTS IN PATTERN ************************************
    Note: OCR tessdata should downloaded then put in a local directory
    For Windows, it should be put inside C:\Users\<user>\AppData\Roaming\Sikulix\SikulixTesseract
    """
    def get_text_in_pattern(self, pattern):
        self._info("Getting texts in pattern '%s'." % (pattern))
        return self._pattern_find(pattern, None, None).text()

    def get_text_in_pattern_at_location_and_area(self, pattern, location, search_area):
        self._info("Getting texts in pattern at '%s' '%s' of pattern '%s'." % (search_area, location, pattern))
        return self._read_text(pattern, location, search_area)

    """***************************** DO SOMETHING IN MATCHING PATTERNS IN ACTIVE APP ************************************
    Keywords used when multiple patterns on screen is present.
    Search region or setROI() value is set to the application in focus as default.
    Pattern sensitivity should be set at max level (0.99) inorder to lessen false positive during image detections.
    """

    def get_pattern_count_in_active_app(self, pattern):
        self._info("Getting count of pattern '%s' in active app." % pattern)
        self._set_ROI_to_active_app()
        return len(self._get_all_patterns_in_active_app(pattern))

    def click_nth_pattern_in_active_app(self, pattern, pattern_index):
        self._info("Clicking '%s'nth pattern '%s' in active app." % (pattern_index, pattern))
        self._set_ROI_to_active_app()
        index = int(pattern_index) - 1
        self._get_all_patterns_in_active_app(pattern)[index].click()

    def right_click_nth_pattern_in_active_app(self, pattern, pattern_index):
        self._info("Clicking '%s'nth pattern '%s' in active app." % (pattern_index, pattern))
        self._set_ROI_to_active_app()
        index = int(pattern_index) - 1
        self._get_all_patterns_in_active_app(pattern)[index].rightClick()

    def double_click_nth_pattern_in_active_app(self, pattern, pattern_index):
        self._info("Double-clicking '%s'nth pattern '%s' in active app." % (pattern_index, pattern))
        self._set_ROI_to_active_app()
        index = int(pattern_index) - 1
        self._get_all_patterns_in_active_app(pattern)[index].doubleClick()

    def hover_at_nth_pattern_in_active_app(self, pattern, pattern_index):
        self._info("Hovering at '%s'nth pattern '%s' in active app." % (pattern_index, pattern))
        self._set_ROI_to_active_app()
        index = int(pattern_index) - 1
        self._get_all_patterns_in_active_app(pattern)[index].hover()

    def highlight_nth_pattern_in_active_app(self, pattern, pattern_index):
        self._info("Highlighting '%s'nth pattern '%s' in active app." % (pattern_index, pattern))
        self._set_ROI_to_active_app()
        index = int(pattern_index) - 1
        self._get_all_patterns_in_active_app(pattern)[index].highlight()

    def drag_nth_pattern_in_active_app(self, pattern, pattern_index):
        self._info("Dragging '%s'nth pattern '%s' in active app." % (pattern_index, pattern))
        self._set_ROI_to_active_app()
        index = int(pattern_index) - 1
        try:
            drag(self._get_all_patterns_in_active_app(pattern)[index])
        except FindFailed, err:
            raise AssertionError("No matching pattern: %s found on screen." % (pattern))

    def drop_at_nth_pattern_in_active_app(self, pattern, pattern_index):
        self._info("Dropping at '%s'nth pattern '%s' in active app." % (pattern_index, pattern))
        self._set_ROI_to_active_app()
        index = int(pattern_index) - 1
        try:
            dropAt(self._get_all_patterns_in_active_app(pattern)[index])
        except FindFailed, err:
            raise AssertionError("No matching pattern: %s found on screen." % (pattern))

    def drag_and_drop_from_nth_pattern(self, pattern1, pattern1_index, pattern2, pattern2_index):
        self._info("Performing drag and drop from element '%s' to element '%s'." % (pattern1, pattern2))
        index1 = int(pattern1_index) - 1
        index2 = int(pattern2_index) - 1
        try:
            dragDrop(self._get_all_patterns_in_active_app(pattern1)[index1],
                     self._get_all_patterns_in_active_app(pattern2)[index2])
        except FindFailed, err:
            raise AssertionError("No matching patterns: %s, %s found on screen." % (pattern1, pattern2))

    def type_text_at_nth_pattern_in_active_app(self, pattern, pattern_index, text):
        self._info("Typing text '%s' in '%s'nth pattern '%s' in active app." % (text, pattern_index, pattern))
        self._set_ROI_to_active_app()
        index = int(pattern_index) - 1
        self._get_all_patterns_in_active_app(pattern)[index].type(text)

    def paste_text_at_nth_pattern_in_active_app(self, pattern, pattern_index, text):
        self._info("Pasting text '%s' in '%s'nth pattern '%s' in active app." % (text, pattern_index, pattern))
        self._set_ROI_to_active_app()
        index = int(pattern_index) - 1
        self._get_all_patterns_in_active_app(pattern)[index].type(text)

    # Private
    """***************************** Internal methods ************************************"""
    def _pattern_find(self, pattern, xoffset, yoffset):
        """Finds pattern on search region set by active application.
        To do: dynamic search region where user can set the search region to either, active application, specific region or screen
        """
        active_app_window = App.focusedWindow();
        app_coordinates = (active_app_window.getX(), active_app_window.getY(), active_app_window.getW(), active_app_window.getH())
        setROI(*app_coordinates)
        matching_pattern = self._pattern_finder._find_pattern(pattern)
        try:
            if (xoffset != None or yoffset != None):
                xoffset = int(xoffset); yoffset = int(yoffset)
                element = active_app_window.find(matching_pattern.targetOffset(xoffset, yoffset))
            else:
                element = active_app_window.find(matching_pattern)
            return element
        except FindFailed, err:
            raise AssertionError("No matching pattern: %s found on screen." % (pattern))


    def _scroll_direction_and_steps(self, scroll):
        (scroll_direction, scroll_steps) = self._pattern_finder._parse_scroll_details(scroll)
        if (scroll_direction == "up"):
            scroll_direction = WHEEL_UP
        elif (scroll_direction == "down"):
            scroll_direction = WHEEL_DOWN
        return wheel(scroll_direction, scroll_steps)


    def _scroll_direction_and_steps_from_pattern(self, pattern, scroll, xoffset, yoffset):
        (scroll_direction, scroll_steps) = self._pattern_finder._parse_scroll_details(scroll)
        if (scroll_direction == "up"):
            scroll_direction = WHEEL_UP
        elif (scroll_direction == "down"):
            scroll_direction = WHEEL_DOWN
        return self._pattern_find(pattern, xoffset, yoffset).wheel(scroll_direction, scroll_steps)


    def _read_text(self, pattern, location, search_area):
        assert location is not None and len(location) > 0
        assert search_area is not None and len(search_area) > 0

        Settings.OcrTextSearch = True
        Settings.OcrTextRead = True

        location = location.strip().lower()
        search_area = int(search_area.strip().lower())
        pattern = self._pattern_find(pattern, None, None)
        if (location == "left"):
            _read_text_in_pattern = pattern.left(search_area).text()
        elif (location == "right"):
            _read_text_in_pattern = pattern.right(search_area).text()
        elif (location == "above"):
            _read_text_in_pattern = pattern.above(search_area).text()
        elif (location == "below"):
            _read_text_in_pattern = pattern.below(search_area).text()
        #self._info(_read_text_in_pattern)
        return _read_text_in_pattern

    def _mouse_button(self, mouse_button):
        assert mouse_button is not None and len(mouse_button) > 0
        mouse_button = mouse_button.lower()
        if(mouse_button == "left"):
            mouse_button = Button.LEFT
        elif(mouse_button == "middle"):
            mouse_button = Button.MIDDLE
        elif(mouse_button == "right"):
            mouse_button = Button.RIGHT
        return mouse_button

    def _set_ROI_to_active_app(self):
        self._info("Setting the search region to the active application.")
        setROI(*self.get_active_app_coordinates())

    def _set_image_order(self, match):
        return match.x, match.y

    def _get_all_patterns_in_active_app(self, pattern):
        active_app_region = Region(*self.get_active_app_coordinates())
        list_of_patterns = []; sorted_patterns = []
        found_patterns =  active_app_region.findAll(self._pattern_finder._find_pattern(pattern))
        while found_patterns.hasNext():
            list_of_patterns.append(found_patterns.next())
        sorted_patterns = sorted(list_of_patterns, key=self._set_image_order)
        return sorted_patterns