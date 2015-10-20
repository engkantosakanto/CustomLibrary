from sikuli import *
from keywordgroup import KeywordGroup

class _OperatingSystemKeywords(KeywordGroup):
    def __init__(self):
        self.env_OS = Env.getOS()
        self.env_OS_version = Env.getOSVersion()

    def get_env_OS(self):
        OS = self.env_OS
        self._info("OS version is '%s'." % OS)
        return OS

    def get_env_OS_version(self):
        OS = self.env_OS_version
        self._info("OS is '%s'." % OS)
        return OS

    # Check if OS version is correct based on the argument argOS
    def confirm_env_OS(self, env_OS):
        assert env_OS is not None and len(env_OS) > 0
        env_OS = env_OS.lower()
        OS_confirm = ""
        if(env_OS == "windows"):
            OS_confirm = Settings.isWindows()
        elif (env_OS == "mac"):
            OS_confirm = Settings.isMac()
        elif (env_OS == "linux"):
            OS_confirm = Settings.isLinux()
        self._info("OS confirmation: '%s'." % OS_confirm)
        return OS_confirm
