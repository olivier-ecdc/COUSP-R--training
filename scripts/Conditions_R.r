####################
## Conditionnels   ##
#################### 

# En R, les conditionnels sont des tests logiques qui comparent des valeurs ou des propriétés d'un
# objet. Ils sont représentés par les mots-clés if et else, et ils peuvent être 
# combinés. Voyons quelques exemples.
a <- 8
if(a > 9){ # Ceci ne s'exécutera pas, car a n'est pas supérieur à 9
  "a est supérieur à 9"
}
a <- 10
if(a > 9){ # Après avoir réassigné a, maintenant il satisfait la condition et s'exécutera
  "a est supérieur à 9"
}

# Si nous ajoutons un else, nous créerons une voie alternative lorsque la première 
# condition n'est pas remplie.
a <- 8
if(a > 9){
  "a est supérieur à 9"
} else {
  "a est inférieur à 9"
}

# Nous pouvons combiner if et else pour créer de nombreuses possibilités différentes.
a <- 5
if(a < 4){
  "a est inférieur à 4"
} else if(a > 7){
  "a est supérieur à 7"
} else if(a == 5){
  "a est exactement 5"
} else{
  "a n'est ni inférieur à 4, ni supérieur à 7, ni égal à 5 - il doit être 6"
}

a <- 6
if(a < 4){
  "a est inférieur à 4"
} else if(a > 7){
  "a est supérieur à 7"
} else if(a == 5){
  "a est exactement 5"
} else{
  "a n'est ni inférieur à 4, ni supérieur à 7, ni égal à 5 - il doit être 6"
}

# Notez que pour les comparaisons, nous avons utilisé >, < et ==. La raison pour laquelle nous devons 
# répéter le signe égal est que sinon nous ferions une assignation,
# pas une comparaison d'égalité. De plus, si nous mélangeons > et < avec =, nous obtenons les
# opérateurs "supérieur ou égal à" (>=) et "inférieur ou égal à" (<=).

# Comment faire plusieurs conditionnels en même temps ? Nous pouvons utiliser les opérateurs logiques
# & et | - ils correspondent aux fonctions logiques ET et OU.
age_patient <- 35
if(age_patient < 16 | age_patient > 65){
  "Probablement pas en train de travailler"
} else {
  "En train de travailler"
}

# Il est très important de s'assurer que lorsque nous vérifions des intervalles, nous
# les incluons tous ! Dans l'exemple ci-dessous, si nous modifions la ligne 71 pour remplacer >=
# par >, nous laisserons de côté les cas égaux à 6 ans - et ils seront
# mal classés comme adultes.
if(age_patient < 2){
  "Bébé"
} else if(age_patient >= 2 & age_patient < 6){
  "Enfant"
} else if(age_patient >= 6 & age_patient < 12){
  "Écolier"
} else if(age_patient >= 12 & age_patient < 18){
  "Adolescent"
} else {
  "Adulte"
}
