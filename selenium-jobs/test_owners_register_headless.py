from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from time import sleep
import random
import os
# Set chrome options for working with headless mode (no screen)
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument("headless")
chrome_options.add_argument("no-sandbox")
chrome_options.add_argument("disable-dev-shm-usage")

# Update webdriver instance of chrome-driver with adding chrome options
driver = webdriver.Chrome(options=chrome_options)

# Connect to the application
APP_IP = os.environ['MASTER_PUBLIC_IP']
url = "http://"+APP_IP.strip()+":8080/"

#url = "http://35.234.119.210:8080"
print(url)
driver.get(url)

owners_link = driver.find_element(By.LINK_TEXT, "REGISTER OWNER")
owners_link.click()
sleep(3)

# Register new Owner to Petclinic App
fn_field = driver.find_element(By.NAME, 'firstName')
fn = 'AdemU' + str(random.randint(0, 100))
fn_field.send_keys(fn)
sleep(2)
fn_field = driver.find_element(By.NAME, 'lastName')
fn_field.send_keys('Baby')
sleep(2)
fn_field = driver.find_element(By.NAME, 'address')
fn_field.send_keys('Ridge Corp. Street')
sleep(2)
fn_field = driver.find_element(By.NAME, 'city')
fn_field.send_keys('McLean')
sleep(2)
fn_field = driver.find_element(By.NAME, 'telephone')
fn_field.send_keys('905441001228')
sleep(2)
fn_field.send_keys(Keys.ENTER)

# Wait 10 seconds to get updated Owner List
sleep(10)
# Verify that new user is added to Owner List
if fn in driver.page_source:
    print(fn, 'is added and found in the Owners Table')
    print("Test Passed")
else:
    print(fn, 'is not found in the Owners Table')
    print("Test Failed")
driver.quit()