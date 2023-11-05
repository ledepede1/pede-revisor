INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_revisor', 'Revisor', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_revisor', 'Revisor', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_revisor', 'Revisor', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('revisor','Revisor')
;


INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('revisor',0,'trainee','Lærling',2000,'{}','{}'),
	('revisor',1,'employee','Ansat',4000,'{}','{}'),
	('revisor',2,'boss','Chef',8000,'{}','{}')
;