####################
## Fonctions      ##
#################### 

# Une fonction est un ensemble d'instructions qui a été sauvegardé pour réutilisation.
# R inclut de nombreuses fonctions par défaut, et d'autres peuvent être ajoutées en chargeant 
# des packages. Explorons quelques-unes des fonctions intégrées de R.

sum(c(1,3,5,7))

mean(c(1,3,5,7))

paste("Bonjour", "collègues !")

# Les fonctions peuvent accepter un ou plusieurs objets : ce sont ce qu'on appelle des arguments. Certains
# arguments sont optionnels, tandis que d'autres sont obligatoires. Nous pouvons toujours vérifier
# quels sont les arguments qu'une fonction accepte en utilisant l'opérateur d'aide ?.
?mean

# Vous pouvez également définir des fonctions en utilisant le mot-clé function et en l'assignant
# à un objet. Mais attention : dans une fonction, seul le dernier élément est 
# retourné, ce qui signifie que tout ce que vous faites avant ne sera pas disponible.
mafonction <- function(a, b){
  somme_ab <- a+b
  (a*b)/somme_ab
}

mafonction(3,4) # Retournera la valeur de l'opération
somme_ab # Provoquera une erreur

# Nous pouvons définir des valeurs par défaut pour les paramètres, au cas où nous voudrions définir un 
# moyen plus rapide d'utiliser la fonction de manière similaire. Imaginons que nous voulons écrire
# une fonction qui retourne toujours un nombre supérieur à l'entrée. Puisque nous 
# voulons simplement le nombre immédiatement supérieur, nous pouvons toujours ajouter un. Mais dans certains
# cas, nous pourrions vouloir que ce soit différent. Voyons comment faire :
augmenter_nombre <- function(x, i = 1){
  x+i
}
augmenter_nombre(x = 5) # Retournera 6
augmenter_nombre(x = 5, i = 2) # Retournera 7

# Dans de nombreux langages de programmation et de script, il est obligatoire d'expliciter la
# valeur de retour en utilisant la fonction return. En R, ce n'est pas obligatoire, mais  
# de nombreux auteurs le préfèrent pour le rendre évident. De plus, notez que return
# arrêtera le flux de la fonction et n'exécutera rien en dessous.
mafonction <- function(a, b){
  somme_ab <- a+b
  return((a*b)/somme_ab)
  55
}
mafonction(5,5) # Cela ne retournera pas 55
