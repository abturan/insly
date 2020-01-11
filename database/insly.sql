-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:8889
-- Üretim Zamanı: 11 Oca 2020, 10:44:12
-- Sunucu sürümü: 5.7.26
-- PHP Sürümü: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `insly`
--
CREATE DATABASE IF NOT EXISTS `insly` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `insly`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `birthdate` date NOT NULL,
  `ssn` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  `is_current_employee` tinyint(1) NOT NULL DEFAULT '1',
  `email` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_turkish_ci DEFAULT NULL,
  `address` longtext COLLATE utf8_turkish_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `employees`
--

INSERT INTO `employees` (`id`, `name`, `birthdate`, `ssn`, `is_current_employee`, `email`, `phone`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ahmet Burak Turan', '1980-09-25', '37015049076', 0, 'a.burakturan@gmail.com', '00905312537811', 'Caferağa Mahallesi Kadıköy İstanbul', '2020-01-08 21:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `employee_info`
--

DROP TABLE IF EXISTS `employee_info`;
CREATE TABLE IF NOT EXISTS `employee_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `employee_info_id` int(11) DEFAULT NULL,
  `info_en` longtext,
  `info_es` longtext,
  `info_fr` longtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `employee_info`
--

INSERT INTO `employee_info` (`id`, `employee_id`, `employee_info_id`, `info_en`, `info_es`, `info_fr`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Accomplished software developer with 15 years of experience in development of applications. I have been involved in every stage of the life cycle of software development including design creation, coding, debugging, testing and maintenance. <br>\r\n\r\nMy main area of expertise is the Backend software architecture with PHP / Laravel. I also have knowledge and experience on Python, React, React Native, Vue, CSS, JQuery and Java Script languages. I can easily work with MySQL and PostgreSQL database models and on SQL language I have 15 years of experience. In recent years, I have gained more skills and experience on the MVC structure, based on SOLID principles. I\'m used to working on AGILE teams. I always use GIT in my projects and I know LINUX and MAC well. <br>\r\n\r\nRecently, I have been working with Solidity and Web3.js to develop Decentralized Applications on Ethereum Blockchain.\r\n', 'Desarrollador de software realizado con 15 años de experiencia en el desarrollo de aplicaciones. He participado en todas las etapas del ciclo de vida del desarrollo de software, incluida la creación de diseño, codificación, depuración, prueba y mantenimiento. <br>\r\n\r\nMi principal área de especialización es la arquitectura de software Backend con PHP / Laravel. También tengo conocimiento y experiencia en Python, React, React Native, Vue, CSS, JQuery y Java Script. Puedo trabajar fácilmente con modelos de bases de datos MySQL y PostgreSQL y en lenguaje SQL tengo 15 años de experiencia. En los últimos años, he adquirido más habilidades y experiencia en la estructura MVC, basada en principios SOLIDOS. Estoy acostumbrado a trabajar en equipos AGILE. Siempre uso GIT en mis proyectos y conozco bien LINUX y MAC. <br>\r\n\r\nRecientemente, he estado trabajando con Solidity y Web3.js para desarrollar aplicaciones descentralizadas en Ethereum Blockchain.', 'Développeur logiciel accompli avec 15 ans d\'expérience dans le développement d\'applications. J\'ai été impliqué à toutes les étapes du cycle de vie du développement logiciel, y compris la création de conception, le codage, le débogage, les tests et la maintenance. <br>\r\n\r\nMon principal domaine d\'expertise est l\'architecture logicielle Backend avec PHP / Laravel. J\'ai également des connaissances et une expérience sur les langages Python, React, React Native, Vue, CSS, JQuery et Java Script. Je peux facilement travailler avec les modèles de bases de données MySQL et PostgreSQL et sur le langage SQL j\'ai 15 ans d\'expérience. Ces dernières années, j\'ai acquis plus de compétences et d\'expérience sur la structure MVC, basée sur les principes SOLID. J\'ai l\'habitude de travailler sur des équipes AGILE. J\'utilise toujours GIT dans mes projets et je connais bien LINUX et MAC. <br>\r\n\r\nRécemment, j\'ai travaillé avec Solidity et Web3.js pour développer des applications décentralisées sur Ethereum Blockchain.', '2020-01-08 21:00:00', NULL, NULL),
(2, 1, 2, '<strong>IT MANAGER <br>\r\n@ INTERNATIONAL SERVİCES GROUP <br></strong>\r\n<i>Yettim.net </i><br><br>\r\n\r\nI have been the IT Manager of a company working on online food delivery for 1 year. With Laravel, I wrote the entire system with great care. In addition to that, I performed the management panel, restaurant data entry panel, mobile Api services and many other tasks. <br>\r\nI gained experience in developing joint projects with software developers in different languages ​​in the International Services Group, a Egyptian-German partnership.', '<strong> GERENTE DE TI <br>\r\n@ GRUPO INTERNACIONAL DE SERVICIOS <br> </strong>\r\n<i> Yettim.net </i> <br> <br>\r\n\r\nHe sido el gerente de TI de una empresa que trabaja en la entrega de alimentos en línea durante 1 año. Con Laravel, escribí todo el sistema con mucho cuidado. Además de eso, realicé el panel de administración, el panel de entrada de datos de restaurantes, los servicios móviles de Api y muchas otras tareas. <br>\r\nAdquirí experiencia en el desarrollo de proyectos conjuntos con desarrolladores de software en diferentes idiomas en el International Services Group, una asociación egipcia-alemana.', '<strong> GESTIONNAIRE INFORMATIQUE <br>\r\n@ INTERNATIONAL SERVİCES GROUP <br> </strong>\r\n<i> Yettim.net </i> <br> <br>\r\n\r\nJe suis responsable informatique d\'une entreprise travaillant sur la livraison de nourriture en ligne depuis 1 an. Avec Laravel, j\'ai écrit tout le système avec grand soin. En plus de cela, j\'ai effectué le panneau de gestion, le panneau de saisie des données du restaurant, les services Api mobiles et de nombreuses autres tâches. <br>\r\nJ\'ai acquis de l\'expérience dans le développement de projets communs avec des développeurs de logiciels dans différentes langues au sein du International Services Group, un partenariat égypto-allemand.', '2020-01-08 21:00:00', NULL, NULL),
(3, 1, 2, '<strong>SOFTWARE DEVELOPMENT MANAGER <br> @ POWER FM RADIO STATION</strong>\r\n<i>www.powerapp.com.tr</i><br><br>\r\n\r\nI have taken part in Software Development Specialist and Manager positions on development the CMS software, websites and API services that serve Android and IOS APPs of Power FM and Radio Fenomen. I\'ve provided control over PHP, Laravel, jQuery, MySQL, Linux, Redis, Memcache and Python Structures and languages, I\'ve managed the team and followed CMS integration processes.\r\n\r\n', '<strong> GERENTE DE DESARROLLO DE SOFTWARE <br> @ POWER FM RADIO STATION </strong>\r\n<i> www.powerapp.com.tr </i> <br> <br>\r\n\r\nHe participado en puestos de Especialista y Gerente de Desarrollo de Software en el desarrollo de software CMS, sitios web y servicios API que sirven a las aplicaciones Android e IOS de Power FM y Radio Fenomen. He proporcionado control sobre PHP, Laravel, jQuery, MySQL, Linux, Redis, Memcache y Python Structures e idiomas, he gestionado el equipo y seguido los procesos de integración de CMS.', '<strong> RESPONSABLE DU DÉVELOPPEMENT LOGICIEL <br> @ POWER FM RADIO STATION </strong>\r\n<i> www.powerapp.com.tr </i> <br> <br>\r\n\r\nJ\'ai participé à des postes de spécialiste en développement logiciel et de gestionnaire sur le développement du logiciel CMS, des sites Web et des services API qui servent les applications Android et IOS de Power FM et Radio Fenomen. J\'ai assuré le contrôle de PHP, Laravel, jQuery, MySQL, Linux, Redis, Memcache et Python Structures et langages, j\'ai géré l\'équipe et suivi les processus d\'intégration CMS.', '2020-01-08 21:00:00', NULL, NULL),
(4, 1, 2, '<strong>R&D SOFTWARE SPECIALIST<br>\r\n@ TURKTICARET.NET</strong>\r\n<i>www.turkticaret.net / theADX.com</i>\r\n<br><br>\r\nI worked as a software developer in the development unit of DMP and DSP systems. I\'ve made improvements to many modules such as ad targeting, customer menus, and ad input panels. I worked on Php, jQuery, Java Script, MySQL, Elastic Search, NoSQL, RESTful and NodeJS structures.\r\n\r\n', '<strong> ESPECIALISTA EN SOFTWARE DE I + D <br>\r\n@ TURKTICARET.NET </strong>\r\n<i> www.turkticaret.net / theADX.com </i>\r\n<br> <br>\r\nTrabajé como desarrollador de software en la unidad de desarrollo de sistemas DMP y DSP. He realizado mejoras en muchos módulos, como orientación de anuncios, menús de clientes y paneles de entrada de anuncios. Trabajé en Php, jQuery, Java Script, MySQL, Elastic Search, NoSQL, RESTful y estructuras NodeJS.', '<strong> SPÉCIALISTE DU LOGICIEL R&D <br>\r\n@ TURKTICARET.NET </strong>\r\n<i> www.turkticaret.net / theADX.com </i>\r\n<br> <br>\r\nJ\'ai travaillé comme développeur de logiciels dans l\'unité de développement des systèmes DMP et DSP. J\'ai apporté des améliorations à de nombreux modules tels que le ciblage publicitaire, les menus clients et les panneaux de saisie publicitaire. J\'ai travaillé sur les structures Php, jQuery, Java Script, MySQL, Elastic Search, NoSQL, RESTful et NodeJS.', '2020-01-08 21:00:00', NULL, NULL),
(5, 1, 2, '<strong>SOFTWARE SPECIALIST & PROJECT MANAGER<br>\r\n@ PRESIDENCY OF NATIONAL PALACES ADMINISTRATION</strong>\r\n<i>www.millisaraylar.gov.tr</i>\r\n<br><br>\r\n\r\nI worked as Project Manager and Software Specialist in all Back-End and Front-End works of www.millisaraylar.gov.tr ​​website serving for TBMM National Palaces. I worked on Php, Laravel, Scss, Css, jQuery, MySQL, AWS, Docker, Virtual Machines, SOAP.\r\n\r\n', '<strong> ESPECIALISTA DE SOFTWARE Y GERENTE DE PROYECTO <br>\r\n@ PRESIDENCIA DE ADMINISTRACIÓN DE PALACIOS NACIONALES </strong>\r\n<i> www.millisaraylar.gov.tr </i>\r\n<br> <br>\r\n\r\nTrabajé como Gerente de Proyecto y Especialista en Software en todos los trabajos de back-end y front-end del sitio web www.millisaraylar.gov.tr que sirve para los Palacios Nacionales TBMM. Trabajé en Php, Laravel, Scss, Css, jQuery, MySQL, AWS, Docker, Virtual Machines, SOAP.', '<strong> SPÉCIALISTE DU LOGICIEL ET CHEF DE PROJET <br>\r\n@ PRESIDENCE D\'ADMINISTRATION DES PALAIS NATIONAUX </strong>\r\n<i> www.millisaraylar.gov.tr </i>\r\n<br> <br>\r\n\r\nJ\'ai travaillé en tant que chef de projet et spécialiste logiciel dans tous les travaux back-end et front-end du site www.millisaraylar.gov.tr servant pour les palais nationaux TBMM. J\'ai travaillé sur Php, Laravel, Scss, Css, jQuery, MySQL, AWS, Docker, Virtual Machines, SOAP.', '2020-01-08 21:00:00', NULL, NULL),
(6, 1, 3, '<strong>MANAGEMENT INFORMATION SYSTEMS <br> BEYKENT UNİVERSTY / ISTANBUL</strong>\r\n<i>1999-2014 </i>\r\n\r\nMy graduation project was Hospital Appointment and Patient Tracking System. Doctors could enter appropriate appointment times and patients could make appointments. Examinations and results are collected on remote servers, and as a result of standard login procedures, patients and doctors can access the relevant results and information.', '<strong> SISTEMAS DE INFORMACIÓN DE GESTIÓN <br> BEYKENT UNİVERSTY / ESTAMBUL </strong>\r\n<i> 1999-2014 </i>\r\n\r\nMi proyecto de graduación fue el Sistema de seguimiento de pacientes y citas de hospitales. Los médicos pueden ingresar los horarios de citas apropiados y los pacientes pueden hacer citas. Los exámenes y resultados se recopilan en servidores remotos y, como resultado de los procedimientos de inicio de sesión estándar, los pacientes y los médicos pueden acceder a los resultados y la información relevantes.', '<strong> SYSTÈMES D\'INFORMATION DE GESTION <br> BEYKENT UNİVERSTY / ISTANBUL </strong>\r\n<i> 1999-2014 </i>\r\n\r\nMon projet de fin d\'études était le système de rendez-vous à l\'hôpital et de suivi des patients. Les médecins pouvaient saisir les heures de rendez-vous appropriées et les patients pouvaient prendre rendez-vous. Les examens et les résultats sont collectés sur des serveurs distants et, grâce aux procédures de connexion standard, les patients et les médecins peuvent accéder aux résultats et informations pertinents.', '2020-01-08 21:00:00', NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
