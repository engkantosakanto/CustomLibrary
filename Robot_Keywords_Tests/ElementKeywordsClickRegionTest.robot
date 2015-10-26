*** Settings ***
#Library            Remote    http://127.0.0.1:8270
Library            FreelancerSikuliXRobotLibrary
Default Tags       ElementKeywordsClickRegionTest


*** Test Cases ***
Click Region Test
    Switch Application Focus    Calculator
    Set New Search Region In Active App    10, 60, -20, -270
    Click Region
    Right Click Region
    Set New Search Region In Active App    10, 30, -20, -270
    Right Click Region
    Switch Application Focus    Freelancer Desktop App
    Double Click Region