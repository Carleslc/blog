---
layout: single
header:
    image: /assets/images/rot13.png
title: "Criptografía clásica con Python"
date: 2017-10-09 10:06:00
categories:
- seguridad informática
tags:
- criptografía
- informática
- cracking
- cesar
- escítala
- vigenère
---

_¿Quieres saber cómo cifraba Julio César sus mensajes? ¿Cómo la criptografía hizo que Estados Unidos se uniese a la Primera Guerra Mundial?_ Hoy hablaremos de eso y además te presentaré una herramienta desarrollada por mí en [_Python_](https://es.wikipedia.org/wiki/Python){: target="_blank"} sobre criptografía clásica.

Para empezar vamos a describir qué consideramos como **criptografía clásica**.

<img src="https://luissubiabre.files.wordpress.com/2014/03/copia_de_espartanos_2010_logo.jpg" align="left" width="140" height="140">Desde mucho antes de que existiera la comunicación digital, ya en tiempos espartanos el ejército necesitaba cifrar sus comunicados para que tan sólo fuesen legibles por aquellos a los que era destinado el mensaje.

Para ello se emplearon diferentes sistemas de cifrado, mediante diferentes **transformaciones** del mensaje original con operaciones lineales de **sustitución** y **transposición** de caracteres.

Estas transformaciones dependían de una **clave privada** que debía mantenerse en secreto para poder descifrar el texto. Aquellos que no tuvieran acceso a esta clave se encontrarían con un mensaje aparentemente sin sentido.

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Enigma_%28crittografia%29_-_Museo_scienza_e_tecnologia_Milano.jpg/220px-Enigma_%28crittografia%29_-_Museo_scienza_e_tecnologia_Milano.jpg" width="160" height="160" align="right" class="image">Más tarde, a comienzos del **siglo XX** el uso de la criptografía en las transmisiones cobra una gran importancia impulsada por los tiempos que corrían (I y II Guerra Mundial), originando un gran auge de técnicas y máquinas de cifrar (_Enigma, Hagelin, Purple..._).

En algunos casos, esto cambió la historia como la conocemos.

El 17 de Enero de 1917 _William Montgomery_, criptoanalista de la sección diplomática de la famosa Habitación 40 del Almirantazgo de la Marina Británica en Londres, interceptó un telegrama lleno de códigos que el Ministro de Relaciones Exteriores alemán _Arthur Zimmermann_ envió a su embajador en los Estados Unidos. Tras romper los códigos, descubrieron atónitos que entre otras cosas el mensaje anunciaba la guerra con los Estados Unidos. Con ello entraron en la confrontación mundial y ayudaron a los aliados a ganar la guerra.
{: .notice--warning }

En comparación, los sistemas de **criptografía moderna** hacen uso de _propiedades matemáticas_ como la **dificultad computacional** del [_cálculo del logaritmo discreto_](https://es.wikipedia.org/wiki/Logaritmo_discreto#C.C3.A1lculo){: target="_blank"} o el [_problema de la factorización_](https://es.wikipedia.org/wiki/Factorización_de_enteros#Dificultad_y_complejidad){: target="_blank"} de grandes números basados en la representación binaria de la información. Gracias a esto el algoritmo puede quedar expuesto públicamente sin comprometer la seguridad. Algunos sistemas incluso pueden compartir una _clave pública_, como es el caso del [**RSA**](https://es.wikipedia.org/wiki/RSA){: target="_blank"}.

![Criptografía Moderna](https://4.bp.blogspot.com/-yiO9elB_Y6w/WDvx8uG-_qI/AAAAAAAAkn8/_dt8JlE4PCspBKpO_0b55QhXj6HAlapcgCLcB/s1600/seguridad-criptografia-internet-cifrado.jpg){: .center }

Otros algoritmos modernos basados en _clave secreta_ como el [**DES**](https://es.wikipedia.org/wiki/Data_Encryption_Standard){: target="_blank"} (ya en desuso) o el actualmente utilizado [**AES**](https://es.wikipedia.org/wiki/Advanced_Encryption_Standard){: target="_blank"} hacen uso de conceptos clásicos como los explicados anteriormente, pero su funcionamiento es público.

Por tanto, podemos afirmar que la **criptografía clásica** abarca los sistemas criptográficos desde el **siglo V a.C.** hasta la mitad del **siglo XX**.

La herramienta que te presento permite **cifrar**, **descifrar** y **romper** con _fuerza bruta_ tres de estos sistemas:

## [**Cifrado César**](https://es.wikipedia.org/wiki/Cifrado_César){: target="_blank"}
Uno de los cifrados más simples y antiguos, basado en la sustitución de cada uno de los carácteres por aquella letra que se encuentra un número fijo de posiciones en el alfabeto. Este número es la clave de este cifrado. _Julio César_, quien da nombre a este sistema, utilizaba una clave con un desplazamiento de 3 posiciones. 

![ROT3](https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Caesar3.svg/490px-Caesar3.svg.png){: .center }

Realizar esto en [_Python_](https://es.wikipedia.org/wiki/Python){: target="_blank"} es bastante sencillo:

```python
MODULE = len(string.ascii_lowercase) # 26 para el alfabeto ASCII inglés

def shift_by(char, shift):
    if char.isalpha():
        aux = ord(char) + shift
        z = 'z' if char.islower() else 'Z'
        if aux > ord(z):
            aux -= MODULE
        char = chr(aux)
    return char

def caesar(text, key):
    return ''.join(map(lambda char: shift_by(char, key), text))
```

## [**Cifrado con Escítala**](https://es.wikipedia.org/wiki/Esc%C3%ADtala){: target="_blank"}

El cifrado utilizado por el _ejército espartano_ consistía en escribir el mensaje en una tira de cuero o papiro enrollada en una vara con un grosor determinado. Esta vara toma el nombre de Escítala y era necesaria una copia exacta para poder descifrar el mensaje enrollando de nuevo la tira en ella.

<img src="https://upload.wikimedia.org/wikipedia/commons/5/51/Skytale.png" class="center" width="320" height="320">

La escítala se puede representar como una matriz de caracteres donde el grosor o clave es el número de filas. El mensaje cifrado será la matriz leída por columnas.

Así se cifraría en [_Python_](https://es.wikipedia.org/wiki/Python){: target="_blank"}, utilizando la librería [_NumPy_](http://www.numpy.org){: target="_blank"}:

```python
import numpy as np
import math

def scytale(text, key):
    rows = key
    cols = math.ceil(size/rows)
    m = np.array(list(text.ljust(rows*cols, ' '))).reshape((rows, cols))
    return ''.join([''.join(row) for row in m.transpose()]).strip()
```

## [**Cifrado de Vigenère**](https://en.wikipedia.org/wiki/Vigenère_cipher){: target="_blank"}

Este cifrado utiliza múltiples cifrados césar entrecruzados, de forma que es un cifrado de [sustitución polialfabética](https://es.wikipedia.org/wiki/Cifrado_por_sustitución#Polialfab.C3.A9tico){: target="_blank"}.

La clave del cifrado es una palabra que se corresponde con una secuencia de desplazamientos césar de forma que un desplazamiento nulo se traduce en una `A`, un desplazamiento de 2 se traduce en una `B` y así sucesivamente hasta la `Z`, que corresponde a un desplazamiento de 25 en caso del alfabeto inglés y a 26 en caso del alfabeto español.

Esta palabra clave se repite hasta que cada palabra del mensaje a cifrar tenga una letra de la clave asociada. Después se realiza el cifrado césar para cada letra del mensaje con el desplazamiento correspondiente a la letra clave asociada.

Para cifrar manualmente nos podemos ayudar de la tabla de Vigenère, también conocida como [tabula recta](https://en.wikipedia.org/wiki/Tabula_recta){: target="_blank"}, de forma que tomando la fila con la letra de la clave para cifrar podemos buscar la letra correspondiente en la columna de la letra del mensaje.

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Vigenère_square_shading.svg/640px-Vigenère_square_shading.svg.png" class="center" width="320" height="320">

Este sería el cifrado en [_Python_](https://es.wikipedia.org/wiki/Python){: target="_blank"}, utilizando el método `shift_by` del cifrado César:

```python
def vigenere(text, key, decrypt=false):
    shifts = [ord(k) - ord('a') for k in key.lower()]
    i = 0
    def do_shift(char):
        nonlocal i
        if char.isalpha():
            shift = shifts[i] if not decrypt else MODULE - shifts[i]
            i = (i + 1) % len(key)
            return shift_by(char, shift)
        return char
    return ''.join(map(do_shift, text))
```
<p></p>
Para instalar y jugar con estos sistemas de cifra clásica tan sólo tienes que seguir las instrucciones del repositorio de _GitHub_:

[<span class="fa fa fa-fw fa-github"/> CryptTools](https://github.com/Carleslc/CryptTools){: .btn .btn--info .center target="_blank"}

También puedes mirar cómo se implementa el criptoanálisis para romper cada uno de estos sistemas, e incluso puedes colaborar a mejorar este proyecto 😉.

_Hay que tener en cuenta que los sistemas de cifrado clásico **no son seguros** para las comunicaciones digitales (esta herramienta y muchas otras permiten romperlos en cuestión de segundos), por lo que su uso debe restringirse al didáctico y personal.<br/>
Para cifrar mensajes telemáticos se utilizan otros sistemas criptográficos modernos como [**AES**](https://es.wikipedia.org/wiki/Advanced_Encryption_Standard){: target="_blank"}, [**RSA**](https://es.wikipedia.org/wiki/RSA){: target="_blank"} o [**BCrypt**](https://en.wikipedia.org/wiki/BCrypt){: target="_blank"}._
{: .notice--danger }

Espero que disfrutes con esta herramienta y nos vemos en el próximo post.