-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: zoo
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `id_animal` tinyint NOT NULL AUTO_INCREMENT,
  `nombre_animal` varchar(40) NOT NULL,
  `apodo_animal` varchar(40) DEFAULT NULL,
  `descripcion_animal` text NOT NULL,
  `familia_animal` varchar(40) NOT NULL,
  `id_empleado` tinyint NOT NULL,
  `id_entrega` tinyint NOT NULL,
  PRIMARY KEY (`id_animal`),
  KEY `animal_fk_empleado` (`id_empleado`),
  KEY `animal_fk_comida` (`id_entrega`),
  CONSTRAINT `animal_fk_comida` FOREIGN KEY (`id_entrega`) REFERENCES `comida` (`id_entrega`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `animal_fk_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (1,'Cotorra','Pepe','Animal volador de colores verdes que es hablador','Aves',1,1),(2,'Guacamayo','Rio','Animal de colores muy llamativos','Aves',2,2),(3,'Pavo Real','','Animal de plumas muy lindas y coloridas','Aves',3,3),(4,'Condor','Condorito','El rey de los cielos chilenos','Aves',4,4),(5,'Loro','','Animal que puede imitar el hablar humano','Aves',5,5),(6,'Buho','Chuncho','Posee la capacidad de rotar su cabeza en 360┬░','Aves',6,6),(7,'Ciervo','Bambi','Animal de grande astas','Mamifero',7,7),(8,'Leon','Simba','Posee gran melena rey de los animales','Mamifero',8,8),(9,'Cebra','Marty','Posee frangas como un piano','Mamifero',9,9),(10,'Elefante','','Tiene una gran trompa','Mamifero',10,10),(11,'Jirafa','Melman','Animal hevivoro de gran cuello','Mamifero',11,11),(12,'Hipopotamo','Gloria','Animal que posee una de las mordidas m├ís fuertes del mundo','Mamifero',12,12),(13,'Tigre de Bengala','Diego','Uno de los grandes felinos de colores muy lindo','Mamifero',13,13),(14,'Puma','','Es el 2do felino m├ís grande de america','Mamifero',14,14),(15,'Llama','Fortnite','Escupen para demostrar dominio de su territorio','Mamifero',15,15),(16,'Alpaca','','Originaria del norte de Chile','Mamifero',16,1),(17,'Huemul','','Es un animal simbolo del escudo de chile','Mamifero',17,2),(18,'Zorro','Nick Wilde','Animal carrone├▒o de bellos colores','Mamifero',17,3),(19,'Pantera','','Felino de gran tama├▒o con enorme velocidad para cazar','Mamifero',18,3),(20,'Koala','','Animal peresoso y lento','Mamifero',19,4),(21,'Tortuga Marina','Chiky','Animal marino de hermosos colores','Mamifero',20,5),(22,'Cocodrilo','','Uno de los reptiles m├ís grandes y con una poderoza mordida','Mamifero',21,6);
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comida`
--

DROP TABLE IF EXISTS `comida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comida` (
  `id_entrega` tinyint NOT NULL AUTO_INCREMENT,
  `nombre_comida` varchar(20) NOT NULL,
  `id_proveedor` tinyint NOT NULL,
  PRIMARY KEY (`id_entrega`),
  KEY `comida_fk_proveedor` (`id_proveedor`),
  CONSTRAINT `comida_fk_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comida`
--

LOCK TABLES `comida` WRITE;
/*!40000 ALTER TABLE `comida` DISABLE KEYS */;
INSERT INTO `comida` VALUES (1,'Frutas',1),(2,'Frutas',2),(3,'Frutas',3),(4,'Carne',4),(5,'Carne',5),(6,'Carne',6),(7,'Semillas',7),(8,'Semillas',8),(9,'Semillas',9),(10,'Pescado',10),(11,'Pescado',11),(12,'Pescado',12),(13,'Verduras',13),(14,'Verduras',14),(15,'Verduras',15);
/*!40000 ALTER TABLE `comida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` tinyint NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(20) NOT NULL,
  `apellido_empleado` varchar(20) NOT NULL,
  `password_empleado` varchar(8) NOT NULL,
  `email_empleado` varchar(20) NOT NULL,
  `telefono_empleado` int NOT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'David','Navarro','david123','davidn@gmail.com',998989765),(2,'Karla','Ruiz','karla123','karlar@gmail.com',989877763),(3,'Jose','Diaz','jose1234','josed@gmail.com',912312890),(4,'Alejandra','Serrano','ale12345','alejandras@gmail.com',988744452),(5,'Ana','Hernandez','ana12345','anah@gmail.com',991239900),(6,'Lucia','Munoz','lucia123','luciam@gmail.com',912345121),(7,'Rafael','Saez','rafa1234','rafaels@gmail.com',912322100),(8,'Laura','Romero','laura123','laurar@gmail.com',988123090),(9,'Juan','Rubio','juan1234','juanr@gmail.com',976777612),(10,'Luis','Alfaro','luis1234','luisal@gmail.com',912009455),(11,'Teresa','Molina','tere1234','teresamo@gmail.com',900891246),(12,'Joaquin','Castillo','joaco123','joaquinca@gmail.com',997689334),(13,'Elena','Lozano','elena123','elenalo@gmail.com',915647835),(14,'Sergio','Picazo','sergio12','sergiop@gmail.com',998981126),(15,'Manuela','Ortega','manuela1','manuelaor@gmail.com',912340987),(16,'Andres','Fuentes','andres12','andresfu@gmail.com',979633718),(17,'Camila','Araya','camila12','camilaar@gmail.com',990390418),(18,'Omar','Martinez','omar1234','omarma@gmail.com',982584429),(19,'Cesar','Veliz','cesar123','cesarve@gmail.com',971361371),(20,'Antonio','Garcia','antonio1','antonioga@gmail.com',973433109),(21,'Maria','Martinez','maria123','mariama@gmail.com',990675294),(22,'Francisco','Lopez','pancho12','franciscol@gmail.com',912091286),(23,'Isabel','Sanchez','isabel12','isabelsa@gmail.com',997536729),(24,'Manuel','Gonzalez','manuel12','manuelgo@gmail.com',934651209),(25,'Carmen','Gomez','carmen12','carmengo@gmail.com',900764103),(26,'Jesus','Fernandez','jesus123','jesusfe@gmail.com',907085612),(27,'Pilar','Moreno','pilar123','pilarmo@gmail.com',912345678),(28,'Miguel','Jimenez','miguel12','miguelji@gmail.com',965667429),(29,'Javiera','Perez','javiera1','javierape@gmail.com',998765432),(30,'Antonia','Rodriguez','antonia1','antoniaro@gmail.com',569874159);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` tinyint NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(20) NOT NULL,
  `telefono_proveedor` int NOT NULL,
  `email_proveedor` varchar(20) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Rosa Morcillo',910026378,'rosamo@gmail.com'),(2,'Andres Cano',909087482,'andresca@gmail.com'),(3,'Ramon Garrido',911206792,'ramonga@gmail.com'),(4,'Raul Torres',942738920,'raulto@gmail.com'),(5,'Mercedes Marin',933332897,'mercedesma@gmail.com'),(6,'Alberto Cuenca',999908653,'albertocu@gmail.com'),(7,'Enrique Gil',912309001,'enriquegil@gmail.com'),(8,'Irene Molina',900091254,'irenemo@gmail.com'),(9,'Alvaro Ortiz',912312322,'alvaroor@gmail.com'),(10,'Beatriz Calero',943563445,'beatrizca@gmail.com'),(11,'Angela Cebrian',909807608,'angelace@gmail.com'),(12,'Diego Rodenas',977289123,'diegoro@gmail.com'),(13,'Julian Alarcon',912221009,'julianal@gmail.com'),(14,'Rocio Blazquez',988789987,'rociobl@gmail.com'),(15,'Emilio Valero',912573889,'emiliova@gmail.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-04 19:55:21
