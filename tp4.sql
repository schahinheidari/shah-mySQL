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
