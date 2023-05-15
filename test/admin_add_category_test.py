from selenium import webdriver
import time


print(" Test case started")
options = webdriver.ChromeOptions()
options.add_experimental_option('excludeSwitches', ['enable-logging'])
driver = webdriver.Chrome("C:/Users/georg/Downloads/chromedriver_win32/chromedriver.exe", options=options)
driver.maximize_window()
driver.get("http://localhost/organic/login.php")
driver.find_element("id", "mail").send_keys("admin@gmail.com")
time.sleep(2)
driver.find_element("id", "password").send_keys("Admin00#")
time.sleep(2)
driver.find_element("xpath", "/html/body/div[2]/div[1]/div[1]/form/input").click()
time.sleep(1)
alert = driver.switch_to.alert
alert.accept()
print("Admin Logged In")

driver.find_element("xpath", "/html/body/div[2]/div[2]/div[1]/ul/li[3]/ul/li/a").click()
time.sleep(2)
driver.find_element("id", "prod_category_name").send_keys("Vegitables")
time.sleep(2)
driver.find_element("xpath", "/html/body/div[2]/div[1]/div[1]/table[1]/tbody/tr[2]/td/center/input").click()
time.sleep(2)
print("Category added successfully")