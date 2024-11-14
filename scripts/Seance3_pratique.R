#déjá couvert dans la session 2:

# 1. select() : permet de sélectionner des colonnes spécifiques
# 2. rename() : permet de renommer des colonnes
# 3. ifelse() : permet d'utisier un conditionnel
# 4. mutate() : permet de créer ou transformer des colonnes
# 5. filter() : permet de filtrer les lignes selon des conditions
# 6. distinct() : permet de supprimer les doublons

#PROPOSALS
#ADD  function arrange() as well
#ADD function is.na() and how to deal with NAs

# 7. summarise() : permet de résumer les données
# 8. group_by() : permet de grouper les données pour des opérations agrégées

# Excemple  mutate() 
liste_lineaire <- liste_lineaire %>% 
  mutate(Sexe = as.factor(Sexe),
         Age = as.numeric(Age),
         DateSymptomes = as.Date(DateSymptomes, format="%Y-%m-%d"),
         NouvelleColonne = ifelse(Age > 30, "Adulte", "Jeune"))


# Utilisation de across pour appliquer des fonctions à plusieurs colonnes
# La fonction across() permet d'appliquer une fonction à plusieurs colonnes sélectionnées
liste_lineaire <- liste_lineaire %>% 
  mutate(across(starts_with("Eruptions"), ~ ifelse(is.na(.), "Non", .)))

# Autre exemple avec across
liste_lineaire <- liste_lineaire %>% 
  mutate(across(contains("Date"), as.Date))

# Filtrage des données
# La fonction filter() permet de filtrer les lignes du dataframe selon des conditions spécifiques
liste_lineaire <- liste_lineaire %>% 
  filter(EtatCas == "Vivant", Fievre == "Oui")

# Exemple de filtrage avec plusieurs conditions
liste_lineaire <- liste_lineaire %>% 
  filter(Age > 20, Hospitalisation == "Oui")

# Trier les données avec arrange
# La fonction arrange() permet de trier les données du dataframe selon des colonnes spécifiques
liste_lineaire <- liste_lineaire %>% 
  arrange(DateNotification)



# Exemple de tri avec plusieurs colonnes
liste_lineaire <- liste_lineaire %>% 
  arrange(NomProvince, desc(Age))



# Utilisation de case_when pour des conditions multiples
# La fonction case_when() permet de créer des colonnes en fonction de conditions multiples
liste_lineaire <- liste_lineaire %>% 
  mutate(Status = case_when(
    Sexe == "Masculin" & Fievre == "Oui" ~ "Homme avec fièvre",
    Sexe == "Féminin" & Fievre == "Oui" ~ "Femme avec fièvre",
    TRUE ~ "Autre"
  ))





# Exemple concret de nettoyage
# Voici un exemple concret qui combine plusieurs des fonctions expliquées précédemment

chemin <- "data/liste_lineaire_fausse_version1.xlsx" #directoire ou se trouve votre fiche d'excel
sheet <- 1 # la page que vous voulez ajouter

liste_lineaire <- readxl::read_excel(chemin, sheet) 


liste_lineaire %>% 
  rename(NomProvince = Province, NomZS = ZS, NomAS = AS) %>% 
  mutate(Sexe = as.factor(Sexe),
         Age = as.numeric(Age),
         DateSymptomes = as.Date(DateSymptomes, format="%Y-%m-%d"),
         Hospitalisation = ifelse(is.na(Hospitalisation), "Non", Hospitalisation),
         StatusCas = ifelse(is.na(StatusCas), "Inconnu", StatusCas)) %>% 
  #select(starts_with("Date"), ends_with("symptomes"), contains("Eruption")) %>% 
  distinct() %>% 
  mutate(across(starts_with("Eruptions"), ~ ifelse(is.na(.), "Non", .)),
         across(contains("Date"), as.Date)) %>% 
  filter(StatusCas == "Vivant", Fievre == "Oui") %>% 
  arrange(NomProvince, desc(Age)) %>% 
  mutate(Status = case_when(
    Sexe == "Masculin" & Fievre == "Oui" ~ "Homme avec fièvre",
    Sexe == "Féminin" & Fievre == "Oui" ~ "Femme avec fièvre",
    TRUE ~ "Autre"
  )) -> liste_lineaire_nettoyee

# Afficher le résultat
print(liste_lineaire_nettoyee)
