
####################
## Pratique 1  ##
##"COUSP formations pratique en R" ##
#################### 

####################
## Conseils utiles ##

# Dans R, nous utilisons le dièse (#) pour marquer les commentaires. Il s'agit d'un texte qui peut être écrit, mais qui n'est pas interprété par R,
# mais qui n'est pas interprété par R. Nous l'utilisons pour laisser des remarques et des instructions comme celle-ci
# un.

# Vous pouvez préparer du code dans un fichier (comme celui-ci) et l'exécuter ligne par ligne en appuyant sur CTRL+RETOUR.
# en appuyant sur CTRL+RETURN (ou ENTER). Vous pouvez également sélectionner plusieurs lignes pour les
# plusieurs lignes pour les exécuter toutes en même temps. De plus, vous pouvez écrire du code directement sur la console.

# Vous pouvez vérifier votre répertoire de travail actuel avec getwd()
getwd()

# Si vous voulez le changer, vous pouvez le faire dans le panneau inférieur droit - Fichiers -, en
# en naviguant jusqu'au répertoire souhaité et en cliquant sur la roue dentée, puis en
# en sélectionnant « Set as working directory » (Définir comme répertoire de travail). Alternativement, si vous savez où se trouve le répertoire sur lequel vous voulez travailler, vous pouvez cliquer sur « Set as working directory ».
# répertoire sur lequel vous voulez travailler, vous pouvez aussi utiliser setwd()
setwd('./') # Assurez-vous de remplacer ./ par le répertoire dans lequel vous voulez être !

# Vous pouvez vérifier la date du jour en utilisant Sys.Date(). Si vous voulez aussi vérifier l'heure, vous pouvez utiliser Sys.Date(). 
# l'heure, vous pouvez utiliser Sys.time()
Sys.Date()
Sys.time()

# Vous pouvez utiliser ? pour consulter les fichiers d'aide d'une fonction spécifique (?mean). 
?mean

# Rappelez-vous que dans RStudio vous pouvez utiliser l'aide intégrée et l'autocomplétion.
# Lorsque vous commencez à taper une fonction, une fenêtre s'affiche avec les paramètres que la fonction accepte.
# accepte. Vous pouvez également utiliser "tab" pour autocompléter quelque chose que vous avez commencé à # écrire (par ex.
# (par exemple, si vous commencez à taper « Sys.ti » et que vous appuyez sur la touche de tabulation, il va 
# l'autocompléter pour vous et écrire Sys.time()).

# Exercises ----------------------------------------------------------------

#Charger le package

install.packages("pacman")

library(pacman)

pacman::p_load(dplyr)

#1. Ajouter un autre package pour lire le fichier excel. Il s'appelle readxl.

pacman::p_load(dplyr) #ajouter ici l'autre package

#2. Charger les données

#Assurez-vous que vous avez creer un .Rproj avec un fichier qui s'appele "data". 
#Aprés vous placer les données "liste_lineaire_fausse_version1" dans le fichier "data"

chemin <- "data/liste_lineaire_fausse_version1.xlsx" #directoire ou se trouve votre fiche d'excel
sheet <- 1 # la page que vous voulez ajouter
  
liste_lineaire <- readxl::read_excel(chemin, sheet) 

#Voyez-vous vos données de la liste lineaire dans votre environment

# Explorer la structure de donnés -----------------------------------------

#Avoir un apercu de données

#Voir les premiéres lignes
head(liste_lineaire, 5)

#Voir un apercu de données
summary(liste_lineaire)
str(liste_lineaire)

#3.1. Quelle est la date de notification de la 8ieme personne dans la liste linéaire ? Comment devez-vous adapter le code? Utilisez la function head()

#3.2. Quel est le nombre d'observations dans l'ensemble de données ? Utilisez la function summary() ou str()

#3.3. Quelle est la classe de la variable DateDeces ? Utilisez str()

#3.4. Quelles sont les variables qui ont NA dans les premières 10 lignes ? Vous devez utiliser la function head()


#### Informations supplementaires 
# Quelles sont les classes de colonnes possibles ?
#   Les classes de colonnes les plus courantes sont les suivantes
# Numeric - > Numérique 
# « Integer » (nombres entiers uniquement)
# Character -> "Caractère
# Factor 
# Logical -> "Logique (TRUE ou FALSE)
# Date 
# Une des premières étapes du processus de nettoyage des données consiste à 
# s'assurer que R comprend la class de variable

#Pour voir la class d' une variable vous pouvez utiliser:
class(liste_lineaire$Province)

#Attention!: On utilise le $ pour specifier une variable dans un ensemble de données.

#3.5. Trouvez-vous quelques variables qui n'ont pas la correcte class? Donnez un exemple. Utilisez str() pour voir tous variables.

# Exploration avec table --------------------------------------------------

#Vous pouvez voir un apercu d'un variable avec table et aussi faire la cross-tabulation
#Excemple

table(liste_lineaire$Sexe)
table(liste_lineaire$Sexe, liste_lineaire$ClassificationCas)

#4.1. Combien de hommes sont dans la liste linéaire? Utilisez la function table

#4.2. Combien de femmes sont parmis les cas probables? Utilisez la function table

#À vous: Utiliser la function table pour repondre aux questions suivants:

#Petit aide: Vous pouvez utiliser le function names() pour voir tous les noms de tous variables:
names(liste_lineaire)

#4.1. Quelle est la province avec le plus cas? Utilisez le function table avec la variable "Province". 
#Attention y compris tous les cas aussi non-cas et aussi cas d'autres années.


#4.2. Combien de personnes ont été hospitalisé  à Nord Kivu? Utilisez une cross-tabulation avec table  et le variable "Province" et "Hospitalisation" 



#4.3. Combien de decés on trouve parmi les cas confirmés? Utilisez la function table avec les variables "ClassificationCas" et "StatusCas"


#4.4. Pour quelle classe de variables le tableau n'est-il pas très utile ? Explorer les differents variables avec la function table et donnez un exemple.

