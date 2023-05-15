from selenium import webdriver
import time

print(" Test case started")
options = webdriver.ChromeOptions()
options.add_experimental_option('excludeSwitches', ['enable-logging'])
driver = webdriver.Chrome("C:/Users/georg/Downloads/chromedriver_win32/chromedriver.exe", options=options)
driver.maximize_window()
driver.get("http://localhost/organic/login.php")
driver.find_element("id", "mail").send_keys("tiny@gmail.com")
time.sleep(2)
driver.find_element("id", "password").send_keys("Tiny@123")
time.sleep(2)
driver.find_element("xpath", "/html/body/div[2]/div[1]/div[1]/form/input").click()
time.sleep(2)
print("User Logged In")

driver.find_element("xpath", "/html/body/div[2]/div[2]/div[1]/ul/li/a").click()
time.sleep(2)

driver.find_element("xpath", "/html/body/div[2]/div[2]/div[1]/ul/li/ul/li[1]/a").click()
time.sleep(2)
print("Profile viewed successfully")