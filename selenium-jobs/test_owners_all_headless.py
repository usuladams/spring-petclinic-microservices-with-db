from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from time import sleep
import os

# Set chrome options for working with headless mode (no screen)
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument("headless")
chrome_options.add_argument("no-sandbox")
chrome_options.add_argument("disable-dev-shm-usage")

# Update webdriver instance of chrome-driver with adding chrome options
driver = webdriver.Chrome(options=chrome_options)
# driver = webdriver.Chrome("/Users/home/Desktop/chromedriver")
# Connect to the application
APP_IP = os.environ['MASTER_PUBLIC_IP']
url = "http://"+APP_IP.strip()+":8080/"

#url = "http://35.234.119.210:8080"

print(url)
driver.get(url)
sleep(3)
owners_link = driver.find_element("link text", "FIND OWNERS")
owners_link.click()
sleep(3)

# Verify that table loaded
sleep(1)
verify_table = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.TAG_NAME, "table")))
sleep(3)
print("Table loaded")

driver.quit()