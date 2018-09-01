---
layout: single
header:
    image: "https://didevo.files.wordpress.com/2016/10/cropped-charlesdarwin.jpg"
title: "La teoría de la evolución en informática"
date: 2017-11-11 18:17:33
categories: 
- inteligencia artificial
tags: 
- aprendizaje automático
- computación
- algoritmos genéticos
- informática
---

Hoy voy a plantearte la siguiente pregunta: _¿puede un algoritmo mejorarse a sí mismo?_

Bueno, es una pregunta realmente difícil de responder. Ya vimos el concepto de **redes neuronales** en el post de [_Cómo aprenden las máquinas_]({% post_url 2017-10-05-como-aprenden-las-maquinas %}), las cuales son excelentes para reconocer patrones y son capaces de entrenarse a sí mismas para dar mejores resultados.
<img src="https://pilarmass.files.wordpress.com/2013/04/ia1.png" align="right">
En este caso vamos a conocer otro tipo de sistemas que se utilizan para solucionar problemas que tienen muchas posibles soluciones pero no todas son igual de buenas. Hablamos de los **algoritmos genéticos** los cuales son muy utilizados para resolver problemas de _optimización_.

Estos algoritmos no son especialmente nuevos, pues llevan desde los años 70 siendo objeto de discusión, pero son particularmente interesantes, pues se basan en el concepto de la [_evolución biológica_](https://es.wikipedia.org/wiki/Evolución_biológica){: target="_blank"} comunmente conocida como _selección natural_.

Seguro que [Charles Darwin](https://es.wikipedia.org/wiki/Charles_Darwin){: target="_blank"} estaría orgulloso de estos algoritmos.

### --- Bien, entonces... ¿estos algoritmos pueden mejorarse a sí mismos?
{: .notice}

Más o menos. No es el algoritmo en sí el que se cambia, pero sí que permite mejorar la solución proporcionada conforme avanza el tiempo.

<img src="http://3.bp.blogspot.com/-q0a56sVHX34/VG1bceeEKEI/AAAAAAABPX0/EfrD0KQN53Q/s1600/Que%20es%20evolucion_Darwin_Nature.jpg" align="left" width="210" height="210" class="image">

En la naturaleza y según el mecanismo de la selección natural los seres vivos se adaptan al entorno gracias a las características heredadas de sus progenitores, y dentro de los individuos de una especie en una generación determinada las probabilidades de supervivencia son proporcionales al rendimiento de esas características.

El funcionamiento de estos algoritmos pretende simular ese comportamiento. Enfrentaremos a nuestro algoritmo genético a un escenario para el que no ha sido preparado. Buscaremos entonces el mejor **individuo** (como analogía de la mejor solución) que sepa desenvolverse eficazmente en este escenario. Para esto partiremos de una _selección aleatoria_ de individuos, los pondremos a prueba en este escenario y una vez obtengamos los resultados seleccionaremos un conjunto de ellos, donde los que han mostrado mejores resultados tienen más probabilidades de ser elegidos. Combinaremos los individuos seleccionados mediante las técnicas de [**cruce**](https://es.wikipedia.org/wiki/Recombinación_(computación_evolutiva)){: target="_blank"} y [**mutación**](https://es.wikipedia.org/wiki/Mutación_(computación_evolutiva)){: target="_blank"}, dando lugar a una nueva generación de individuos, los cuales pueden ser potencialmente mejores a la anterior generación. Repetiremos este proceso tantas veces como necesitemos.

Para poder realizar esto necesitaremos lo siguiente:

- Un **_cromosoma_**: La representación de cada individuo en forma de cadena, donde cada símbolo de esta cadena se llama _gen_. Si la cadena es de dígitos binarios lo llamaremos _genotipo_.
- Una **_función de fitness_**: Cómo evaluar el rendimiento de una solución.
- Los **_operadores genéticos_**: Cómo realizar la selección, el cruce y la mutación de los individuos.

![](https://www.renovablesverdes.com/wp-content/uploads/2017/03/mariposas.png)

Nótese que, dada la naturaleza probabilística de estos algoritmos, habrá individuos que se repitan y otros que no aparezcan. Así pues, no tendremos asegurada la solución más óptima para un problema, pero sí que obtendremos una solución _bastante buena_ en un momento determinado. Las mejoras que nos proporciona cada generación siguen un _incremento logarítmico_, de forma que llegaremos a un punto en el que necesitaremos muchas iteraciones para lograr una pequeña mejora de la solución. El coste de este proceso dependerá en su mayoría del tiempo que se tarde en probar y evaluar cada solución.

Posiblemente estés un poco confuso con todo esto, así que lo mejor para asimilarlo es mediante un ejemplo. El ejemplo que he seleccionado es un simulador donde buscaremos encontrar la criatura que se mueva más rápido y por tanto logre una mayor distancia en un tiempo determinado. Te dejo las 4 partes aquí (están en inglés):

### Parte 1
<iframe width="640" height="390" src="https://www.youtube-nocookie.com/embed/GOFws_hhZs8" frameborder="0" allowfullscreen></iframe>

### Parte 2
<iframe width="640" height="390" src="https://www.youtube-nocookie.com/embed/31dsH2Fs1IQ" frameborder="0" allowfullscreen></iframe>

### Parte 3
<iframe width="640" height="390" src="https://www.youtube-nocookie.com/embed/IVcvvqxtNwE" frameborder="0" allowfullscreen></iframe>

### Parte 4
<iframe width="640" height="390" src="https://www.youtube-nocookie.com/embed/KrTbJUJsDSw" frameborder="0" allowfullscreen></iframe>

Puedes probarlo tú mismo aquí:

[ACTUALLY Improved Evolution Simulator](https://www.openprocessing.org/sketch/377698){: .btn .btn--info .center target="_blank"}

Tienes el código escrito en [Processing](https://www.processing.org){: target="_blank"} disponible en la misma página.

Además, por si te parece poco, estos algoritmos pueden combinarse con las redes neuronales, permitiendo enfrentar el mismo algoritmo genético a escenarios diferentes y obtener mejores resultados a la hora de mejorar los pesos de una red neuronal. Podemos ver esto en un ejemplo, utilizando un algoritmo genético y una red neuronal para hacer que un ordenador aprenda a jugar al mítico dinosaurio de Chrome cuando no hay conexión a Internet. En este caso el escenario es diferente porque en cada ejecución de este juego la distribución del nivel es diferente. También nos ofrece una sencilla explicación sobre redes neuronales y algoritmos genéticos, no tiene desperdicio:

<iframe width="640" height="390" src="https://www.youtube-nocookie.com/embed/P7XHzqZjXQs" frameborder="0" allowfullscreen></iframe>

Está en portugués, pero para lo que no se entienda tiene subtítulos en inglés.

Por supuesto, también tienes el código disponible [aquí <span class="fa fa fa-fw fa-github"/>](https://github.com/ivanseidel/IAMDinosaur){: target="_blank"}.

Fascinante, ¿verdad?