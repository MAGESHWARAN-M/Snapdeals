library(rvest)
library(dplyr)
library(robotstxt)
library(stringr)

url<-"https://www.snapdeal.com/products/appliances-mixer-grinders?sort=plrty#bcrumbLabelId:243"
path = paths_allowed(url)

web = read_html(url)
View(web)

productname <- web %>% html_nodes(".product-title") %>% html_text()
View(productname)

originalprice <- web %>% html_nodes(".strike") %>% html_text()
View(originalprice)

offerprice <- web %>% html_nodes(".product-price") %>% html_text()
View(offerprice)

discount <- web %>% html_nodes(".product-discount span") %>% html_text()
View(discount)

# CREATING DATA FRAME
mixer_grinder=data.frame(productname,originalprice,offerprice,discount)
View(mixer_grinder)

# CONVITING INTO CSV FILE
write.csv(mixer_grinder,"mixer and grinder under 5000")

# SAVING INTO FILE MANAGER
a=read.csv("mixer and grinder under 5000")
View(a)
