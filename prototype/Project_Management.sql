-- Insert values into EMPLOYE
INSERT INTO EMPLOYE VALUES
(1, 'EL fakihi', 'Ayoub', 'Developpeur'),
(2, 'EL medkour', 'Brahim', 'Developpeur'),
(3, 'Mesbahi', 'Mohammed', 'Chef de projet'),
(4, 'ALAMI', 'AHMED', 'Designer');

-- Insert values into PROJET
INSERT INTO PROJET VALUES
(234, 'Site E-commerce Beauty', '2025-01-10', '2026-03-15', 3),
(98,  'Application Mobile RH', '2024-06-01', '2025-09-20', 3),
(120, 'Plateforme E-learning', '2025-02-01', '2025-12-30', 3);

-- Insert values into TACHE
INSERT INTO TACHE VALUES
(1, 'Analyse des besoins', 'terminee', 1, 234),
(2, 'Developpement front-end', 'en cours', 2, 234),
(3, 'Tests finaux', 'terminee', 3, 234),
(4, 'API Backend', 'terminee', 1, 98),
(5, 'Interface UI', 'en cours', 2, 98),
(6, 'Conception UML', 'terminee', 1, 120);
USE projet_management;
-- 1-Afficher tous les projets (titre,dateDeb,dateFin)
SELECT titre, dateDeb, dateFin
FROM PROJET;
-- 2-Afficher les employés dont le nom commence par 'EL'
SELECT *
FROM EMPLOYE
WHERE nom LIKE 'EL%';
-- 3-Afficher les taches du projet Num 234 ordonnées par priorité par ordre croissant
SELECT *
FROM TACHE
WHERE codeProjet = 234
ORDER BY priorite ASC;
-- 4-Afficher les projets qui doivent se terminer avant Avril 2026
SELECT *
FROM PROJET
WHERE dateFin < '2026-04-01';
-- 5-Afficher tous les employés développeurs
SELECT *
FROM EMPLOYE
WHERE fonction = 'Développeur';
-- 6-Afficher les taches terminées du projet de code 98
SELECT *
FROM TACHE
WHERE codeProjet = 98
AND statut = 'terminée';
-- 7-Afficher pour les projets avec leur responsables(titre,dateDéb,dateFin,nomChef,prénomChef)
SELECT p.titre, p.dateDeb, p.dateFin,
       e.nom AS nomChef,
       e.prenom AS prenomChef
FROM PROJET p
JOIN EMPLOYE e
ON p.idChef = e.idEmp;
-- 8-Afficher les taches du projet 'Site E-commerce Beauty'
SELECT t.*
FROM TACHE t
JOIN PROJET p
ON t.codeProjet = p.codeProjet
WHERE p.titre = 'Site E-commerce Beauty';
-- 9- Afficher le nombre de taches 'terminées' du projet  'Site E-commerce Beauty'
SELECT COUNT(*) AS nbTachesTerminees
FROM TACHE t
JOIN PROJET p
ON t.codeProjet = p.codeProjet
WHERE p.titre = 'Site E-commerce Beauty'
AND t.statut = 'terminée';
-- 10-Combien de projets ont été terminé dans l'année 2025
SELECT COUNT(*) AS nbProjets2025
FROM PROJET
WHERE YEAR(dateFin) = 2025;
---update chapter
-- 1- Modifier la date de fin du projet 234 par "16/05/2026"
UPDATE PROJET
set datefin ='16/05/2026'
where codeProjet =234 ;
--2- Modifier l'état de la tache 98 par "Terminée"
UPDATE TACHE
SET STATUS ='Terminée'
where codeProjet=98;
--DELET chapter
-- 1-Supprimer les taches "non commencées" du projet 123
DELETE from TACHE
where codeProjet =123
and STATUS ='non commencées';
-- 2-Supprimer l'employé "ALAMI AHMED"
DELETE FROM EMPLOYE
WHERE nom = 'ALAMI'
AND prenom = 'AHMED';