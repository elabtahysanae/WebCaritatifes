# <span style="color:green;">🌍🤝 Plateforme de Dons Caritatifs</span>

---

## 📌 **Contexte**

La gestion des dons caritatifs représente aujourd’hui un défi pour de nombreuses organisations, souvent confrontées à un manque d’outils adaptés pour suivre efficacement les campagnes, les contributions et l’engagement des donneurs. Ce projet consiste en la création d’une application web développée en Java, pensée pour centraliser et simplifier l’ensemble du processus.Elle permet:

- Aux **organisations caritatives** de créer et suivre leurs campagnes.
- aux **donneurs** d’accéder facilement aux **causes** qui les touchent et de contribuer en ligne .
- À l'**administration** de disposer de statistiques détaillées pour piloter l’ensemble de l’activité.

---

## ❓ **Problématique**

La gestion manuelle des dons caritatifs engendre plusieurs limitations majeures qui freinent l’efficacité et la transparence des actions menées :

- **Difficulté à suivre l’évolution des dons par cause** : Il est souvent difficile de suivre précisément l’évolution des dons associés à chaque cause, notamment en l’absence d’un système centralisé de collecte et d’enregistrement.
  
- **Manque de visibilité sur l'impact des dons collectés** : Le manque de traçabilité rend également plus complexe l’évaluation de l’impact réel des fonds collectés sur les projets soutenus.
  
- **Processus d’attribution de dons chronophage** : L’attribution des dons aux différentes causes reste une tâche chronophage, nécessitant des traitements manuels, souvent sources d’erreurs ou de retards.
  
- **Absence de suivi des statistiques** : L’absence de suivi des statistiques empêche les organisations d’analyser les performances de leurs campagnes, de mesurer leur efficacité et d’ajuster leurs stratégies en conséquence.

Ces défis soulignent la nécessité d’un système automatisé et structuré pour gérer les dons de manière **plus efficace**, **transparente** et **durable**.

---

## 🎯 **Objectifs**

Créer une plateforme centralisée pour :

-  **Lister toutes les causes** disponibles.
-  **Permettre aux donneurs de faire des dons** en ligne.
-  **Générer des statistiques par cause** (par exemple, montant total collecté, nombre de donneurs).
- Fournir aux **donneurs** :
  -  **Visualisation des causes** auxquelles ils peuvent participer.
  -  **Notifications de la progression des causes** et des campagnes.

---

## 🧩 **Diagramme de Classe**

![WhatsApp Image 2025-04-10 at 04 44 04_ea2fc900](https://github.com/user-attachments/assets/8766881e-4603-4cb8-9009-e38dfef2d505)

---

## 🗃️ **Modèle Conceptuel de la Base**

<img width="487" alt="image" src="https://github.com/user-attachments/assets/366212c8-5cbc-4ad2-b4dd-ee0b9e5b30a9" />

---

## ⚙️ **Exécution des Tests**

<img width="366" alt="image" src="https://github.com/user-attachments/assets/39c67dff-8789-45f8-9b7b-78967737dba5" />

-**La creation des tables**

<img width="346" alt="image" src="https://github.com/user-attachments/assets/823cc2d7-b043-4701-9cf6-af8503cfe2b2" />

-**Les Alters des tables**

<img width="417" alt="image" src="https://github.com/user-attachments/assets/ab3f8008-fb77-408b-980e-dcae827c603e" />

-**Les insertions**

<img width="335" alt="image" src="https://github.com/user-attachments/assets/489d4558-402f-40cf-8e5d-c26310761d2e" />

<img width="413" alt="image" src="https://github.com/user-attachments/assets/1c78272a-eacd-4df7-b804-a57689576a13" />

-**Les filtrages**

<img width="483" alt="image" src="https://github.com/user-attachments/assets/f3446717-4fc7-4797-9c13-f675e31d888e" />

-**l'Authentification**

![authentifier](https://github.com/user-attachments/assets/2898b458-a937-45ba-9115-3556f162f466)

-**L'Inscription**

![inscrir](https://github.com/user-attachments/assets/9d417a22-9dec-4ab9-a9ff-77f6d735a449)

-**Le dashboard d'Admin**

![dashboard](https://github.com/user-attachments/assets/0aba4b5c-ddb8-46d3-9985-62e3539975f2)

---

## 🛠 **Technologies**

### ⚙️ **Côté serveur (Backend)**

- **Java Web** – Technologie principale pour la logique métier.
- **Hibernate** – Pour la gestion de la persistance des données de manière orientée objet.
- **JDBC** – Utilisé ponctuellement pour des requêtes spécifiques non prises en charge par l'ORM.

## 🗃️ **Base de Données**

- **MySQL** : Base de données relationnelle pour stocker les données des utilisateurs, dons, et causes.

  - Utilisant **XAMPP** pour gérer MySQL.
  - Utilisant à **phpMyAdmin** pour acceder aux tables.

### Entités principales :

- **User** : Classe de base pour les utilisateurs (nom, email, mot de passe).
- **Donneur** et **Admin** : Héritent de **User**.
- **Cause** : Titre, description, objectif, catégorie.
- **Don** : Montant, date, cause, donneur.
- **Categorie** : nom.

---

