#!/usr/bin/env python

import sys
from os.path import join, dirname

sys.path.append(join(dirname(__file__), 'src'))
from ez_setup import use_setuptools
use_setuptools()
from setuptools import setup

execfile(join(dirname(__file__), 'src', 'AutomatonRobotLibrary', 'version.py'))

DESCRIPTION = """
AutomatonRobotLibrary is a gui recognition testing library for Robot Framework
that leverages the SikuliX libraries.
"""[1:-1]

setup(name         = 'robotframework-AutomatonRobotLibrary',
      version      = VERSION,
      description  = 'SikuliX testing library for Robot Framework',
      long_description = DESCRIPTION,
      author       = 'Francis John Agunday',
      author_email = '<fagunday@freelancer.com> ,  <francisagunday@gmail.com>',
      url          = 'https://github.com/robotframework/AutomatonRobotLibrary',
      license      = 'Apache License 2.0',
      keywords     = 'robotframework testing testautomation sikuli sikulix',
      platforms    = 'any',
      classifiers  = [
                        "Development Status :: 5 - Production/Stable",
                        "License :: OSI Approved :: Apache Software License",
                        "Operating System :: OS Independent",
                        "Programming Language :: Python",
                        "Topic :: Software Development :: Testing"
                     ],
      install_requires = [
							'decorator >= 3.3.2',
							'selenium >= 2.32.0',
							'robotframework >= 2.9.1',
							'docutils >= 0.8.1'
						 ],
      py_modules=['ez_setup'],
      package_dir  = {'' : 'src'},
      packages     = ['AutomatonRobotLibrary','AutomatonRobotLibrary.keywords',
                      'AutomatonRobotLibrary.utils','AutomatonRobotLibrary.utils.events'],
      include_package_data = True,
      )