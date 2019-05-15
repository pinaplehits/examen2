#1
month <- c("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")
num_month <- c(1,2,3,4,5,6,7,8,9,10,11,12)
names(num_month) <- month
seasons <- c("Primavera", "Verano", "Otoño", "Invierno")
names(seasons) <- month[]

#2
sucesion <- (matrix(1:15, nrow = 5, byrow = TRUE))

#3
vector1 <- c("XXL", "XXL", "XXL", "XL", "L", "M", "M", "S", "S", "S")
print(summary(vector1))

#4
Cursos <- c("Innovación tecnológica", "Topicos","Español", "Programación", "Matemáticas" )
Marks <- c(7,7,7,,9)
Profesor <- c("Abraham","Alan","Rogelio","Pedro","Fer")
df <- data.frame(Cursos,Marks,Profesor)

#5
library(readr)
itu <- read_csv("data/ITU_WB.csv")
View(itu)

#6
install.packages("dplyr")
library(dplyr)
itu %>%
  filter(Economy == "Mexico") %>%
  group_by(year) %>%
  arrange(desc(`Internet value`))

#7
itu_by_year <- itu %>%
  group_by(year, `Income group`) %>%
  na.omit() %>%
  summarise(medianValue = median(`Internet value`))

#8
install.packages("ggplot2")
library(ggplot2)
ggplot(itu_by_year, aes(x = year, y = medianValue)) +
  geom_line()

#9
library(dplyr)
itu_latin <- itu %>%
  group_by(`Income group`) %>%
  filter(Region == "Latin America & Caribbean")

library(ggplot2)
ggplot(itu_latin, aes(x = `GDP (US$)`, y = `Internet value`, color = `Income group`)) +
  geom_point() +
  facet_wrap(~ Economy)

#10
itu_2017 <- itu %>%
  filter(year == 2017) %>%
  na.omit()

ggplot(itu_2017, aes(x = `GDP (US$)`, y = `Internet value`, color = `Income group`)) +
  geom_point() +
  scale_x_log10() +
  scale_y_log10()

