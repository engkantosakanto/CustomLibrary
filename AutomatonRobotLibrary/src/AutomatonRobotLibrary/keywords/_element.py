from com.athaydes.automaton import *
from com.athaydes.automaton import FXApp
from com.athaydes.automaton import FXer
from com.athaydes.automaton import FXAutomaton
from AutomatonRobotLibrary import utils
from keywordgroup import KeywordGroup

class _ElementKeywords(KeywordGroup):
    # Public
    def __init__(self):
        self._fxer = FXer()
        self._fxApp = FXApp()
        self._root = self._fxer.getUserWith(self._fxApp.getScene().getRoot())

    def automaton_click(self, element_id):
        self._root.clickOn(element_id)