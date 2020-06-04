import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import selenium
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from webdriver_manager.chrome import ChromeDriverManager
from termcolor import colored, cprint
from course import Course
from info import FirestoreInfo, description_list, printProgressBar, courses


# Firebase Initalization
cred = credentials.Certificate('lassondeapp-2ab373a4b9c0.json')
firebase_admin.initialize_app(cred)
db = firestore.client()

# Selenium initalization

driver = webdriver.Chrome(ChromeDriverManager().install())


def intialization():

    for course in courses:
        course_option = courses.get(course)['option']
        length = courses[course]['length']

        # On course Page go through all the courses using predefined length
        for i in range(2, length):

            # Go to course page
            getCoursePage(course_option)

            code = driver.find_element_by_xpath(
                "/html/body/table/tbody/tr[2]/td[2]/table/tbody/tr[2]/td/table/tbody/tr/td/table[2]/tbody/tr["+str(i)+"]/td[1]").text[3:12]
            credit = driver.find_element_by_xpath(
                "/html/body/table/tbody/tr[2]/td[2]/table/tbody/tr[2]/td/table/tbody/tr/td/table[2]/tbody/tr["+str(i)+"]/td[1]").text[13:]
            title = driver.find_element_by_xpath(
                "/html/body/table/tbody/tr[2]/td[2]/table/tbody/tr[2]/td/table/tbody/tr/td/table[2]/tbody/tr["+str(i)+"]/td[2]").text
            driver.find_element_by_xpath(
                "/html/body/table/tbody/tr[2]/td[2]/table/tbody/tr[2]/td/table/tbody/tr/td/table[2]/tbody/tr["+str(i)+"]/td[3]/a").click()
            description = driver.find_element_by_xpath(
                '/html/body/table/tbody/tr[2]/td[2]/table/tbody/tr[2]/td/table/tbody/tr/td/p[3]').text
            try:
                for element in description_list:
                    if (description.find(element) != -1):
                        # Slice unnesacry information
                        description = description[:description.find(element)]
                        break

                search = []
                tmp = ""
                for element in code:
                    tmp = tmp + element
                    search.append(tmp)

                # create a json object
                course_json = {
                    u'code': code,
                    u'title': title,
                    u'credit': credit,
                    u'description': description,
                    u'search': search
                }

                # insert course
                insertCourse(course_json, course)

                # just for asthetic
                printProgressBar(i, length-1)

            except:
                # printErrorMessage(course)
                # break
                pass

        printCompletionMessage(course)


def getCoursePage(option):
    driver.get("https://w2prod.sis.yorku.ca/Apps/WebObjects/cdm")
    driver.find_element_by_xpath(
        "/html/body/p/table/tbody/tr[2]/td[2]/table/tbody/tr[2]/td/table/tbody/tr/td/ul/li[1]/ul/li[1]/a").click()
    driver.find_element_by_xpath(
        "/html/body/table/tbody/tr[2]/td[2]/table/tbody/tr[2]/td/table/tbody/tr/td/form/table/tbody/tr[1]/td[2]/select/option[2]").click()
    driver.find_element_by_xpath(
        "/html/body/table/tbody/tr[2]/td[2]/table/tbody/tr[2]/td/table/tbody/tr/td/form/table/tbody/tr[2]/td[2]/select/option[" + option + "]").click()
    driver.find_element_by_xpath(
        "/html/body/table/tbody/tr[2]/td[2]/table/tbody/tr[2]/td/table/tbody/tr/td/form/table/tbody/tr[3]/td[2]/input").click()


# only during inatilization
def insertCourse(course, collection_name):
    db.collection(collection_name).add(course)


def printErrorMessage(course_name):
    cross = colored("X", color='red')
    print(cross + " Error while updating "+course_name)


def printCompletionMessage(course_name):
    checkmark = colored(u'\N{check mark}', color='green')
    print(checkmark + " " + course_name + " has updated successfully!")


intialization()
