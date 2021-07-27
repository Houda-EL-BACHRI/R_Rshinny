setwd("C:/Users/El BaChRi/Desktop/ML_Random_Forest_Shinny")
library(RCurl)
library(randomForest)
library(lattice)
library(ggplot2)
library(caret)

# Prédire avec l'apprentissage automatique

# Charger les données
data(iris)

# Définir une graine pour rendre le hasard reproductible
set.seed(42)

# Échantillonner au hasard 100 des 150 index de lignes
indexes <- sample(
  x = 1:150, 
  size = 100)

# Inspecter les index aléatoires
print(indexes)

# Créer un ensemble de formation à partir d'index
train <- iris[indexes, ]

# Créer un ensemble de test à partir des index restants
test <- iris[-indexes, ]



write.csv(train, "Train.csv")
write.csv(test, "Test.csv")

Trainset <- read.csv("Train.csv", header = TRUE)
Trainset <- Trainset[,-1]

Trainset$Species <- as.factor(Trainset$Species)

model <- randomForest(Species ~ .,data = Trainset, ntree =500,mtry =4, importance=TRUE)

saveRDS(model, "model.rds")
