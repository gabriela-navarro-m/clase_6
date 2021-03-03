#para codigos de graficos estan data to viz en google 
#help es poner ?funcion
#ggplot2: data para la base de datos | aes es caracteristicas de grafica | ya el resto son mas comunes
#ggplot() + tipo de grafica se quiere usar -- solo poner ggplot() no devuelve nada sino el lienzo
#se le puede meter titulos + ggtitle("Titulo")
rm(list=ls())
pacman:: p_load(tidyverse, viridis, forcats, gapminder)
#gapminder es para ver datos ya hechos
ggplot() + geom_histogram(data=gapminder, aes(x=gdpPercap))
#para cambiar las barras se puede pedir que se cambie en bins
ggplot() + geom_histogram(data=gapminder, aes(x=gdpPercap), bins=5)
#se le puede nombrar o pasarlo a un elemento que guarda la informacion y darle titulo
a=ggplot() + geom_histogram(data=gapminder, aes(x=gdpPercap))
a+ ggtitle("Histograma GDP")
#para añadirle más informacion
h_gdp= ggplot() + geom_histogram(data=gapminder, aes(x=gdpPercap)) + labs(title= "GDP percapita", caption= "Fuente: Gapminder", x= "GDP", y= "Frecuencia")
h_gdp

#se pueden modificar los atributos o colores 
h_gdp + theme_minimal()

#graficos por grupos y viene ya con colores para cada continente y alpha es transparencia 
ggplot() + geom_point(data=gapminder, aes(x=gdpPercap, y=lifeExp, colour=continent, alpha=0.5)) + theme_light()

#se puede combinar grupos
ggplot(data = gapminder %>% subset(year==2007), aes(x=gdpPercap,y=lifeExp,colour=continent)) + 
  geom_point(alpha=0.5) +
  geom_smooth(method=lm, se=F) + theme_light() 
#para exportarlo es 
ggsave(plot=h_gdp, file="results/GDP.jpeg")