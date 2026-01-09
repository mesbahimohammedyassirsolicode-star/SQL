--1-Afficher le nombre de taches par projet;

SELECT idProjet, COUNT(*) AS nbTaches
FROM Taches
GROUP BY idProjet;

--2-Afficher la durée de chaque projet en jours;
SELECT nom, DATEDIFF(dateFin, dateDebut)
FROM Projet;
--3-Afficher les taches en retard;
SELECT t.description, t.etat
FROM Taches t 
WHERE dateLimite < CURDATE() AND etat <>'terminée';
--4-Afficher le nombre de projets par employé;
SELECT e.nom, e.prenom, COUNT(p.id) AS nbProjets
FROM Employeur e
LEFT JOIN Projet p ON p.idChefProjet = e.id
GROUP BY e.nom, e.prenom;
--5-Afficher l'employé qui a réalisé le plus grand nombre de taches;
SELECT e.prenom, e.nom, COUNT(t.id) AS nbTaches
FROM Employeur e 
INNER JOIN Taches t ON t.idEmploye = e.id
GROUP BY e.id
ORDER BY nbTaches DESC 
LIMIT 1;
--6-Afficher la dernière tache ajoutée pour chaque projet;
SELECT 
FROM Taches t
INNER JOIN (
    SELECT idProjet, MAX(id) AS lastTache
    FROM Taches
    GROUP BY idProjet
) 
ON t.idProjet = i.idProjet
AND t.id = i.lastTache;