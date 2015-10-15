from sikuli import *

class _ImageLibraryKeywords():
    def __init__(self):
        self.image_library_directory = None


    def set_image_library(self, path):
        # Sikuli script for assigning the default image path
        self.set_image_library_directory(path)
        addImagePath(self.image_library_directory)

    # Private
    def set_image_library_directory(self, path):
        self.image_library_directory = path

    def _get_image_library_directory(self):
        # Use the image library directory if set
        if self.image_library_directory is not None:
            return self.image_library_directory