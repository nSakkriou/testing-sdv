from selenium import webdriver
from selenium.webdriver.chrome.service import Service


def allow_geoloca():
    driver = webdriver.Firefox()
    Map_coordinates = dict({
        "latitude": 41.8781,
        "longitude": -87.6298,
        "accuracy": 100
        })
    driver.execute_cdp_cmd("Emulation.setGeolocationOverride", Map_coordinates)