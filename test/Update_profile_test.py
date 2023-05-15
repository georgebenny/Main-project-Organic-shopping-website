from selenium import webdriver
import time

print("Login test case started")
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

firstname_field = driver.find_element("id", "firstname")
firstname_field.clear()
firstname_field.send_keys("Rocky")
time.sleep(2)
firstname_field = driver.find_element("id", "lastname")
firstname_field.clear()
firstname_field.send_keys("Bhai")
time.sleep(2)

phone_field = driver.find_element("id","phonem")
phone_field.clear()
phone_field.send_keys("987676569")
time.sleep(2)

driver.find_element("xpath", "/html/body/div[2]/div[1]/div[2]/form/input[4]").click()
time.sleep(2)
print("Profile updated successfully")
