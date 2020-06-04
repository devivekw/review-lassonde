from enum import Enum
from termcolor import colored, cprint


class FirestoreInfo(Enum):
    COLLECTION = u'courses-collection'
    DOCUMENT = u'courses-doc'


description_list = ["Prerequisites:", "Prerequisite:",
                    "Course credit exclusions:", "Prerequisite;"]

courses = {
    u'EECS': {
        'option': '60',
        'length': 97
        # First Course - EECS 1001 (2)
        # Second Course - EECS 4700 (95)
    },
    u'MECH': {
        'option': '136',
        'length': 26
        # First Course - MECH 2112 (2)
        # Second Course - MECH 4512 (25)
    },
    u'CIVIL': {
        'option': '26',
        'length': 36
        # First Course - CIVIL 2000 (2)
        # Second Course - CIVIL 4210 (35)
    },
    u'ENG': {
        'option': '64',
        'length': 14
        # First Course - ENG 1101 (2)
        # Second Course - ENG 4650 (13)
    },
    u'ESSE': {
        'option': '71',
        'length': 51
        # First Course - ESSE 1010 (2)
        # Second Course - ESSE 4690 (50)
    },
    u'MATH': {
        'option': '133',
        'length': 105
        # First Course - MATH 1013 (2)
        # Second Course - MATH 4939 (104)
    },
    u'PHYS': {
        'option': '159',
        'length': 57
        # First Course - PHYS 1010 (2)
        # Second Course - PHYS 4350 (56)
    }
}


def printProgressBar(iteration, total, prefix='', suffix='', decimals=1, length=100, fill='█', printEnd="\r"):
    """
    Call in a loop to create terminal progress bar
    @params:
        iteration   - Required  : current iteration (Int)
        total       - Required  : total iterations (Int)
        prefix      - Optional  : prefix string (Str)
        suffix      - Optional  : suffix string (Str)
        decimals    - Optional  : positive number of decimals in percent complete (Int)
        length      - Optional  : character length of bar (Int)
        fill        - Optional  : bar fill character (Str)
        printEnd    - Optional  : end character (e.g. "\r", "\r\n") (Str)
    """
    percent = ("{0:." + str(decimals) + "f}").format(100 *
                                                     (iteration / float(total)))
    filledLength = int(length * iteration // total)
    bar = fill * filledLength + '-' * (length - filledLength)
    print('\r%s |%s| %s%% %s' % (prefix, bar, percent, suffix), end=printEnd)
    # Print New Line on Complete
    if iteration == total:
        print()
