from sikuli import *
from keywordgroup import KeywordGroup

class _OperatingSystemKeywords(KeywordGroup):
    def __init__(self):
        self.env_OS = Env.getOS()
        self.env_OS_version = Env.getOSVersion()

    # Public

    def get_env_OS(self):
        self._info("OS version is '%s'." % self.env_OS)
        return self.env_OS

    def get_env_OS_version(self):
        self._info("OS is '%s'." % self.env_OS_version)
        return self.env_OS_version

    # Check if OS version is correct based on the argument env_OS
    def confirm_env_OS(self, env_OS):
        assert env_OS is not None and len(env_OS) > 0
        env_OS = env_OS.upper()
        if(env_OS == "WINDOWS"):
            OS_confirm = Settings.isWindows()
        elif (env_OS == "MAC"):
            OS_confirm = Settings.isMac()
        elif (env_OS == "LINUX"):
            OS_confirm = Settings.isLinux()
        self._info("OS confirmation: '%s'." % OS_confirm)
        return OS_confirm
