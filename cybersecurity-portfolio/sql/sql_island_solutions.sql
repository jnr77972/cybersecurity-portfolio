SELECT * FROM village
villageid	nom	chef
1	Singecity	1
2	Concombreville	6
3	Oignonplace	13
Yeah!
SELECT*FROM HABITANT
Seules les requêtes de type SELECT, INSERT, UPDATE et DELETE sont autorisées.
SELECT HABITANT
Erreur: no such column: HABITANT
SELECT * FROM HABITANT
personneid	nom	villageid	genre	metier	monnaie	statut
1	Paul Boulanger	1	m	boulanger	850	pacifique
2	Ernest Poiré	3	m	armurier-forgeron	280	pacifique
3	Rita Leboeuf	1	f	boulanger	350	pacifique
4	Carl Leboeuf	1	m	marchand	250	pacifique
5	Dirty Dieter	3	m	forgeron	650	maléfique
6	Gérard Labat	2	m	boucher	4850	maléfique
7	Pierre Labat	3	m	boucher	3250	maléfique
8	Arthur Tailleur	2	m	pilote	490	kidnappé
9	Tiphaine Batteur	1	f	boulanger	550	maléfique
10	Pierre Batteur	1	m	forgeron	600	pacifique
11	Dirty Diane	3	f	fermier	10	maléfique
12	Otto Chandelier	2	m	revendeur	680	pacifique
13	Fred Poète	3	m	auteur	420	pacifique
14	Enrico Charpentier	3	m	armurier-forgeron	510	maléfique
15	Hélène Gazon	2	f	revendeur	680	pacifique
16	Irène Chapelier	1	f	revendeur	770	maléfique
17	Edouard Gazon	3	m	boucher	990	pacifique
18	Rodolphe Canasson	3	m	maréchal-ferrant-forgeron	390	pacifique
19	Anne Carné	2	f	boucher	2280	pacifique
Yeah!
SELECT * FROM habitant WHERE metier = 'boucher'
personneid	nom	villageid	genre	metier	monnaie	statut
6	Gérard Labat	2	m	boucher	4850	maléfique
7	Pierre Labat	3	m	boucher	3250	maléfique
17	Edouard Gazon	3	m	boucher	990	pacifique
19	Anne Carné	2	f	boucher	2280	pacifique
Yeah!
SELECT * FROM HABITANT WHERE statut = 'pacifique'
personneid	nom	villageid	genre	metier	monnaie	statut
1	Paul Boulanger	1	m	boulanger	850	pacifique
2	Ernest Poiré	3	m	armurier-forgeron	280	pacifique
3	Rita Leboeuf	1	f	boulanger	350	pacifique
4	Carl Leboeuf	1	m	marchand	250	pacifique
10	Pierre Batteur	1	m	forgeron	600	pacifique
12	Otto Chandelier	2	m	revendeur	680	pacifique
13	Fred Poète	3	m	auteur	420	pacifique
15	Hélène Gazon	2	f	revendeur	680	pacifique
17	Edouard Gazon	3	m	boucher	990	pacifique
18	Rodolphe Canasson	3	m	maréchal-ferrant-forgeron	390	pacifique
19	Anne Carné	2	f	boucher	2280	pacifique
Yeah!
SELECT * FROM HABITANT WHERE STATUT = 'pacifique' AND metier = 'armurier-forgeron'
personneid	nom	villageid	genre	metier	monnaie	statut
2	Ernest Poiré	3	m	armurier-forgeron	280	pacifique
Yeah!
SELECT * FROM HABITANT WHERE STATUT = 'pacifique' AND metier LIKE '%forgeron'
personneid	nom	villageid	genre	metier	monnaie	statut
2	Ernest Poiré	3	m	armurier-forgeron	280	pacifique
10	Pierre Batteur	1	m	forgeron	600	pacifique
18	Rodolphe Canasson	3	m	maréchal-ferrant-forgeron	390	pacifique
Yeah!
INSERT INTO habitant (nom, villageid, genre, metier, monnaie, statut) VALUES ('Etranger', 1, '?', '?', 0, '?')
Yeah!
SELECT FROM personneid
Erreur: near "FROM": syntax error
SELECT FROM HABITANT (personneid) AND VALUES ('Etranger')
Erreur: near "FROM": syntax error
SELECT FROM HABITANT = 'personnid'
Erreur: near "FROM": syntax error
SELECT FROM HABITANT WHERE personneid = 'ETRANGER'
Erreur: near "FROM": syntax error
SELECT * FROM HABITANT WHERE personneid = 'ETRANGER'
null	null	null	null	null	null	null
Les colonnes ne sont pas les bonnes.
SELECT FROM HABITANT WHERE STATUT = 'pacifique' AND metier LIKE '%forgeron
Erreur: near "FROM": syntax error
INSERT INTO habitant (personneid) VALUES ('Etranger')
Erreur: datatype mismatch
SELECT INTO habitant (personneid, 'Etranger') 
Erreur: near "INTO": syntax error
SELECT INTO habitant (personneid) VALUES = 'Etranger'
Erreur: near "INTO": syntax error
SELECT INTO habitant = 'personneid' AND VALUES = 'Etranger'
Erreur: near "INTO": syntax error
INSERT INTO HABITANT = 'personneid' AND VALUES = 'Etranger'
Erreur: near "=": syntax error
SELECT INTO HABITANT = 'personneid' AND VALUES = 'Etranger'
Erreur: near "INTO": syntax error
SELECT FROM HABITANT = 'personneid' AND VALUES = 'Etranger'
Erreur: near "FROM": syntax error
SELECT * FROM HABITANT = 'personneid' AND VALUES = 'Etranger'
Erreur: near "=": syntax error
SELECT FROM HABITANT = personneid AND VALUES = Etranger
Erreur: near "FROM": syntax error
INSERT INTO habitant (nom, villageid, genre, metier, monnaie, statut) VALUES ('Etranger', 1, '?', '?', 0, '?')
Tu fais quoi ?
INSERT INTO habitant (nom, villageid, genre, metier, monnaie, statut) VALUES ('Etranger', 1,)
Erreur: near ")": syntax error
INSERT INTO habitant (nom, villageid, genre, metier, monnaie, statut) VALUES ('Etranger', 1)
Erreur: 2 values for 6 columns
INSERT INTO habitant (personneid) VALUES ('Etranger', 1)
Erreur: 2 values for 1 columns
INSERT INTO habitant (personneid) VALUES (Etranger)
Erreur: no such column: Etranger
INSERT INTO habitant (personneid) VALUES (nom, 'Etranger')
Erreur: no such column: nom
INSERT INTO habitant (personneid, nom) VALUES ('Etranger')
Erreur: 1 values for 2 columns
INSERT INTO habitant (personneid,) VILLAGE (nom,'Etranger')
Erreur: near ")": syntax error
SELECT habitant_id FROM habitant WHERE nom = 'Etranger'
Erreur: no such column: habitant_id
SELECT nom FROM habitant WHERE nom = 'Etranger'
nom
Etranger
Le résultat est incorrect. Remarques : attention de bien différentier les majuscules et les minuscules pour les valeurs entre guillemets.
SELECT personneid FROM habitant WHERE nom = 'Etranger'
personneid
20
Yeah!
SELECT monnaie FROM habitant WHERE personneid = '20'
monnaie
0
Yeah!
SELECT objet FROM OBJET WHERE proprietaire IS NULL
objet
théière
bague
tasse à café
seau
boite en carton
ampoule
Les colonnes ne sont pas les bonnes.
SELECT * FROM objet WHERE proprietaire IS NULL
objet	proprietaire
théière	null
bague	null
tasse à café	null
seau	null
boite en carton	null
ampoule	null
Yeah!
UPDATE objet SET proprietaire = 20 WHERE objet = 'tasse à café'
Yeah!
UPDATE objet SET proprietaire = 20 WHERE proprietaire IS NULL
Yeah!
UPDATE objet SET proprietaire = 20 
Tu fais quoi ?
UPDATE objet SET proprietaire = 20 WHERE proprietaire = 20
Tu fais quoi ?
SELECT OBJET WHERE proprietaire = 20
Erreur: no such column: OBJET
SELECT Objet WHERE proprietaire = 20
Erreur: no such column: Objet
UPDATE objet SET proprietaire = 20 WHERE OBJET = 'objet'
Tu fais quoi ?
UPDATE objet SET proprietaire = 20 WHERE proprietaire IS 20
Tu fais quoi ?
UPDATE objet SET proprietaire = 20 
Tu fais quoi ?
SELECT * FROM object WHERE proprietaire = 20
Erreur: no such table: object
SELECT FROM object WHERE proprietaire = 20
Erreur: near "FROM": syntax error
UPDATE objet SET proprietaire = 20 AND OBJET = objet
Tu fais quoi ?
UPDATE objet SET proprietaire = 20 AND OBJET = 'objet'
Tu fais quoi ?
SELECT * FROM objet WHERE possesseur = 20
Erreur: no such column: possesseur
SELECT * FROM objet WHERE proprietaire = 20
objet	proprietaire
théière	20
bague	20
tasse à café	20
seau	20
boite en carton	20
ampoule	20
Yeah!
SELECT * FROM habitant
WHERE etat = 'pacifique'
AND (metier = 'marchand' OR metier = 'revendeur');
Erreur: no such column: etat
SELECT * FROM habitant
personneid	nom	villageid	genre	metier	monnaie	statut
1	Paul Boulanger	1	m	boulanger	850	pacifique
2	Ernest Poiré	3	m	armurier-forgeron	280	pacifique
3	Rita Leboeuf	1	f	boulanger	350	pacifique
4	Carl Leboeuf	1	m	marchand	250	pacifique
5	Dirty Dieter	3	m	forgeron	650	maléfique
6	Gérard Labat	2	m	boucher	4850	maléfique
7	Pierre Labat	3	m	boucher	3250	maléfique
8	Arthur Tailleur	2	m	pilote	490	kidnappé
9	Tiphaine Batteur	1	f	boulanger	550	maléfique
10	Pierre Batteur	1	m	forgeron	600	pacifique
11	Dirty Diane	3	f	fermier	10	maléfique
12	Otto Chandelier	2	m	revendeur	680	pacifique
13	Fred Poète	3	m	auteur	420	pacifique
14	Enrico Charpentier	3	m	armurier-forgeron	510	maléfique
15	Hélène Gazon	2	f	revendeur	680	pacifique
16	Irène Chapelier	1	f	revendeur	770	maléfique
17	Edouard Gazon	3	m	boucher	990	pacifique
18	Rodolphe Canasson	3	m	maréchal-ferrant-forgeron	390	pacifique
19	Anne Carné	2	f	boucher	2280	pacifique
Yeah!
SELECT * FROM habitant WHERE metier = 'boucher'
personneid	nom	villageid	genre	metier	monnaie	statut
6	Gérard Labat	2	m	boucher	4850	maléfique
7	Pierre Labat	3	m	boucher	3250	maléfique
17	Edouard Gazon	3	m	boucher	990	pacifique
19	Anne Carné	2	f	boucher	2280	pacifique
Yeah!

