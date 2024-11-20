####################
## Syntaxe de base R ##
####################

##########################
# opérateurs mathématiques 
# R utilise des opérateurs mathématiques tels que +, -, *, /, ^, et plus encore.
5+5
7^2
8-9
42/7

# Si vous enchaînez plusieurs opérateurs, l'ordre mathématique est respecté.
5+5*2
(5+5)*2

# Mais où vont toutes ces valeurs ? Une fois qu'une ligne est exécutée, le résultat est affiché
# mais il n'est stocké nulle part. Pour ce faire, nous devons utiliser un opérateur d'assignation
# (= ou <-). Pour récupérer la valeur, il suffit d'écrire le nom.
valeur_1 <- 5*5
valeur_2 <- 6^3
valeur_1

# Notez que si vous essayez de faire référence à une valeur avant qu'elle ne soit assignée, R
# renverra une erreur
valeur_3

# Lorsque nous assignons une valeur à un nom, nous créons un objet : une entité avec
# certaines propriétés et caractéristiques que l'interpréteur R peut récupérer. Ils
# peuvent également être utilisés pour effectuer des opérations de la même manière que les nombres
valeur_2-valeur_1

# Mais qu'en est-il du texte ? En R, le texte est délimité par des guillemets simples et doubles.
"Ceci est un texte !"
'Ceci est aussi un texte.'



##################################################
# copérateurs logiques 

# En R, nous pouvons comparer des valeurs en utilisant divers opérateurs de comparaison.
# Voici quelques exemples :

# Comparaison d'égalité
a <- 5
b <- 7
a == b  # Vérifie si a est égal à b (retourne FALSE)

# Comparaison de différence
a != b  # Vérifie si a est différent de b (retourne TRUE)

# Comparaison de supériorité
a > b  # Vérifie si a est supérieur à b (retourne FALSE)
a < b  # Vérifie si a est inférieur à b (retourne TRUE)

# Comparaison de supériorité ou égalité
a >= b  # Vérifie si a est supérieur ou égal à b (retourne FALSE)
a <= b  # Vérifie si a est inférieur ou égal à b (retourne TRUE)



# Il existe d'autres types de données en R, tels que les types logiques (True et False) ou
# les dates. De plus, similaire aux vecteurs mathématiques, plusieurs valeurs peuvent
# également être stockées dans un seul objet. En R, il existe deux types : les vecteurs et 
# les listes.
objet_logique <- FALSE
vecteur_objet <- c(1,2,3)
liste_simple <- list(1, 2, 3)
liste_complexe <- list(premiere_liste = list(1,2,3),
                       deuxieme_liste = list(4,5,6))

# Les vecteurs contenant des valeurs de caractères (texte) peuvent également être transformés en facteurs :
# valeurs textuelles avec des valeurs spécifiques et ordonnées. Ces informations sont utiles pour 
# les organiser lors des analyses ou lors de la création de graphiques.
mon_vecteur_caractere <- c('BSL', 'LOW', 'HI', 'VHI', 'LOW', 'BSL', 'BSL')
ordre_caractere <- c('LOW', 'BSL', 'HI', 'VHI')
noms_caractere <- c('Bas', 'Base', 'Haut', 'Très haut')
mon_vecteur_facteur <- factor(x = mon_vecteur_caractere, # Le vecteur contenant les valeurs
                              levels = ordre_caractere, # L'ordre des valeurs
                              labels = noms_caractere) # Les étiquettes des valeurs
mon_vecteur_facteur # Même ordre que mon_vecteur_caractere
sort(mon_vecteur_facteur) # Ordonné selon ordre_caractere
sort(mon_vecteur_caractere) # Ordonné selon l'ordre alphabétique



# Comparaison de vecteurs
vecteur_1 <- c(1, 2, 3)
vecteur_2 <- c(3, 2, 1)
vecteur_1 == vecteur_2  # Compare chaque élément des vecteurs (retourne FALSE, TRUE, FALSE)

# Comparaison de chaînes de caractères
texte_1 <- "Bonjour"
texte_2 <- "Bonsoir"
texte_1 == texte_2  # Vérifie si les chaînes de caractères sont égales (retourne FALSE)

# Comparaison logique
vrai <- TRUE
faux <- FALSE
vrai == faux  # Vérifie si TRUE est égal à FALSE (retourne FALSE)
vrai != faux  # Vérifie si TRUE est différent de FALSE (retourne TRUE)

# Utilisation des comparaisons dans des structures conditionnelles
if (a < b) {
  print("a est inférieur à b")
} else {
  print("a est supérieur ou égal à b")
}

# Comparaison de valeurs manquantes (NA)
valeur_na <- NA
valeur_non_na <- 10
is.na(valeur_na)  # Vérifie si la valeur est NA (retourne TRUE)
valeur_na == valeur_non_na  # Comparaison avec NA retourne toujours NA

# Comparaison de facteurs
facteur_1 <- factor(c("Bas", "Moyen", "Haut"))
facteur_2 <- factor(c("Bas", "Haut", "Moyen"))
facteur_1 == facteur_2  # Compare les niveaux des facteurs (retourne TRUE, FALSE, FALSE)

# Comparaison de dates
date_1 <- as.Date("2024-01-01")
date_2 <- as.Date("2024-12-31")
date_1 < date_2  # Vérifie si date_1 est antérieure à date_2 (retourne TRUE)



# Pour les structures de données complexes, nous utilisons principalement des data frames : une combinaison de
# colonnes et de lignes qui est très pratique pour stocker des informations. 
# Une façon simple de le définir est comme une collection de listes avec le même nombre
# d'éléments, chaque colonne représentant une variable.
data.frame(
  list(
    nom = c('John', 'Annah', 'Mary'),
    age = c(44, 37, 39),
    emploi = c('Agriculteur', 'Journaliste', 'Plombier')
  )
)


# En combinant ce que nous avons appris, nous pouvons définir des objets pour stocker ces informations,
# puis créer un nouveau data frame avec eux.
noms <- c('John', 'Mary', 'Laura', 'Annah', 'Sarah', 'Alex', 'Pietro')
ages <- c(44, 39, 31, 37, 18, 27, 44)
emplois <- c('Agriculteur', 'Plombier', 'Journaliste', 'Journaliste', 'Médecin', 'Plombier','Médecin')
vaccin_grippe <- c(T, T, F, F, F, T, T)

# Maintenant que nous avons les objets disponibles, nous pouvons les assigner à un objet data frame
patients <- data.frame(
  list(
    nom = noms,
    age = ages,
    emploi = emplois,
    vaccin_grippe = vaccin_grippe
  )
)


# Nous pouvons accéder aux colonnes du data frame en utilisant l'opérateur $
patients$age

# Que se passerait-il si nous n'incluons pas les noms des colonnes ?
patients <- data.frame(
  list(
    noms,
    ages,
    emplois,
    vaccin_grippe
  )
)
patients

# Pour corriger cela, nous pouvons utiliser colnames() - cette fonction accepte comme argument
# un data frame. Si nous assignons ensuite les noms que nous voulons, le data frame sera
# corrigé.
colnames(patients) <- c('nom', 'age', 'emploi', 'vaccin_grippe')
patients





