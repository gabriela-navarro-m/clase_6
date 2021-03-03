rm(list = ls())
pacman:: p_load(tidyverse, viridis, forcats, gapminder)

#importar
geih = readRDS("data/original/geih nacional.rds")
colnames(geih)
#p6040 es edad
#edad promedio para cada departamento pero no media ponderada
geih %>% group_by(dpto) %>% summarise (total=mean(p6040))

#p6500 es ingreso
#ingreso promedio por departamento
ing= geih %>% group_by(dpto) %>%
  summarise(mean = mean(p6500, na.rm = T) ,mean_w = weighted.mean(x = p6500,w = fex_c_2011, na.rm = T))
rm(ing_w)
#histograma con media y media ponderada
ggplot() + geom_histogram(data=ing, aes(x=mean), color= "red", fill="red", alpha=0.3) + geom_histogram(data=ing, aes(x=mean_w), color="blue", fill="blue", alpha=0.3)+ theme_bw()
#lo mismo pero con densidad
ggplot() + geom_density(data=ing, aes(x=mean), color= "red", fill="red", alpha=0.3) + geom_density(data=ing, aes(x=mean_w), color="blue", fill="blue", alpha=0.3)+ theme_bw()
