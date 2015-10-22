#!/usr/bin/env python

import sys
from os.path import join, dirname

sys.path.append(join(dirname(__file__), 'src'))
from ez_setup import use_setuptools
use_setuptools()
from setuptools import setup

execfile(join(dirname(__file__), 'src', 'FreelancerSikuliXRobotLibrary'))

DESCRIPTION = """
FreelancerSikuliXRobotLibrary is a gui recognition testing library for Robot Framework
that leverages the SikuliX libraries.
"""[1:-1]

setup(name         = 'robotframework-freelancersikulixrobotlibrary',
      version      = VERSION,
      description  = 'SikuliX testing library for Robot Framework',
      long_description = DESCRIPTION,
      author       = 'Francis John Agunday',
      author_email = '<fagunday@freelancer.com>',
      url          = 'https://github.com/.../FreelancerSikuliXRobotLibrary',
      license      = 'Not applicable',
      keywords     = 'robotframework testing testautomation sikuli sikulix',
      platforms    = 'any',
      classifiers  = [
                        "Development Status :: NA",
                        "License :: NA",
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
      packages     = ['FreelancerSikuliXRobotLibrary','FreelancerSikuliXRobotLibrary.keywords','FreelancerSikuliXRobotLibrary.locators',
                      'FreelancerSikuliXRobotLibrary.utils'],
      include_package_data = True,
      )
