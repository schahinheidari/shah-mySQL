DROP TABLE IF EXISTS CLIENT, COMMANDE, DETAIL, PRODUIT, REDUCTION, LOCALITE ;

CREATE TABLE CLIENT (
     RefC INT NOT NULL,
     NomC VARCHAR(20) NOT NULL,
     Ville VARCHAR(20) NOT NULL,
     CAT VARCHAR(2),
     PRIMARY KEY (RefC)
) ;

CREATE TABLE COMMANDE(
     RefCom INT NOT NULL,
     RefC INT NOT NULL,
     DateCom DATE NOT NULL,
     PRIMARY KEY (RefCom)
) ;

CREATE TABLE DETAIL(
    RefCOM INT NOT NULL,
    RefP  VARCHAR(5) NOT NULL,  
    Quantite INT NOT NULL,
    PRIMARY KEY (RefCOM,RefP)
) ;

CREATE TABLE PRODUIT(
    RefP   VARCHAR(5) NOT NULL,
    TypeP  VARCHAR(20)  NOT NULL,
    Prix FLOAT(6,2)  NOT NULL,
    QStock INT,
    PRIMARY KEY (RefP)
) ;

CREATE TABLE REDUCTION(
    Code  VARCHAR(5) NOT NULL,
    Quantite  INT  NOT NULL,
    Reduction FLOAT(6,2)  NOT NULL,
    PRIMARY KEY (Code)
) ;

CREATE TABLE LOCALITE(
    Ville   VARCHAR(20) NOT NULL,
    Pays  VARCHAR(20)  NOT NULL,
    Departement INT  NOT NULL,
    PRIMARY KEY (Ville)
) ;

/*EXERCICE 2*/
/*1-a*/
select RefC
from COMMANDE NATURAL JOIN DETAIL NATURAL JOIN PRODUIT
GROUP BY RefC
HAVING COUNT(DISTINCT TypeP) = (select COUNT( DISTINCT TypeP)
                               from PRODUIT);
/*1-b*/
select RefC from CLIENT where RefC NOT IN (
                                           select RefC, TypeP
                                           from CLIENT NATURAL JOIN PRODUIT
                                           where (RefC,TypeP) NOT IN (select RefC,TypeP
                                                                      from COMMANDE NATURAL JOIN DETAIL NATURAL JOIN PRODUIT));
                                          
/*2*/
select RefCom, COUNT(RefP)
from DETAIL NATURAL JOIN PRODUIT
GROUP BY RefCom
HAVING COUNT(DISTINCT TypeP)=COUNT(RefP);
/*3*/
select DISTINCT Ville
from CLIENT
where RefC NOT IN (select RefC from COMMANDE where YEAR(DateCom) IN (2005,2006));

SELECT DISTINT Ville FROM CLIENT 
   WHERE Ville NOT IN select RefC,TypeP
                                        (from COMMANDE NATURAL JOIN DETAIL NATURAL JOIN PRODUIT));
                     





LOAD DATA LOCAL INFILE 'reduction.dat' INTO TALBLE REDUCTION ;
LOAD DATA LOCAL INFILE 'client.dat' INTO TABLE CLIENT ;
LOAD DATA LOCAL INFILE 'commande.dat' INTO TABLE COMMANDE ;
LOAD DATA LOCAL INFILE 'detail.dat' INTO TABLE DETAIL ;
LOAD DATA LOCAL INFILE 'produit.dat' INTO TABLE PRODUIT ;
LOAD DATA LOCAL INFILE 'reduction.dat' INTO TABLE REDUCTION ;
LOAD DATA LOCAL INFILE 'localite.dat' INTO TABLE LOCALITE ;



INSERT INTO COMMANDE VALUES (8,13,'2006-02-08');
INSERT INTO COMMANDE VALUES (9,1,'2006-03-11');

INSERT INTO DETAIL VALUES (5,"CH264",100);
INSERT INTO DETAIL VALUES (8,"CL60",95);
INSERT INTO DETAIL VALUES (9,"CL45",120);



