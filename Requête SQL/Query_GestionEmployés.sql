-- ________________________________________________________________________________ --
--                               Gestion des employés                               --
-- ________________________________________________________________________________ --
USE POO_Groupe4;

-- _______________ Variables Employé ______________ --
DECLARE @Nom VARCHAR(30);
SET @Nom = 'Rigaud';

DECLARE @Prenom VARCHAR(30);
SET @Prenom = 'Ulysses';

DECLARE @DateEmbauche DATE;
SET @DateEmbauche = '1986-11-23';

DECLARE @Responsable VARCHAR(30);
SET @Responsable = 'NULL';

DECLARE @Statut BIT;
SET @Statut = '1';

DECLARE @NumRue INT
Set @NumRue = '26';

DECLARE @NomRue VARCHAR(100)
Set @NomRue = 'Rue de la République';

DECLARE @Ville VARCHAR(50)
Set @Ville = 'Lyon';

DECLARE @CodePostal INT
Set @CodePostal = '69002';

-- ____________________ Create ____________________ --
INSERT INTO Employee (N_E, S_E, HD_E, N1_E, ST_E)
VALUES (@Prenom, @Nom, @DateEmbauche, @Responsable, 1);

DECLARE @EmployeeID INT;
SET @EmployeeID = SCOPE_IDENTITY();

INSERT INTO Adress (SNB, SN, N_V, PC, ID_E)
VALUES (@NumRue, @NomRue, @Ville, @CodePostal, @EmployeeID);

-- _____________________ Read _____________________ --

SELECT 
    Employee.N_E AS Prénom,
    Employee.S_E AS Nom,
    Employee.HD_E AS [Date dEmbauche],
    Employee.N1_E AS Responsable,
    Employee.ST_E AS Statut,
    Adress.SNB AS [Numéro de rue],
    Adress.SN AS [Nom de rue],
    Adress.N_V AS Ville,
    Adress.PC AS [Code postal]
FROM 
    Employee
INNER JOIN 
    Adress ON Employee.ID_E = Adress.ID_E
WHERE 
    Employee.S_E = @Nom

-- ____________________ Update ____________________ --

UPDATE Employee
SET N_E = 'Peïo', S_E = 'Rigaud'
WHERE N_E = @Prenom AND S_E = @Nom AND HD_E = @DateEmbauche;

UPDATE Adress
SET SNB = '14', SN = 'Rue du CESI', N_V = 'Lyon', PC = '69003' FROM Adress
INNER JOIN Employee ON Adress.ID_E = Employee.ID_E
WHERE Employee.N_E = 'Peïo' AND Employee.S_E = 'Rigaud' AND Employee.HD_E = @DateEmbauche;

-- ____________________ Delete ____________________ --
DELETE FROM Employee 
WHERE S_E = @Nom AND N_E = @Prenom AND HD_E = @DateEmbauche;
