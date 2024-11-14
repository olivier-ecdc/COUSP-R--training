

####################
## Pratique 2  ##
##"COUSP formations pratique en R" ##
#################### 

####################
## Conseils utiles ##

## Syntaxe de base en R
# Le langage R utilise une syntaxe simple pour exécuter des commandes.
x <- 10  # assigner une valeur à une variable
x # afficher la valeur de la variable ou de l object

y <- c(1, 2, 3, 4, 5)  # créer un vecteur
mean(y)  # calculer la moyenne des éléments du vecteur


# Dans R, nous utilisons le dièse (#) pour marquer les commentaires. Il s'agit d'un texte qui peut être écrit, mais qui n'est pas interprété par R,
# mais qui n'est pas interprété par R. Nous l'utilisons pour laisser des remarques et des instructions comme celle-ci
# un.

# Vous pouvez préparer du code dans un fichier (comme celui-ci) et l'exécuter ligne par ligne en appuyant sur CTRL+RETOUR.
# en appuyant sur CTRL+RETURN (ou ENTER). Vous pouvez également sélectionner plusieurs lignes pour les
# plusieurs lignes pour les exécuter toutes en même temps. De plus, vous pouvez écrire du code directement sur la console.

# Vous pouvez vérifier votre répertoire de travail actuel avec getwd()
getwd()

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


# Rappels de la sceance precedente: 

#Charger le package

#install.packages("pacman")

library(pacman)

pacman::p_load(dplyr,
               readxl,
               writexl)

#Charger les données

chemin <- "data/liste_lineaire_fausse_version1.xlsx" #directoire ou se trouve votre fiche d'excel
sheet <- 1 # la page que vous voulez ajouter
  
liste_lineaire <- readxl::read_excel(chemin, sheet) 

#Voyez-vous vos données de la liste lineaire dans votre environment

# Explorer la structure de donnés -----------------------------------------

#Avoir un apercu de données

head(liste_lineaire, 5)
summary(liste_lineaire)
str(liste_lineaire)

# Introduction à la manipulation de données avec dplyr -----------------------------------------

## Introduction aux fonctions principales de dplyr

# dplyr est un package puissant pour la manipulation de données. 
# Voici quelques-unes des fonctions les plus utilisées :

# 1. rename() : permet de renommer des colonnes
# 2. ifelse() : permet d'utisier un conditionnel
# 3. mutate() : permet de créer ou transformer des colonnes
# 4. select() : permet de sélectionner des colonnes spécifiques
# 5. filter() : permet de filtrer les lignes selon des conditions
# 6. distinct() : permet de supprimer les doublons

## Nettoyage de données avec le package dplyr

# Utilisation de l'opérateur de pipe (%>%)
# Le pipe permet de chaîner plusieurs fonctions ensemble pour rendre le code plus lisible et concis
liste_lineaire %>% 
  head(10) # afficher les 10 premières lignes du dataframe

head(liste_lineaire, 10)

#Comparez les resultats des deux operations.

#Vous pouvez aussi guarder le resultat dans un object.

liste_lineaire_premieres10 <- liste_lineaire %>% 
  head(10)

# Renommer les colonnes
# Voir les noms de tous variables:
liste_lineaire %>% 
  names()

# La fonction rename() permet de renommer une ou plusieurs colonnes du dataframe
liste_lineaire_nettoyee <- liste_lineaire %>% 
  rename(NomProvince = Province)

# Voir les noms de tous variables pour vérifier que vous avez renomer tous variable indiqués:
liste_lineaire_nettoyee %>% 
  names()

# Plus d'exemples de renommer les colonnes
liste_lineaire_nettoyee <- liste_lineaire %>% 
  rename(NomAS = AS, EtatCas = StatusCas, NomZS = ZS)

# Voir les noms de tous variables pour vérifier que vous avez renomer tous variable indiqués:
liste_lineaire_nettoyee %>% 
  names()

# À VOUS EXERCISE : Renomer le variable "ClassificatinCas" to "classification"


# Utilisation de la fonction ifelse

# La fonction ifelse est utilisée pour évaluer une condition et renvoyer une valeur différente selon que la condition est vraie ou fausse.
# La syntaxe de base est : ifelse(test, oui, non) en francais "si vrai, si non"
# où "test" est la condition à évaluer,
# "oui" est la valeur à renvoyer si la condition est vraie,
# "non" est la valeur à renvoyer si la condition est fausse.

# Exemple simple
# Créons un vecteur de valeurs numériques
age_exemple <- c(10, 5, 8, 12, 3)

# Utilisons ifelse pour évaluer quelles valeurs sont supérieures à 7
vec_classification <- ifelse(age_exemple > 7, "Grand", "Petit")

# Affichons les résultats
print(vec_classification)
# [1] "Grand" "Petit" "Grand" "Grand" "Petit"

#À VOUS EXERCISE: Reclassifier le vector pour classifier tous chiffres inferieure à 5 comme "Petit" et les autres comme "Grand"

# Utilisation de mutate pour créer ou transformer des colonnes
# La fonction mutate() permet de créer de nouvelles colonnes ou de transformer les colonnes existantes
# Nous allons utiliser ifelse pour créer une nouvelle colonne "AgeGroupe" qui classifie les âges en "Adulte" (>= 18) ou "Enfant" (< 18)

liste_lineaire_nettoyee1 <- liste_lineaire %>%
  mutate(AgeGroupe = ifelse(Age >= 18, "Adulte", "Enfant"))

