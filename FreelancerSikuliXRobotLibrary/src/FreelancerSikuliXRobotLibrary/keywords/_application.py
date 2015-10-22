from sikuli import *
from keywordgroup import KeywordGroup

class _ApplicationKeywords(KeywordGroup):
    def __init__(self):
        self.application_name = None
        self.application_path = None
    
    # Public
    
    def set_application_focus(self, app_name):
        """Sets focus to the open application matching the given app_name.
        Example:
        | Set Application Focus | My Awesome App | # Sets the focus to My Awesome App
        """
        self._info("Setting focus at application '%s'." % app_name)
        self._set_application_name(app_name)
        try:
            App.focus(self.application_name)
        except FinFailed, err:
            raise AssertionError("Application '%s' not found." % (app_name))

    def switch_application_focus(self, app_name):
        """Switches focus to the open application matching the given app_name.
        Example:
        | Set Application Focus    | My Awesome App      | # Switches  the focus to `My Awesome App` application
        | Switch Application Focus | My Very Awesome App | # Switches  the focus to `My Very Awesome App`
        """
        self._info("Switching focus to application '%s'." % app_name)
        self._set_application_name(app_name)
        try:
            switchApp(self.application_name)
        except FinFailed, err:
            raise AssertionError("Application '%s' not found." % (app_name))

    def open_application(self, path, app_name):
        """Opens applicataion matching the given app_name and path."""
        self._info("Opening application '%s' in path '%s'." % (app_name, path))
        self._set_application_path(path)
        self._set_application_name(app_name)
        try:
            if not App(self.application_name).isRunning():
                App.open(self.application_directory)
        except FindFailed, err:
            raise AssertionError("Application '%s' not found." % (app_name))

    def close_application(self, app_name):
        """Closes the open application matching the given app_name."""
        self._info("Closing application '%s'." % app_name)
        self._set_application_name(app_name)
        if App(self.application_name).isRunning():
            App.close(self.application_name)

    # Private
    """***************************** Internal Methods ************************************"""
    def _set_application_name(self, application_name):
        self.application_name = application_name

    def _get_application_name(self):
        if self.application_name is not None:
            return self.application_name

    def _set_application_path(self, application_path):
        if not self._path_exists(path):
            raise AssertionError("Path '%s' does not exist." % (path))
        else:
            self.application_path = application_path

    def _get_application_path(self):
        if self.application_path is not None:
            return self.application_path