table(liste_lineaire_nettoyee1$AgeGroupe)

# Excemple  mutate() 
liste_lineaire_nettoyee2 <- liste_lineaire %>% 
  mutate(IndividuMineur = ifelse(Age > 18, "Adulte", "Mineur"))
table(liste_lineaire_nettoyee2$IndividuMineur)

#Example mutate()
liste_lineaire_nettoyee3 <- liste_lineaire %>% 
  mutate(FievreEruptionsCutanees = ifelse(Fievre == "Oui" & EruptionsCutanees == "Oui", "Oui", "Non"))
table(liste_lineaire_nettoyee3$FievreEruptionsCutanees)

# Plus d'exemples avec mutate
liste_lineaire_nettoyee <- liste_lineaire %>% 
  mutate(IndividuMineur = ifelse(Age > 18, "Adulte", "Mineur"))

#À VOUS: Explorez la variable crée IndividuMineur avec la funtion table()


#À Vous: Ajoutez une nouvelle variable qui classifiez les cas avec Fievre ET avec EruptionsGenitales


# Sélectionner des colonnes spécifiques
# La fonction select() permet de sélectionner des colonnes spécifiques du dataframe
liste_lineaire %>% 
  names()

# Exemple de sélection avec d'autres critères
liste_lineaire_selectionee2  <- liste_lineaire %>% 
  select(Province, ZS, Sexe, Age, DateNotification)

#On peut aussi specifier un group de variable
liste_lineaire_selectionee1 <- liste_lineaire %>% 
  select(starts_with("Date"), ends_with("symptomes"), contains("Eruption"))

#À VOUS EXERCISE: Guardez un ensemble de donnés "liste_lineaire_selectionee3" avec les variables Sexe, Age, Province, et ZS et tous les dates



## Déduplication des données
# La fonction distinct() permet de supprimer les doublons dans le dataframe
liste_lineaire_deduplic <- liste_lineaire %>% 
  distinct()

#À VOUS: Est-ce qu'il y a de doublons dans l'ensemble de données liste linéaire? Comparez les deux ensembles de données
str(liste_lineaire)
str(liste_lineaire_deduplic)

# Conversion de type avec as.character(), as.factor(), as.numeric(), as.Date()
# Ces fonctions permettent de convertir le type de données des colonnes du dataframe

#Verifier le type de variable avec class 
class(liste_lineaire$StatusCas)

liste_lineaire_nettoyee <- liste_lineaire %>% 
  mutate(StatusCas = as.factor(StatusCas))

#Verifier le type de variable avec class 
class(liste_lineaire_nettoyee$StatusCas)

#Autres Exemple avec une combination dans mutate():
liste_lineaire_nettoyee <- liste_lineaire %>% 
  mutate(Sexe = as.factor(Sexe),
         Age = as.numeric(Age),
         AdultJeune = ifelse(Age > 30, "Adulte", "Jeune"))

#À VOUS EXERCISE: Reclassifier la variable Hospitalisation ("Oui" ou "Non") comme variable factor?
liste_lineaire_nettoyee <- liste_lineaire %>%  # continuer ici


# FAIRE UN NETTOYAGE COMPLET AVEC LES FUNCTIONS QUE VOUS AVEZ APPRIS  

#Ces sont les variables a votre deposition:
# 1. rename() : permet de renommer des colonnes
# 2. ifelse() : permet d'utisier un conditionnel
# 3. mutate() : permet de créer ou transformer des colonnes
# 4. select() : permet de sélectionner des colonnes spécifiques
# 5. filter() : permet de filtrer les lignes selon des conditions
# 6. distinct() : permet de supprimer les doublons

#On veut faire un petit nettoyage pour pouvoir creer un tableau qui montre les personnes sans et avec cicatrice vaccine variole et les hospitalisation par province et ZS avec un date de notificaton dans 2024
#Exemple: 
table(liste_lineaire$CicatriceVaccinVariole) #Pour nettoyer on doit toujours

liste_lineaire_hosp_variole <- liste_lineaire %>% 
  rename(Dechargemode = ModeDecharge, DPS = Province) %>% #renomer quelques variables
  mutate(VaccinVariole = ifelse(CicatriceVaccinVariole == "Non" | CicatriceVaccinVariole == "Cas suspect refuse de montrer", 0, 1),
         Hospitalisation = ifelse(Hospitalisation == "Oui", 1, 0)) %>%  # bon pratique d'avoir "Oui/ Non" comme 1 et 0 pour pouvoir faire l'addition
  select(DPS, ZS, DateNotification, VaccinVariole, Hospitalisation) %>% 
  filter(DateNotification >= 2024) 

#Maintenant on peut exporter la base de données un excel
#x va specifier que vous voulez guarder et avec path vous pouvez donner le chemin et le nom au fichier excel
writexl::write_xlsx(x = liste_lineaire_hosp_variole, path = "basededonnées_nettoyee_hosp_variole.xlsx")

#À VOUS EXERCISE: Vous voulez guarder un ensemble de données avec :
# les variables Province, ZS, ClassificationCas, DateNotification, DatePrelevement et DateSymptomes 
# avec une nouvelle variables cas confirme qui est 1 si le ClassificationCas == "Cas Confirmé" et 0 si non
# pour tous les données de 2024
# seulement pour la Province de Kinshasa 


