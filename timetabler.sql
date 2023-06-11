-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2022 at 11:55 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `timetabler`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesstokens`
--

CREATE TABLE `accesstokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `csv_data`
--

CREATE TABLE `csv_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `csv_filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `csv_header` tinyint(1) NOT NULL DEFAULT 0,
  `csv_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `csv_data`
--

INSERT INTO `csv_data` (`id`, `csv_filename`, `csv_header`, `csv_data`, `created_at`, `updated_at`) VALUES
(1, 'Department of Biological & Physical Sciences Programs - Sheet1.csv', 1, '[{\"name\":\"Bachelor of Science in Environmental Science\",\"semesters\":2,\"years\":4,\"program_code\":\"ES\",\"school_id\":1},{\"name\":\"Bachelor of Science in Botany\",\"semesters\":2,\"years\":4,\"program_code\":\"BscB\",\"school_id\":1},{\"name\":\"Bachelor of Science in Zoology\",\"semesters\":2,\"years\":4,\"program_code\":\"BscZ\",\"school_id\":1},{\"name\":\"Certificate in Environmental Impact Assessment\",\"semesters\":2,\"years\":1,\"program_code\":\"CEIA\",\"school_id\":1}]', '2022-06-28 02:50:34', '2022-06-28 02:50:34'),
(2, 'Department of Commerce Programs - Sheet1.csv', 1, '[{\"name\":\"Business Information Technology\",\"semesters\":2,\"years\":4,\"program_code\":\"BBIT\"},{\"name\":\"Procurement & Logistic Management\",\"semesters\":2,\"years\":4,\"program_code\":\"BPLM\"},{\"name\":\"Business Management & Information Technology\",\"semesters\":2,\"years\":4,\"program_code\":\"BMIT\"},{\"name\":\"Commerce\",\"semesters\":2,\"years\":4,\"program_code\":\"Comm\"},{\"name\":\"Economics & Mathematics\",\"semesters\":2,\"years\":4,\"program_code\":\"EM\"}]', '2022-06-28 02:53:30', '2022-06-28 02:53:30'),
(3, 'Department of Mathematics and Actuarial Science Programs - Sheet1.csv', 1, '[{\"name\":\"Bachelor of Science in Actuarial Science\",\"semesters\":2,\"years\":4,\"program_code\":\"AS\"},{\"name\":\"Bachelor of  Information Technology\",\"semesters\":2,\"years\":4,\"program_code\":\"IT\"},{\"name\":\"Bachelor of Science(Mathematics)\",\"semesters\":2,\"years\":4,\"program_code\":\"BscM\"},{\"name\":\"Bachelor of Science(Physics)\",\"semesters\":2,\"years\":4,\"program_code\":\"BscP\"},{\"name\":\"Bachelor of Science(Chemistry)\",\"semesters\":2,\"years\":4,\"program_code\":\"BscC\"}]', '2022-06-28 02:54:08', '2022-06-28 02:54:08'),
(4, 'DEPARTMENT OF COMMERCE-LIST OF UNITS ON OFFER _ MAY - AUG 2021 SEMESTER.csv', 1, '[{\"code\":\"DPBA 720  \",\"name\":\" Business consultancy \",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":1},{\"code\":\"DPAH 812 \",\"name\":\"Strategic HR Planning\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":1},{\"code\":\"DPAH 810\",\"name\":\"Advanced Theory and Practice in HRM  \",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":1},{\"code\":\"DPAH 811\",\"name\":\"Advanced Research Seminar in HRM   \",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":1},{\"code\":\"BIBL 722 \",\"name\":\" Christian Worldview and Philosophical Foundations \",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":1},{\"code\":\"DPAF 810\\/DPIF 711\",\"name\":\"Finance Theory\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":1},{\"code\":\"DPBA 721 \",\"name\":\"Econometrics\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":1},{\"code\":\"BMGT 500\",\"name\":\"Principles of Management in Biblical Perspective\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":2},{\"code\":\"HRMT 510\",\"name\":\"Human Resource Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":2},{\"code\":\"ACCT 510\\/MSOD 511\",\"name\":\"Financial Accounting\\/ Accounting and Financial Fundamentals\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":2},{\"code\":\"SMGT 520\",\"name\":\"Strategic Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":2},{\"code\":\"BMGT 510\",\"name\":\"Business Law and Ethics\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":2},{\"code\":\"FNCE 620\",\"name\":\"Financial Markets and Institutions\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":2},{\"code\":\"FNCE 623\",\"name\":\"Finance Seminar\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":2},{\"code\":\"FNCE 511\\/622\",\"name\":\"Corporate Financial Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":2},{\"code\":\"ACCT 520\",\"name\":\"Management Accounting\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":2},{\"code\":\"ACCT 511\",\"name\":\"Corporate Financial Reporting\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 510\",\"name\":\"Financial Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 621\",\"name\":\"Investment Analysis and Portfolio Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MKTG 510\",\"name\":\"Marketing Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 521\\/628\",\"name\":\"International Financial Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 522\",\"name\":\"Economic Development Finance\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"OMGT 510\",\"name\":\"Quantitative Techniques\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ECON 510\\/520\",\"name\":\"Managerial Economics\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 520\",\"name\":\"Financial Econometrics and Forecasting\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 520\",\"name\":\"Research Methods\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MPM 520\",\"name\":\"International Project Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MPM 522\",\"name\":\"Procurement Management and Control\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ENTRE 510\\/520\",\"name\":\"Entrepreneurship & Small Business Mgt\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MIST 520\",\"name\":\"Management Information Systems\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 626\",\"name\":\"Money and Banking\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MPM 521\",\"name\":\"Project Risk and Quality Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MSOD 520\",\"name\":\"Leading Organizational Change\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MSOD 510\",\"name\":\"Introduction to Organization Development\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 211\",\"name\":\"Introduction to Risk &Insurance\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 324\",\"name\":\"Financial Institutions & Markets\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 310\\/INTE 317\",\"name\":\"Organization Theory & Behavior\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DBM 220\",\"name\":\"Organizational Behavior\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ACCT 412\",\"name\":\"Auditing Practice and Investigation\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ACCT 421\",\"name\":\"Advanced Accounting II\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ACCT 411\",\"name\":\"Advanced Accounting I\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ACCT 310\",\"name\":\"Principles of Auditing\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ACCT 323\",\"name\":\"Managerial Accounting\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DPL221\\/DBM223\",\"name\":\"Managerial Accounting & Control\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ACCT 324\",\"name\":\"Taxation II\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 421\",\"name\":\"Business Ethics\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"HRMT 314\",\"name\":\"HR Training\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"HRMT 421\",\"name\":\"Safety and Operational Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"HRMT 415\",\"name\":\"Labour Laws\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 310\",\"name\":\"Corporate Finance\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ECON\\/FNCE 323\",\"name\":\"Public Finance\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 414\",\"name\":\"Mgt of Financial Institutions\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 324\",\"name\":\"Public Finance\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 213\",\"name\":\"Human Resources Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 214\\/BMGT 414\",\"name\":\"Business Entrepreneurship\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 123\",\"name\":\"Principles of Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 411\",\"name\":\"Research Proposal\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 422\",\"name\":\"Research Project\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 424\",\"name\":\"Real estate Finance and investment\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ACCT 211\",\"name\":\"Intermediate Accounting I\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ACCT 120\",\"name\":\"Foundations of Accounting II\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 325\",\"name\":\"E-Finance\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ACCT 325\",\"name\":\"E-Accounting\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 312\\/ACCT 313\",\"name\":\"Taxation I\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ACCT 422\",\"name\":\"International Accounting\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 323\",\"name\":\"Company Law\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 313\",\"name\":\"Business Law\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DPL 222\\/DBM\\/DBIT\\/DHRM\\/DSM 216\",\"name\":\"Introduction to Business Law\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 220\",\"name\":\"Business Finance\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 413\\/PLOG 413\\/BHM 420\",\"name\":\"Financial Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 423\",\"name\":\"Options and Future Market\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 220\\/ECON 222\",\"name\":\"Business Statistics II\\/Statistics for Economists II\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 321\\/BPLO 221\",\"name\":\"Quantitative Techniques\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DBM 222\\/DBIT 215\",\"name\":\"Quantitative Techniques\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 212\",\"name\":\"Management Mathematics II\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 322\",\"name\":\"Management Information System\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 121\",\"name\":\"Computer Programming for Business\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DPL\\/DBM 214\\/DIT 310\",\"name\":\"Entrepreneurship Skills\\/Entrepreneurship in IT\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 221\",\"name\":\"Business Communication\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DHRM 125\\/DPL121\",\"name\":\"Business Communications and writing skills\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DBM\\/DHRM\\/DPL\\/DPM\\/DBIT\\/DSM\\/DPM 123\",\"name\":\"Principles of Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MKTG 322\",\"name\":\"Marketing of Service\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 320\",\"name\":\"Research Methods\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 410\",\"name\":\"Operation Research\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MKTG 220\",\"name\":\"Principles of Marketing\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MKTG 313\\/MKTG 323\",\"name\":\"Digital Marketing\\/E-Marketing\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MKTG 428\",\"name\":\"Global Marketing\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BHM 424\",\"name\":\"International Marketing\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MKTG 410\",\"name\":\"Marketing Research\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MKTG 420\",\"name\":\"Sales Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 111\",\"name\":\"Introduction to Business\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 210\\/ECON 123\",\"name\":\"Business Statistics I\\/Statistics for Economists 1\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DPL\\/DBM\\/DBIT 210\",\"name\":\"Business Statistics\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 214\\/BMGT 414 (BBIT\\/BMIT\\/BPL\\/BSC F\\/INTE\\/CS\\/ES)\",\"name\":\"Business Entrepreneurship\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 123\",\"name\":\"Principles of Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MKTG 324\",\"name\":\"Brand Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MKTG 312\",\"name\":\"Consumer Behavior\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MKTG 321\",\"name\":\"Marketing Communication\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MKTG 421\",\"name\":\"Channel Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MKTG 310\",\"name\":\"Marketing Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DBM 215\\/DPL 220\\/DBIT222\\/DSM112\",\"name\":\"Principles of Marketing\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"MKTG 411\",\"name\":\"Business to Business Marketing\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 411\",\"name\":\"Research Proposal\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 422\",\"name\":\"Research Project\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DBM\\/DBA\\/DPL\\/DSM 226\",\"name\":\"Research Project\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DPL\\/DBM\\/DBIT 111\",\"name\":\"Introduction to Business\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DBM\\/DBIT 225\\/DPL 223\\/DHTM 216\\/DSM225\",\"name\":\"Research Methodology\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 420\",\"name\":\"Project Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"HRMT 411\",\"name\":\"Crisis and Change Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"HRMT 424\",\"name\":\"Group Dynamics\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"HRMT 324\",\"name\":\"Employee Sourcing & Maintenance\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMIS 425\\/HRMT 327\",\"name\":\"HR Information System MGT\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ACCT 221\",\"name\":\"Intermediate Accounting II\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 412\",\"name\":\"Security Valuation & Portfolio Selection\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 110\",\"name\":\"Principles of Finance\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DBF 124\",\"name\":\"Principles of Microfinance\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ACCT 423\",\"name\":\"Accounting for Public Agencies\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DMB\\/DBIT\\/DPL\\/DBA 110\",\"name\":\"Foundations of Accounting I\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 213\",\"name\":\"Human Resources Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"FNCE 425\",\"name\":\"International Finance\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DPL\\/DBF\\/DHRM\\/DPM\\/DBM\\/DBIT 120\",\"name\":\"Foundations of Accounting II\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DPL 211\\/DBM 211\",\"name\":\"Managing Risks in Supply Chain Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ACCT 314\",\"name\":\"Cost Accounting\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"ACCT 110\",\"name\":\"Foundations of Accounting 1\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 211\",\"name\":\"Introduction to Risk &Insurance\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 426\",\"name\":\"Cooperative Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DBM 224\\/DBIT 220\",\"name\":\"Business Finance\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"BMGT 413\",\"name\":\"Strategic Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DHRM 223\",\"name\":\"Industrial Relations and Labour Laws\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DHRM 222\",\"name\":\"Organizational Change & Culture Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DHRM 213\",\"name\":\"Human Resource Development\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DPL\\/DBM\\/DBIT\\/DHTM 213\\/DHRM 124\",\"name\":\"Human Resource Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DHRM 212\",\"name\":\"Employee Resourcing\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DHRM 221\",\"name\":\"HRIS and Payroll management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3},{\"code\":\"DHRM 215\",\"name\":\"Strategic Human Resource Management\",\"lecture_hours\":30,\"lab_hours\":20,\"lab_type_id\":3}]', '2022-06-28 02:54:52', '2022-06-28 02:54:52');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_ID` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `school_ID`, `created_at`, `updated_at`) VALUES
(1, 'computer science', '1', '2022-06-28 02:44:22', '2022-06-28 02:44:22'),
(2, 'Nursing and Pharmacology', '2', '2022-06-28 02:52:45', '2022-06-28 02:52:45'),
(3, 'Martial Law', '3', '2022-06-28 02:53:02', '2022-06-28 02:53:02');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'redis', 'default', '{\"type\":\"broadcast\",\"timeout\":null,\"tags\":[\"Timetabler\\\\Session:72\"],\"id\":\"834\",\"data\":{\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":7:{s:5:\\\"event\\\";O:30:\\\"Timetabler\\\\Events\\\\SessionSaved\\\":2:{s:7:\\\"session\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"Timetabler\\\\Session\\\";s:2:\\\"id\\\";i:72;s:9:\\\"relations\\\";a:4:{i:0;s:6:\\\"period\\\";i:1;s:10:\\\"period.day\\\";i:2;s:4:\\\"unit\\\";i:3;s:4:\\\"room\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\"},\"displayName\":\"Timetabler\\\\Events\\\\SessionSaved\",\"timeoutAt\":null,\"pushedAt\":\"1654509011.368\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"attempts\":1}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [Timetabler\\Session]. in C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:454\nStack trace:\n#0 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): Timetabler\\Events\\SessionSaved->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(45): Timetabler\\Events\\SessionSaved->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: Timetabler\\Events\\SessionSaved->__wakeup()\n#4 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(42): unserialize(\'O:38:\"Illuminat...\')\n#5 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#6 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(337): Illuminate\\Queue\\Jobs\\Job->fire()\n#7 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(283): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#8 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(118): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#9 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(102): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(86): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#11 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#12 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#13 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(576): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call(Array)\n#17 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#18 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(1009): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(273): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(90): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(133): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 {main}', '2022-06-28 03:09:45'),
(2, 'redis', 'default', '{\"type\":\"broadcast\",\"timeout\":null,\"tags\":[\"Timetabler\\\\Session:69\"],\"id\":\"835\",\"data\":{\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":7:{s:5:\\\"event\\\";O:30:\\\"Timetabler\\\\Events\\\\SessionSaved\\\":2:{s:7:\\\"session\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"Timetabler\\\\Session\\\";s:2:\\\"id\\\";i:69;s:9:\\\"relations\\\";a:4:{i:0;s:6:\\\"period\\\";i:1;s:10:\\\"period.day\\\";i:2;s:4:\\\"unit\\\";i:3;s:4:\\\"room\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\"},\"displayName\":\"Timetabler\\\\Events\\\\SessionSaved\",\"timeoutAt\":null,\"pushedAt\":\"1654509011.38\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"attempts\":1}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [Timetabler\\Session]. in C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:454\nStack trace:\n#0 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): Timetabler\\Events\\SessionSaved->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(45): Timetabler\\Events\\SessionSaved->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: Timetabler\\Events\\SessionSaved->__wakeup()\n#4 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(42): unserialize(\'O:38:\"Illuminat...\')\n#5 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#6 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(337): Illuminate\\Queue\\Jobs\\Job->fire()\n#7 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(283): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#8 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(118): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#9 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(102): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(86): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#11 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#12 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#13 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(576): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call(Array)\n#17 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#18 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(1009): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(273): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(90): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(133): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 {main}', '2022-06-28 03:09:45'),
(3, 'redis', 'default', '{\"type\":\"broadcast\",\"timeout\":null,\"tags\":[\"Timetabler\\\\Session:66\"],\"id\":\"836\",\"data\":{\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":7:{s:5:\\\"event\\\";O:30:\\\"Timetabler\\\\Events\\\\SessionSaved\\\":2:{s:7:\\\"session\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"Timetabler\\\\Session\\\";s:2:\\\"id\\\";i:66;s:9:\\\"relations\\\";a:4:{i:0;s:6:\\\"period\\\";i:1;s:10:\\\"period.day\\\";i:2;s:4:\\\"unit\\\";i:3;s:4:\\\"room\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\"},\"displayName\":\"Timetabler\\\\Events\\\\SessionSaved\",\"timeoutAt\":null,\"pushedAt\":\"1654509011.3925\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"attempts\":1}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [Timetabler\\Session]. in C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:454\nStack trace:\n#0 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): Timetabler\\Events\\SessionSaved->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(45): Timetabler\\Events\\SessionSaved->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: Timetabler\\Events\\SessionSaved->__wakeup()\n#4 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(42): unserialize(\'O:38:\"Illuminat...\')\n#5 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#6 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(337): Illuminate\\Queue\\Jobs\\Job->fire()\n#7 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(283): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#8 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(118): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#9 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(102): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(86): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#11 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#12 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#13 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(576): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call(Array)\n#17 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#18 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(1009): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(273): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(90): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(133): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 {main}', '2022-06-28 03:09:45'),
(4, 'redis', 'default', '{\"type\":\"broadcast\",\"timeout\":null,\"tags\":[\"Timetabler\\\\Session:63\"],\"id\":\"837\",\"data\":{\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":7:{s:5:\\\"event\\\";O:30:\\\"Timetabler\\\\Events\\\\SessionSaved\\\":2:{s:7:\\\"session\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"Timetabler\\\\Session\\\";s:2:\\\"id\\\";i:63;s:9:\\\"relations\\\";a:4:{i:0;s:6:\\\"period\\\";i:1;s:10:\\\"period.day\\\";i:2;s:4:\\\"unit\\\";i:3;s:4:\\\"room\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\"},\"displayName\":\"Timetabler\\\\Events\\\\SessionSaved\",\"timeoutAt\":null,\"pushedAt\":\"1654509011.4086\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"attempts\":1}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [Timetabler\\Session]. in C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:454\nStack trace:\n#0 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): Timetabler\\Events\\SessionSaved->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(45): Timetabler\\Events\\SessionSaved->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: Timetabler\\Events\\SessionSaved->__wakeup()\n#4 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(42): unserialize(\'O:38:\"Illuminat...\')\n#5 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#6 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(337): Illuminate\\Queue\\Jobs\\Job->fire()\n#7 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(283): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#8 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(118): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#9 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(102): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(86): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#11 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#12 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#13 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(576): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call(Array)\n#17 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#18 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(1009): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(273): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(90): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(133): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 {main}', '2022-06-28 03:09:45'),
(5, 'redis', 'default', '{\"type\":\"broadcast\",\"timeout\":null,\"tags\":[\"Timetabler\\\\Session:60\"],\"id\":\"838\",\"data\":{\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":7:{s:5:\\\"event\\\";O:30:\\\"Timetabler\\\\Events\\\\SessionSaved\\\":2:{s:7:\\\"session\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"Timetabler\\\\Session\\\";s:2:\\\"id\\\";i:60;s:9:\\\"relations\\\";a:4:{i:0;s:6:\\\"period\\\";i:1;s:10:\\\"period.day\\\";i:2;s:4:\\\"unit\\\";i:3;s:4:\\\"room\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\"},\"displayName\":\"Timetabler\\\\Events\\\\SessionSaved\",\"timeoutAt\":null,\"pushedAt\":\"1654509011.4235\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"attempts\":1}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [Timetabler\\Session]. in C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:454\nStack trace:\n#0 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): Timetabler\\Events\\SessionSaved->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(45): Timetabler\\Events\\SessionSaved->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: Timetabler\\Events\\SessionSaved->__wakeup()\n#4 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(42): unserialize(\'O:38:\"Illuminat...\')\n#5 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#6 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(337): Illuminate\\Queue\\Jobs\\Job->fire()\n#7 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(283): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#8 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(118): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#9 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(102): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(86): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#11 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#12 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#13 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(576): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call(Array)\n#17 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#18 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(1009): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(273): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(90): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(133): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 {main}', '2022-06-28 03:09:45'),
(6, 'redis', 'default', '{\"type\":\"broadcast\",\"timeout\":null,\"tags\":[\"Timetabler\\\\Session:59\"],\"id\":\"839\",\"data\":{\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":7:{s:5:\\\"event\\\";O:30:\\\"Timetabler\\\\Events\\\\SessionSaved\\\":2:{s:7:\\\"session\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"Timetabler\\\\Session\\\";s:2:\\\"id\\\";i:59;s:9:\\\"relations\\\";a:4:{i:0;s:6:\\\"period\\\";i:1;s:10:\\\"period.day\\\";i:2;s:4:\\\"unit\\\";i:3;s:4:\\\"room\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\"},\"displayName\":\"Timetabler\\\\Events\\\\SessionSaved\",\"timeoutAt\":null,\"pushedAt\":\"1654509011.4395\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"attempts\":1}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [Timetabler\\Session]. in C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:454\nStack trace:\n#0 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): Timetabler\\Events\\SessionSaved->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(45): Timetabler\\Events\\SessionSaved->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: Timetabler\\Events\\SessionSaved->__wakeup()\n#4 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(42): unserialize(\'O:38:\"Illuminat...\')\n#5 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#6 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(337): Illuminate\\Queue\\Jobs\\Job->fire()\n#7 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(283): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#8 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(118): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#9 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(102): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(86): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#11 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#12 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#13 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(576): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call(Array)\n#17 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#18 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(1009): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(273): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(90): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(133): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 {main}', '2022-06-28 03:09:45'),
(7, 'redis', 'default', '{\"type\":\"broadcast\",\"timeout\":null,\"tags\":[\"Timetabler\\\\Session:71\"],\"id\":\"840\",\"data\":{\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":7:{s:5:\\\"event\\\";O:30:\\\"Timetabler\\\\Events\\\\SessionSaved\\\":2:{s:7:\\\"session\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"Timetabler\\\\Session\\\";s:2:\\\"id\\\";i:71;s:9:\\\"relations\\\";a:4:{i:0;s:6:\\\"period\\\";i:1;s:10:\\\"period.day\\\";i:2;s:4:\\\"unit\\\";i:3;s:4:\\\"room\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\"},\"displayName\":\"Timetabler\\\\Events\\\\SessionSaved\",\"timeoutAt\":null,\"pushedAt\":\"1654509011.4542\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"attempts\":1}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [Timetabler\\Session]. in C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:454\nStack trace:\n#0 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): Timetabler\\Events\\SessionSaved->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(45): Timetabler\\Events\\SessionSaved->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: Timetabler\\Events\\SessionSaved->__wakeup()\n#4 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(42): unserialize(\'O:38:\"Illuminat...\')\n#5 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#6 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(337): Illuminate\\Queue\\Jobs\\Job->fire()\n#7 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(283): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#8 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(118): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#9 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(102): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(86): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#11 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#12 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#13 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(576): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call(Array)\n#17 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#18 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(1009): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(273): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(90): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(133): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 {main}', '2022-06-28 03:09:45');
INSERT INTO `failed_jobs` (`id`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(8, 'redis', 'default', '{\"type\":\"broadcast\",\"timeout\":null,\"tags\":[\"Timetabler\\\\Session:68\"],\"id\":\"841\",\"data\":{\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":7:{s:5:\\\"event\\\";O:30:\\\"Timetabler\\\\Events\\\\SessionSaved\\\":2:{s:7:\\\"session\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"Timetabler\\\\Session\\\";s:2:\\\"id\\\";i:68;s:9:\\\"relations\\\";a:4:{i:0;s:6:\\\"period\\\";i:1;s:10:\\\"period.day\\\";i:2;s:4:\\\"unit\\\";i:3;s:4:\\\"room\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\"},\"displayName\":\"Timetabler\\\\Events\\\\SessionSaved\",\"timeoutAt\":null,\"pushedAt\":\"1654509011.4703\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"attempts\":1}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [Timetabler\\Session]. in C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:454\nStack trace:\n#0 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): Timetabler\\Events\\SessionSaved->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(45): Timetabler\\Events\\SessionSaved->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: Timetabler\\Events\\SessionSaved->__wakeup()\n#4 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(42): unserialize(\'O:38:\"Illuminat...\')\n#5 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#6 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(337): Illuminate\\Queue\\Jobs\\Job->fire()\n#7 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(283): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#8 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(118): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#9 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(102): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(86): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#11 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#12 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#13 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(576): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call(Array)\n#17 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#18 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(1009): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(273): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(90): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(133): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 {main}', '2022-06-28 03:09:45'),
(9, 'redis', 'default', '{\"type\":\"broadcast\",\"timeout\":null,\"tags\":[\"Timetabler\\\\Session:62\"],\"id\":\"842\",\"data\":{\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":7:{s:5:\\\"event\\\";O:30:\\\"Timetabler\\\\Events\\\\SessionSaved\\\":2:{s:7:\\\"session\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"Timetabler\\\\Session\\\";s:2:\\\"id\\\";i:62;s:9:\\\"relations\\\";a:4:{i:0;s:6:\\\"period\\\";i:1;s:10:\\\"period.day\\\";i:2;s:4:\\\"unit\\\";i:3;s:4:\\\"room\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\"},\"displayName\":\"Timetabler\\\\Events\\\\SessionSaved\",\"timeoutAt\":null,\"pushedAt\":\"1654509011.4848\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"attempts\":1}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [Timetabler\\Session]. in C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:454\nStack trace:\n#0 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): Timetabler\\Events\\SessionSaved->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(45): Timetabler\\Events\\SessionSaved->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: Timetabler\\Events\\SessionSaved->__wakeup()\n#4 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(42): unserialize(\'O:38:\"Illuminat...\')\n#5 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#6 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(337): Illuminate\\Queue\\Jobs\\Job->fire()\n#7 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(283): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#8 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(118): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#9 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(102): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(86): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#11 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#12 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#13 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(576): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call(Array)\n#17 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#18 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(1009): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(273): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(90): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(133): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 {main}', '2022-06-28 03:09:45'),
(10, 'redis', 'default', '{\"type\":\"broadcast\",\"timeout\":null,\"tags\":[\"Timetabler\\\\Session:65\"],\"id\":\"843\",\"data\":{\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":7:{s:5:\\\"event\\\";O:30:\\\"Timetabler\\\\Events\\\\SessionSaved\\\":2:{s:7:\\\"session\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:18:\\\"Timetabler\\\\Session\\\";s:2:\\\"id\\\";i:65;s:9:\\\"relations\\\";a:4:{i:0;s:6:\\\"period\\\";i:1;s:10:\\\"period.day\\\";i:2;s:4:\\\"unit\\\";i:3;s:4:\\\"room\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\"},\"displayName\":\"Timetabler\\\\Events\\\\SessionSaved\",\"timeoutAt\":null,\"pushedAt\":\"1654509011.5019\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"attempts\":1}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [Timetabler\\Session]. in C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:454\nStack trace:\n#0 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesAndRestoresModelIdentifiers.php(57): Timetabler\\Events\\SessionSaved->restoreModel(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#2 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\SerializesModels.php(45): Timetabler\\Events\\SessionSaved->getRestoredPropertyValue(Object(Illuminate\\Contracts\\Database\\ModelIdentifier))\n#3 [internal function]: Timetabler\\Events\\SessionSaved->__wakeup()\n#4 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(42): unserialize(\'O:38:\"Illuminat...\')\n#5 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(88): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#6 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(337): Illuminate\\Queue\\Jobs\\Job->fire()\n#7 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(283): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#8 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(118): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#9 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(102): Illuminate\\Queue\\Worker->daemon(\'redis\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#10 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(86): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'default\')\n#11 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#12 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(32): call_user_func_array(Array, Array)\n#13 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(90): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(34): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(576): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(183): Illuminate\\Container\\Container->call(Array)\n#17 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#18 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(170): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#19 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(1009): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(273): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#21 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#22 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(90): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#23 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(133): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#24 C:\\Users\\user\\workspace\\timetabling\\timetabling-1\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#25 {main}', '2022-06-28 03:09:45');

-- --------------------------------------------------------

--
-- Table structure for table `generated_documents`
--

CREATE TABLE `generated_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `program_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `h_o_d_s`
--

CREATE TABLE `h_o_d_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lecturer_ID` int(10) UNSIGNED DEFAULT NULL,
  `deparment_ID` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lab_types`
--

CREATE TABLE `lab_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lab_types`
--

INSERT INTO `lab_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Physics Lab 1', '2022-06-28 02:47:53', '2022-06-28 02:47:53'),
(2, 'Comp Lab 1', '2022-06-28 02:48:05', '2022-06-28 02:48:05'),
(3, 'Comp Lab 2', '2022-06-28 02:48:19', '2022-06-28 02:48:19');

-- --------------------------------------------------------

--
-- Table structure for table `lectures`
--

CREATE TABLE `lectures` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deparment_ID` int(10) UNSIGNED DEFAULT NULL,
  `is_HOD` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lectures`
--

INSERT INTO `lectures` (`id`, `first_name`, `last_name`, `deparment_ID`, `is_HOD`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Andrew', 'Mwaura', 1, '0', 'injuguna@kabarak.ac.ke', NULL, '$2y$10$p2DPiYTt/ygWbxIhDanXn.L4Fw7xrDHDqFoCyl4TIG3c.hrfLi5qG', NULL, '2022-06-28 02:44:22', '2022-06-28 02:44:22'),
(2, 'Moses', 'Karanja', 1, '0', 'lecturer@mail.com', NULL, '$2y$10$0j1VkgoK2OwUi2UKvdHA5Orwpa0vbv1EzIqpofJBRHIbOVXezfrDO', NULL, '2022-06-28 02:44:22', '2022-06-28 02:44:22');

-- --------------------------------------------------------

--
-- Table structure for table `levels_units_pivot`
--

CREATE TABLE `levels_units_pivot` (
  `id` int(10) UNSIGNED NOT NULL,
  `unit_id` int(10) UNSIGNED NOT NULL,
  `level_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels_units_pivot`
--

INSERT INTO `levels_units_pivot` (`id`, `unit_id`, `level_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 2, NULL, NULL),
(8, 8, 2, NULL, NULL),
(9, 9, 2, NULL, NULL),
(10, 10, 2, NULL, NULL),
(11, 11, 2, NULL, NULL),
(12, 12, 2, NULL, NULL),
(13, 13, 2, NULL, NULL),
(14, 14, 3, NULL, NULL),
(15, 15, 3, NULL, NULL),
(16, 16, 3, NULL, NULL),
(17, 17, 3, NULL, NULL),
(18, 18, 3, NULL, NULL),
(19, 19, 3, NULL, NULL),
(20, 22, 4, NULL, NULL),
(21, 23, 4, NULL, NULL),
(22, 24, 4, NULL, NULL),
(23, 25, 4, NULL, NULL),
(24, 26, 4, NULL, NULL),
(25, 27, 4, NULL, NULL),
(26, 28, 4, NULL, NULL),
(27, 29, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `location`, `created_at`, `updated_at`) VALUES
(1, 'Dome Tent', '2022-06-28 02:47:09', '2022-06-28 02:47:09'),
(2, 'School of Law', '2022-06-28 02:47:19', '2022-06-28 02:47:19'),
(3, 'Schoool of Bussiness.', '2022-06-28 02:47:34', '2022-06-28 02:47:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2017_10_09_123029_create_csv_data_table', 1),
(7, '2019_03_04_155934_create_departments_table', 1),
(8, '2019_03_04_155935_create_programs_table', 1),
(9, '2019_03_04_161550_create_table_lab_types', 1),
(10, '2019_03_04_164137_create_table_prgram_levels', 1),
(11, '2019_03_04_164436_create_table_units', 1),
(12, '2019_03_04_165954_modify_table_program_levels', 1),
(13, '2019_03_04_171757_create_levels_units_pivot', 1),
(14, '2019_03_04_172707_create_table_rooms', 1),
(15, '2019_03_04_173412_create_table_locations', 1),
(16, '2019_03_04_173721_modify_table_rooms', 1),
(17, '2019_03_04_175632_create_table_users', 1),
(18, '2019_03_05_202457_modify_table_units', 1),
(19, '2019_03_08_132149_update_table_program_levels', 1),
(20, '2019_03_27_083628_create_table_sessions', 1),
(21, '2019_03_31_142553_create_table_timetable', 1),
(22, '2019_03_31_142705_create_table_timetable_days', 1),
(23, '2019_03_31_142735_create_table_periods', 1),
(24, '2019_04_07_174605_modify_table_periods', 1),
(25, '2019_04_19_094154_create_failed_jobs_table', 1),
(26, '2019_04_22_202252_update_table_timetables', 1),
(27, '2019_05_21_153543_modify_units_table', 1),
(28, '2019_06_10_133437_modify_programs_table', 1),
(29, '2019_06_24_110403_create_table_schools', 1),
(30, '2019_06_24_110518_modify_table_programs', 1),
(31, '2019_06_24_145536_create_school_location_pivot', 1),
(32, '2019_07_10_120327_create_table_generated_documents', 1),
(33, '2019_07_30_211021_create_permission_tables', 1),
(34, '2021_10_12_151744_create_lectures_table', 1),
(35, '2021_10_12_151758_create_h_o_d_s_table', 1),
(36, '2022_04_04_004648_create_access_tokens_table', 1),
(37, '2022_04_05_050117_create_time_table_periods_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'Timetabler\\User', 1),
(2, 'Timetabler\\User', 2),
(2, 'Timetabler\\User', 3),
(2, 'Timetabler\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `periods`
--

CREATE TABLE `periods` (
  `id` int(10) UNSIGNED NOT NULL,
  `day_id` int(10) UNSIGNED NOT NULL,
  `time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `periods`
--

INSERT INTO `periods` (`id`, `day_id`, `time`, `created_at`, `updated_at`) VALUES
(1, 1, '07:00 - 10:00', '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(2, 1, '10:00 - 13:00', '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(3, 1, '13:00 - 16:00', '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(4, 1, '16:00 - 19:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(5, 2, '07:00 - 10:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(6, 2, '10:00 - 13:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(7, 2, '13:00 - 16:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(8, 2, '16:00 - 19:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(9, 3, '07:00 - 10:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(10, 3, '10:00 - 13:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(11, 3, '13:00 - 16:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(12, 3, '16:00 - 19:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(13, 4, '07:00 - 10:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(14, 4, '10:00 - 13:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(15, 4, '13:00 - 16:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(16, 4, '16:00 - 19:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(17, 5, '07:00 - 10:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(18, 5, '10:00 - 13:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(19, 5, '13:00 - 16:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(20, 5, '16:00 - 19:00', '2022-06-28 09:35:49', '2022-06-28 09:35:49');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view', 'user', '2022-06-28 02:44:21', '2022-06-28 02:44:21'),
(2, 'edit', 'user', '2022-06-28 02:44:21', '2022-06-28 02:44:21'),
(3, 'add-users', 'user', '2022-06-28 02:44:21', '2022-06-28 02:44:21'),
(4, 'delete-users', 'user', '2022-06-28 02:44:21', '2022-06-28 02:44:21'),
(5, 'generate-timetable', 'user', '2022-06-28 02:44:21', '2022-06-28 02:44:21'),
(6, 'assign-lecturers', 'user', '2022-06-28 02:44:21', '2022-06-28 02:44:21');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semesters` int(11) NOT NULL,
  `years` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `program_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` int(10) UNSIGNED NOT NULL,
  `deparment_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `name`, `semesters`, `years`, `created_at`, `updated_at`, `program_code`, `school_id`, `deparment_ID`) VALUES
(1, 'Bachelor of Science in Environmental Science', 2, 4, '2022-06-28 02:50:34', '2022-06-28 02:50:34', 'ES', 1, 1),
(2, 'Bachelor of Science in Botany', 2, 4, '2022-06-28 02:50:34', '2022-06-28 02:50:34', 'BscB', 1, 1),
(3, 'Bachelor of Science in Zoology', 2, 4, '2022-06-28 02:50:34', '2022-06-28 02:50:34', 'BscZ', 1, 1),
(4, 'Certificate in Environmental Impact Assessment', 2, 1, '2022-06-28 02:50:34', '2022-06-28 02:50:34', 'CEIA', 1, 1),
(5, 'Business Information Technology', 2, 4, '2022-06-28 02:53:30', '2022-06-28 02:53:30', 'BBIT', 2, 2),
(6, 'Procurement & Logistic Management', 2, 4, '2022-06-28 02:53:30', '2022-06-28 02:53:30', 'BPLM', 2, 2),
(7, 'Business Management & Information Technology', 2, 4, '2022-06-28 02:53:30', '2022-06-28 02:53:30', 'BMIT', 2, 2),
(8, 'Commerce', 2, 4, '2022-06-28 02:53:30', '2022-06-28 02:53:30', 'Comm', 2, 2),
(9, 'Economics & Mathematics', 2, 4, '2022-06-28 02:53:30', '2022-06-28 02:53:30', 'EM', 2, 2),
(10, 'Bachelor of Science in Actuarial Science', 2, 4, '2022-06-28 02:54:08', '2022-06-28 02:54:08', 'AS', 3, 3),
(11, 'Bachelor of  Information Technology', 2, 4, '2022-06-28 02:54:08', '2022-06-28 02:54:08', 'IT', 3, 3),
(12, 'Bachelor of Science(Mathematics)', 2, 4, '2022-06-28 02:54:08', '2022-06-28 02:54:08', 'BscM', 3, 3),
(13, 'Bachelor of Science(Physics)', 2, 4, '2022-06-28 02:54:08', '2022-06-28 02:54:08', 'BscP', 3, 3),
(14, 'Bachelor of Science(Chemistry)', 2, 4, '2022-06-28 02:54:08', '2022-06-28 02:54:08', 'BscC', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `program_levels`
--

CREATE TABLE `program_levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `program_id` int(10) UNSIGNED NOT NULL,
  `department_ID` int(10) UNSIGNED DEFAULT NULL,
  `semester_number` int(11) NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `num_students` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `in_session` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_levels`
--

INSERT INTO `program_levels` (`id`, `program_id`, `department_ID`, `semester_number`, `level`, `created_at`, `updated_at`, `num_students`, `in_session`) VALUES
(1, 1, NULL, 1, 'Year 1 Semester 1', '2022-06-28 02:50:34', '2022-06-28 03:01:07', 120, 1),
(2, 1, NULL, 2, 'Year 1 Semester 2', '2022-06-28 02:50:34', '2022-06-28 03:01:16', 234, 1),
(3, 1, NULL, 3, 'Year 2 Semester 1', '2022-06-28 02:50:34', '2022-06-28 03:01:20', 45, 1),
(4, 1, NULL, 4, 'Year 2 Semester 2', '2022-06-28 02:50:34', '2022-06-28 03:01:23', 43, 1),
(5, 1, NULL, 5, 'Year 3 Semester 1', '2022-06-28 02:50:34', '2022-06-28 03:01:26', 80, 1),
(6, 1, NULL, 6, 'Year 3 Semester 2', '2022-06-28 02:50:34', '2022-06-28 03:01:29', 80, 1),
(7, 1, NULL, 7, 'Year 4 Semester 1', '2022-06-28 02:50:34', '2022-06-28 03:01:31', 67, 1),
(8, 1, NULL, 8, 'Year 4 Semester 2', '2022-06-28 02:50:34', '2022-06-28 03:01:33', 56, 1),
(9, 2, NULL, 1, 'Year 1 Semester 1', '2022-06-28 02:50:34', '2022-06-28 03:01:35', 45, 1),
(10, 2, NULL, 2, 'Year 1 Semester 2', '2022-06-28 02:50:34', '2022-06-28 03:01:39', 24, 1),
(11, 2, NULL, 3, 'Year 2 Semester 1', '2022-06-28 02:50:34', '2022-06-28 03:01:42', 56, 1),
(12, 2, NULL, 4, 'Year 2 Semester 2', '2022-06-28 02:50:34', '2022-06-28 03:01:44', 67, 1),
(13, 2, NULL, 5, 'Year 3 Semester 1', '2022-06-28 02:50:34', '2022-06-28 03:01:46', 89, 1),
(14, 2, NULL, 6, 'Year 3 Semester 2', '2022-06-28 02:50:34', '2022-06-28 03:01:48', 67, 1),
(15, 2, NULL, 7, 'Year 4 Semester 1', '2022-06-28 02:50:34', '2022-06-28 03:01:51', 87, 1),
(16, 2, NULL, 8, 'Year 4 Semester 2', '2022-06-28 02:50:34', '2022-06-28 03:01:52', 67, 1),
(17, 3, NULL, 1, 'Year 1 Semester 1', '2022-06-28 02:50:34', '2022-06-28 03:01:54', 67, 1),
(18, 3, NULL, 2, 'Year 1 Semester 2', '2022-06-28 02:50:34', '2022-06-28 03:01:55', 56, 1),
(19, 3, NULL, 3, 'Year 2 Semester 1', '2022-06-28 02:50:34', '2022-06-28 03:01:57', 45, 1),
(20, 3, NULL, 4, 'Year 2 Semester 2', '2022-06-28 02:50:34', '2022-06-28 03:01:59', 76, 1),
(21, 3, NULL, 5, 'Year 3 Semester 1', '2022-06-28 02:50:34', '2022-06-28 03:02:01', 67, 1),
(22, 3, NULL, 6, 'Year 3 Semester 2', '2022-06-28 02:50:34', '2022-06-28 03:02:03', 67, 1),
(23, 3, NULL, 7, 'Year 4 Semester 1', '2022-06-28 02:50:34', '2022-06-28 03:02:05', 78, 1),
(24, 3, NULL, 8, 'Year 4 Semester 2', '2022-06-28 02:50:34', '2022-06-28 03:02:07', 56, 1),
(25, 4, NULL, 1, 'Year 1 Semester 1', '2022-06-28 02:50:34', '2022-06-28 03:02:09', 45, 1),
(26, 4, NULL, 2, 'Year 1 Semester 2', '2022-06-28 02:50:34', '2022-06-28 03:02:12', 45, 1),
(27, 5, NULL, 1, 'Year 1 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:02:14', 56, 1),
(28, 5, NULL, 2, 'Year 1 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:02:16', 67, 1),
(29, 5, NULL, 3, 'Year 2 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:02:18', 67, 1),
(30, 5, NULL, 4, 'Year 2 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:02:19', 56, 1),
(31, 5, NULL, 5, 'Year 3 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:02:21', 56, 1),
(32, 5, NULL, 6, 'Year 3 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:02:23', 76, 1),
(33, 5, NULL, 7, 'Year 4 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:02:24', 76, 1),
(34, 5, NULL, 8, 'Year 4 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:02:27', 56, 1),
(35, 6, NULL, 1, 'Year 1 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:02:29', 67, 1),
(36, 6, NULL, 2, 'Year 1 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:02:30', 67, 1),
(37, 6, NULL, 3, 'Year 2 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:02:32', 78, 1),
(38, 6, NULL, 4, 'Year 2 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:02:33', 45, 1),
(39, 6, NULL, 5, 'Year 3 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:02:35', 56, 1),
(40, 6, NULL, 6, 'Year 3 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:02:37', 45, 1),
(41, 6, NULL, 7, 'Year 4 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:02:39', 45, 1),
(42, 6, NULL, 8, 'Year 4 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:02:41', 34, 1),
(43, 7, NULL, 1, 'Year 1 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:02:43', 45, 1),
(44, 7, NULL, 2, 'Year 1 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:02:44', 67, 1),
(45, 7, NULL, 3, 'Year 2 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:02:47', 45, 1),
(46, 7, NULL, 4, 'Year 2 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:02:48', 45, 1),
(47, 7, NULL, 5, 'Year 3 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:02:50', 34, 1),
(48, 7, NULL, 6, 'Year 3 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:02:52', 34, 1),
(49, 7, NULL, 7, 'Year 4 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:02:53', 65, 1),
(50, 7, NULL, 8, 'Year 4 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:02:55', 45, 1),
(51, 8, NULL, 1, 'Year 1 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:02:56', 54, 1),
(52, 8, NULL, 2, 'Year 1 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:02:59', 43, 1),
(53, 8, NULL, 3, 'Year 2 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:03:00', 34, 1),
(54, 8, NULL, 4, 'Year 2 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:03:05', 34, 1),
(55, 8, NULL, 5, 'Year 3 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:03:07', 75, 1),
(56, 8, NULL, 6, 'Year 3 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:03:08', 56, 1),
(57, 8, NULL, 7, 'Year 4 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:03:10', 345, 1),
(58, 8, NULL, 8, 'Year 4 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:03:10', 46, 1),
(59, 9, NULL, 1, 'Year 1 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:03:12', 56, 1),
(60, 9, NULL, 2, 'Year 1 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:03:13', 45, 1),
(61, 9, NULL, 3, 'Year 2 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:03:13', 65, 1),
(62, 9, NULL, 4, 'Year 2 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:03:15', 54, 1),
(63, 9, NULL, 5, 'Year 3 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:03:16', 54, 1),
(64, 9, NULL, 6, 'Year 3 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:03:18', 62, 1),
(65, 9, NULL, 7, 'Year 4 Semester 1', '2022-06-28 02:53:30', '2022-06-28 03:03:19', 35, 1),
(66, 9, NULL, 8, 'Year 4 Semester 2', '2022-06-28 02:53:30', '2022-06-28 03:03:21', 35, 1),
(67, 10, NULL, 1, 'Year 1 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:03:21', 35, 1),
(68, 10, NULL, 2, 'Year 1 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:03:23', 54, 1),
(69, 10, NULL, 3, 'Year 2 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:03:24', 45, 1),
(70, 10, NULL, 4, 'Year 2 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:03:28', 55, 1),
(71, 10, NULL, 5, 'Year 3 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:03:29', 54, 1),
(72, 10, NULL, 6, 'Year 3 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:03:33', 56, 1),
(73, 10, NULL, 7, 'Year 4 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:03:30', 65, 1),
(74, 10, NULL, 8, 'Year 4 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:03:31', 45, 1),
(75, 11, NULL, 1, 'Year 1 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:03:35', 45, 1),
(76, 11, NULL, 2, 'Year 1 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:03:34', 54, 1),
(77, 11, NULL, 3, 'Year 2 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:03:36', 54, 1),
(78, 11, NULL, 4, 'Year 2 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:03:37', 45, 1),
(79, 11, NULL, 5, 'Year 3 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:03:39', 54, 1),
(80, 11, NULL, 6, 'Year 3 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:03:41', 44, 1),
(81, 11, NULL, 7, 'Year 4 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:03:41', 34, 1),
(82, 11, NULL, 8, 'Year 4 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:03:43', 45, 1),
(83, 12, NULL, 1, 'Year 1 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:03:44', 43, 1),
(84, 12, NULL, 2, 'Year 1 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:03:45', 45, 1),
(85, 12, NULL, 3, 'Year 2 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:03:46', 54, 1),
(86, 12, NULL, 4, 'Year 2 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:03:47', 54, 1),
(87, 12, NULL, 5, 'Year 3 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:03:49', 35, 1),
(88, 12, NULL, 6, 'Year 3 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:03:50', 350, 1),
(89, 12, NULL, 7, 'Year 4 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:03:53', 45, 1),
(90, 12, NULL, 8, 'Year 4 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:03:54', 45, 1),
(91, 13, NULL, 1, 'Year 1 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:03:55', 54, 1),
(92, 13, NULL, 2, 'Year 1 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:03:56', 54, 1),
(93, 13, NULL, 3, 'Year 2 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:03:58', 54, 1),
(94, 13, NULL, 4, 'Year 2 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:03:59', 65, 1),
(95, 13, NULL, 5, 'Year 3 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:04:01', 65, 1),
(96, 13, NULL, 6, 'Year 3 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:04:02', 98, 1),
(97, 13, NULL, 7, 'Year 4 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:04:03', 78, 1),
(98, 13, NULL, 8, 'Year 4 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:04:05', 76, 1),
(99, 14, NULL, 1, 'Year 1 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:04:06', 76, 1),
(100, 14, NULL, 2, 'Year 1 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:04:07', 67, 1),
(101, 14, NULL, 3, 'Year 2 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:04:09', 65, 1),
(102, 14, NULL, 4, 'Year 2 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:04:10', 54, 1),
(103, 14, NULL, 5, 'Year 3 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:04:11', 54, 1),
(104, 14, NULL, 6, 'Year 3 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:04:12', 45, 1),
(105, 14, NULL, 7, 'Year 4 Semester 1', '2022-06-28 02:54:08', '2022-06-28 03:04:13', 34, 1),
(106, 14, NULL, 8, 'Year 4 Semester 2', '2022-06-28 02:54:08', '2022-06-28 03:04:53', 43, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'user', '2022-06-28 02:44:21', '2022-06-28 02:44:21'),
(2, 'timetabler', 'user', '2022-06-28 02:44:21', '2022-06-28 02:44:21'),
(3, 'dean', 'user', '2022-06-28 02:44:21', '2022-06-28 02:44:21'),
(4, 'lecturer', 'user', '2022-06-28 02:44:21', '2022-06-28 02:44:21'),
(5, 'hods', 'user', '2022-06-28 02:44:21', '2022-06-28 02:44:21');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(3, 1),
(4, 1),
(5, 2),
(6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `room_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lab_type_id` int(10) UNSIGNED DEFAULT NULL,
  `capacity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `location_id`, `room_code`, `type`, `lab_type_id`, `capacity`, `created_at`, `updated_at`) VALUES
(1, 2, 'KLAW 1', 'lecture', NULL, 120, '2022-06-28 02:48:36', '2022-06-28 02:48:36'),
(2, 2, 'KLAW 2', 'lecture', NULL, 123, '2022-06-28 02:48:50', '2022-06-28 02:48:50'),
(3, 3, 'L 1', 'lecture', NULL, 60, '2022-06-28 07:26:32', '2022-06-28 07:26:32'),
(4, 1, 'L 3', 'lecture', NULL, 300, '2022-06-28 07:26:49', '2022-06-28 07:26:49'),
(5, 3, 'L 4', 'lecture', NULL, 230, '2022-06-28 07:27:11', '2022-06-28 07:27:11'),
(6, 3, 'L 5', 'lecture', NULL, 120, '2022-06-28 07:27:26', '2022-06-28 07:27:26'),
(7, 3, 'L 6', 'lecture', NULL, 230, '2022-06-28 07:27:44', '2022-06-28 07:27:44'),
(8, 3, 'L 7', 'lecture', NULL, 80, '2022-06-28 07:28:16', '2022-06-28 07:28:16'),
(9, 3, 'L8', 'lecture', NULL, 70, '2022-06-28 07:28:34', '2022-06-28 07:28:34'),
(10, 3, 'L 9', 'lecture', NULL, 70, '2022-06-28 07:28:57', '2022-06-28 07:28:57'),
(11, 1, 'L 10', 'lecture', NULL, 300, '2022-06-28 07:29:07', '2022-06-28 07:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'SSET', '2022-06-28 02:44:22', '2022-06-28 02:44:22'),
(2, 'SCHOOL OF MEDICINE', '2022-06-28 02:49:29', '2022-06-28 02:49:29'),
(3, 'SCHOOL OF LAW', '2022-06-28 02:49:39', '2022-06-28 02:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `school_location_pivot`
--

CREATE TABLE `school_location_pivot` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_location_pivot`
--

INSERT INTO `school_location_pivot` (`id`, `school_id`, `location_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 2, 3, NULL, NULL),
(4, 1, 1, NULL, NULL),
(5, 1, 2, NULL, NULL),
(6, 1, 3, NULL, NULL),
(7, 3, 1, NULL, NULL),
(8, 3, 2, NULL, NULL),
(9, 3, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `period_id` int(10) UNSIGNED NOT NULL,
  `unit_id` int(10) UNSIGNED DEFAULT NULL,
  `lecture_id` int(10) UNSIGNED DEFAULT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `groups` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `period_id`, `unit_id`, `lecture_id`, `room_id`, `group`, `groups`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(2, 1, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(3, 1, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(4, 1, NULL, NULL, 4, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(5, 1, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(6, 1, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(7, 1, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(8, 1, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(9, 1, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(10, 1, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(11, 1, NULL, NULL, 11, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(12, 2, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(13, 2, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(14, 2, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(15, 2, NULL, NULL, 4, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(16, 2, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(17, 2, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(18, 2, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(19, 2, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(20, 2, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(21, 2, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(22, 2, NULL, NULL, 11, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(23, 3, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(24, 3, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(25, 3, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:48', '2022-06-28 09:35:48'),
(26, 3, NULL, NULL, 4, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(27, 3, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(28, 3, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(29, 3, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(30, 3, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(31, 3, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(32, 3, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(33, 3, NULL, NULL, 11, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(34, 4, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(35, 4, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(36, 4, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(37, 4, 3, NULL, 4, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(38, 4, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(39, 4, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(40, 4, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(41, 4, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(42, 4, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(43, 4, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(44, 4, NULL, NULL, 11, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(45, 5, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(46, 5, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(47, 5, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(48, 5, 14, NULL, 4, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(49, 5, 25, NULL, 5, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(50, 5, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(51, 5, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(52, 5, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(53, 5, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(54, 5, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(55, 5, 6, NULL, 11, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(56, 6, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(57, 6, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(58, 6, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(59, 6, 17, NULL, 4, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(60, 6, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(61, 6, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(62, 6, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(63, 6, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(64, 6, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(65, 6, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(66, 6, NULL, NULL, 11, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(67, 7, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(68, 7, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(69, 7, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(70, 7, NULL, NULL, 4, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(71, 7, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(72, 7, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(73, 7, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(74, 7, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(75, 7, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(76, 7, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(77, 7, NULL, NULL, 11, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(78, 8, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(79, 8, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(80, 8, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(81, 8, 5, NULL, 4, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(82, 8, 24, NULL, 5, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(83, 8, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(84, 8, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(85, 8, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(86, 8, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(87, 8, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(88, 8, 16, NULL, 11, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(89, 9, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(90, 9, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(91, 9, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(92, 9, NULL, NULL, 4, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(93, 9, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(94, 9, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(95, 9, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(96, 9, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(97, 9, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(98, 9, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(99, 9, 29, NULL, 11, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(100, 10, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(101, 10, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(102, 10, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(103, 10, 1, NULL, 4, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(104, 10, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(105, 10, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(106, 10, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(107, 10, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(108, 10, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(109, 10, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(110, 10, 27, NULL, 11, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(111, 11, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(112, 11, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(113, 11, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(114, 11, 15, NULL, 4, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(115, 11, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(116, 11, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(117, 11, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(118, 11, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(119, 11, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(120, 11, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(121, 11, NULL, NULL, 11, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(122, 12, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(123, 12, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(124, 12, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(125, 12, NULL, NULL, 4, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(126, 12, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(127, 12, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(128, 12, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(129, 12, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(130, 12, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(131, 12, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(132, 12, NULL, NULL, 11, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(133, 13, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(134, 13, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(135, 13, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(136, 13, NULL, NULL, 4, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(137, 13, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(138, 13, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(139, 13, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(140, 13, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(141, 13, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(142, 13, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(143, 13, 2, NULL, 11, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(144, 14, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(145, 14, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(146, 14, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(147, 14, NULL, NULL, 4, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(148, 14, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(149, 14, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(150, 14, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(151, 14, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(152, 14, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(153, 14, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(154, 14, 13, NULL, 11, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(155, 15, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(156, 15, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(157, 15, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(158, 15, 19, NULL, 4, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(159, 15, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(160, 15, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(161, 15, 22, NULL, 7, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(162, 15, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(163, 15, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(164, 15, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(165, 15, 12, NULL, 11, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(166, 16, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(167, 16, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(168, 16, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(169, 16, 28, NULL, 4, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(170, 16, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(171, 16, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(172, 16, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(173, 16, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(174, 16, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(175, 16, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(176, 16, 11, NULL, 11, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(177, 17, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(178, 17, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(179, 17, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(180, 17, NULL, NULL, 4, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(181, 17, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(182, 17, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(183, 17, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(184, 17, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(185, 17, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(186, 17, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(187, 17, 10, NULL, 11, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(188, 18, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(189, 18, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(190, 18, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(191, 18, 4, NULL, 4, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(192, 18, 23, NULL, 5, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(193, 18, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(194, 18, 18, NULL, 7, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(195, 18, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(196, 18, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(197, 18, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(198, 18, 9, NULL, 11, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(199, 19, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(200, 19, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(201, 19, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(202, 19, 26, NULL, 4, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(203, 19, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(204, 19, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(205, 19, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(206, 19, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(207, 19, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(208, 19, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(209, 19, 8, NULL, 11, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09'),
(210, 20, NULL, NULL, 1, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(211, 20, NULL, NULL, 2, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(212, 20, NULL, NULL, 3, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(213, 20, NULL, NULL, 4, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(214, 20, NULL, NULL, 5, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(215, 20, NULL, NULL, 6, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(216, 20, NULL, NULL, 7, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(217, 20, NULL, NULL, 8, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(218, 20, NULL, NULL, 9, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(219, 20, NULL, NULL, 10, NULL, 1, '2022-06-28 09:35:49', '2022-06-28 09:35:49'),
(220, 20, 7, NULL, 11, 'Non', 1, '2022-06-28 09:35:49', '2022-06-28 09:53:09');

-- --------------------------------------------------------

--
-- Table structure for table `timetables`
--

CREATE TABLE `timetables` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `in_progress` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timetables`
--

INSERT INTO `timetables` (`id`, `description`, `created_at`, `updated_at`, `in_progress`) VALUES
(1, 'Test-0', '2022-06-28 09:19:11', '2022-06-28 09:35:54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_days`
--

CREATE TABLE `timetable_days` (
  `id` int(10) UNSIGNED NOT NULL,
  `timetable_id` int(10) UNSIGNED NOT NULL,
  `day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period_length` double(5,2) NOT NULL DEFAULT 3.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timetable_days`
--

INSERT INTO `timetable_days` (`id`, `timetable_id`, `day`, `period_length`, `created_at`, `updated_at`) VALUES
(1, 1, 'Monday', 3.00, '2022-06-28 09:19:11', '2022-06-28 09:19:11'),
(2, 1, 'Tuesday', 3.00, '2022-06-28 09:19:11', '2022-06-28 09:19:11'),
(3, 1, 'Wednesday', 3.00, '2022-06-28 09:19:11', '2022-06-28 09:19:11'),
(4, 1, 'Thursday', 3.00, '2022-06-28 09:19:11', '2022-06-28 09:19:11'),
(5, 1, 'Friday', 3.00, '2022-06-28 09:19:11', '2022-06-28 09:19:11');

-- --------------------------------------------------------

--
-- Table structure for table `time_table_periods`
--

CREATE TABLE `time_table_periods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_students` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Programs` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecture_hours` int(11) NOT NULL,
  `department_ID` int(11) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  `lab_hours` int(11) NOT NULL,
  `lab_type_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `related_to` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `code`, `name`, `lecture_hours`, `department_ID`, `lecturer_id`, `lab_hours`, `lab_type_id`, `created_at`, `updated_at`, `related_to`) VALUES
(1, 'DPBA 720  ', ' Business consultancy ', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(2, 'DPAH 812 ', 'Strategic HR Planning', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(3, 'DPAH 810', 'Advanced Theory and Practice in HRM  ', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(4, 'DPAH 811', 'Advanced Research Seminar in HRM   ', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(5, 'BIBL 722 ', ' Christian Worldview and Philosophical Foundations ', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(6, 'DPAF 810/DPIF 711', 'Finance Theory', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(7, 'DPBA 721 ', 'Econometrics', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(8, 'BMGT 500', 'Principles of Management in Biblical Perspective', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(9, 'HRMT 510', 'Human Resource Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(10, 'ACCT 510/MSOD 511', 'Financial Accounting/ Accounting and Financial Fundamentals', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(11, 'SMGT 520', 'Strategic Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(12, 'BMGT 510', 'Business Law and Ethics', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(13, 'FNCE 620', 'Financial Markets and Institutions', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(14, 'FNCE 623', 'Finance Seminar', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(15, 'FNCE 511/622', 'Corporate Financial Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(16, 'ACCT 520', 'Management Accounting', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(17, 'ACCT 511', 'Corporate Financial Reporting', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(18, 'FNCE 510', 'Financial Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(19, 'FNCE 621', 'Investment Analysis and Portfolio Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(20, 'MKTG 510', 'Marketing Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(21, 'FNCE 521/628', 'International Financial Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(22, 'FNCE 522', 'Economic Development Finance', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(23, 'OMGT 510', 'Quantitative Techniques', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(24, 'ECON 510/520', 'Managerial Economics', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(25, 'FNCE 520', 'Financial Econometrics and Forecasting', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(26, 'BMGT 520', 'Research Methods', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(27, 'MPM 520', 'International Project Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(28, 'MPM 522', 'Procurement Management and Control', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(29, 'ENTRE 510/520', 'Entrepreneurship & Small Business Mgt', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(30, 'MIST 520', 'Management Information Systems', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(31, 'FNCE 626', 'Money and Banking', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(32, 'MPM 521', 'Project Risk and Quality Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(33, 'MSOD 520', 'Leading Organizational Change', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(34, 'MSOD 510', 'Introduction to Organization Development', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(35, 'BMGT 211', 'Introduction to Risk &Insurance', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(36, 'FNCE 324', 'Financial Institutions & Markets', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(37, 'BMGT 310/INTE 317', 'Organization Theory & Behavior', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(38, 'DBM 220', 'Organizational Behavior', 30, 0, 0, 20, NULL, '2022-06-28 02:54:50', '2022-06-28 02:54:50', NULL),
(39, 'ACCT 412', 'Auditing Practice and Investigation', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(40, 'ACCT 421', 'Advanced Accounting II', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(41, 'ACCT 411', 'Advanced Accounting I', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(42, 'ACCT 310', 'Principles of Auditing', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(43, 'ACCT 323', 'Managerial Accounting', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(44, 'DPL221/DBM223', 'Managerial Accounting & Control', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(45, 'ACCT 324', 'Taxation II', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(46, 'BMGT 421', 'Business Ethics', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(47, 'HRMT 314', 'HR Training', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(48, 'HRMT 421', 'Safety and Operational Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(49, 'HRMT 415', 'Labour Laws', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(50, 'FNCE 310', 'Corporate Finance', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(51, 'ECON/FNCE 323', 'Public Finance', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(52, 'FNCE 414', 'Mgt of Financial Institutions', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(53, 'BMGT 213', 'Human Resources Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(54, 'BMGT 214/BMGT 414', 'Business Entrepreneurship', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(55, 'BMGT 123', 'Principles of Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(56, 'BMGT 411', 'Research Proposal', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(57, 'BMGT 422', 'Research Project', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(58, 'FNCE 424', 'Real estate Finance and investment', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(59, 'ACCT 211', 'Intermediate Accounting I', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(60, 'ACCT 120', 'Foundations of Accounting II', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(61, 'FNCE 325', 'E-Finance', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(62, 'ACCT 325', 'E-Accounting', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(63, 'FNCE 312/ACCT 313', 'Taxation I', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(64, 'ACCT 422', 'International Accounting', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(65, 'BMGT 323', 'Company Law', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(66, 'BMGT 313', 'Business Law', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(67, 'DPL 222/DBM/DBIT/DHRM/DSM 216', 'Introduction to Business Law', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(68, 'FNCE 220', 'Business Finance', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(69, 'FNCE 413/PLOG 413/BHM 420', 'Financial Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(70, 'FNCE 423', 'Options and Future Market', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(71, 'BMGT 220/ECON 222', 'Business Statistics II/Statistics for Economists II', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(72, 'BMGT 321/BPLO 221', 'Quantitative Techniques', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(73, 'DBM 222/DBIT 215', 'Quantitative Techniques', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(74, 'FNCE 212', 'Management Mathematics II', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(75, 'BMGT 322', 'Management Information System', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(76, 'BMGT 121', 'Computer Programming for Business', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(77, 'DPL/DBM 214/DIT 310', 'Entrepreneurship Skills/Entrepreneurship in IT', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(78, 'BMGT 221', 'Business Communication', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(79, 'DHRM 125/DPL121', 'Business Communications and writing skills', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(80, 'DBM/DHRM/DPL/DPM/DBIT/DSM/DPM 123', 'Principles of Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(81, 'MKTG 322', 'Marketing of Service', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(82, 'BMGT 320', 'Research Methods', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(83, 'BMGT 410', 'Operation Research', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(84, 'MKTG 220', 'Principles of Marketing', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(85, 'MKTG 313/MKTG 323', 'Digital Marketing/E-Marketing', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(86, 'MKTG 428', 'Global Marketing', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(87, 'BHM 424', 'International Marketing', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(88, 'MKTG 410', 'Marketing Research', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(89, 'MKTG 420', 'Sales Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(90, 'BMGT 111', 'Introduction to Business', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(91, 'BMGT 210/ECON 123', 'Business Statistics I/Statistics for Economists 1', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(92, 'DPL/DBM/DBIT 210', 'Business Statistics', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(93, 'BMGT 214/BMGT 414 (BBIT/BMIT/BPL/BSC F/INTE/CS/ES)', 'Business Entrepreneurship', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(94, 'MKTG 324', 'Brand Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(95, 'MKTG 312', 'Consumer Behavior', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(96, 'MKTG 321', 'Marketing Communication', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(97, 'MKTG 421', 'Channel Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(98, 'MKTG 310', 'Marketing Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(99, 'DBM 215/DPL 220/DBIT222/DSM112', 'Principles of Marketing', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(100, 'MKTG 411', 'Business to Business Marketing', 30, 0, 0, 20, NULL, '2022-06-28 02:54:51', '2022-06-28 02:54:51', NULL),
(101, 'DBM/DBA/DPL/DSM 226', 'Research Project', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(102, 'DPL/DBM/DBIT 111', 'Introduction to Business', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(103, 'DBM/DBIT 225/DPL 223/DHTM 216/DSM225', 'Research Methodology', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(104, 'BMGT 420', 'Project Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(105, 'HRMT 411', 'Crisis and Change Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(106, 'HRMT 424', 'Group Dynamics', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(107, 'HRMT 324', 'Employee Sourcing & Maintenance', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(108, 'BMIS 425/HRMT 327', 'HR Information System MGT', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(109, 'ACCT 221', 'Intermediate Accounting II', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(110, 'FNCE 412', 'Security Valuation & Portfolio Selection', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(111, 'FNCE 110', 'Principles of Finance', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(112, 'DBF 124', 'Principles of Microfinance', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(113, 'ACCT 423', 'Accounting for Public Agencies', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(114, 'DMB/DBIT/DPL/DBA 110', 'Foundations of Accounting I', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(115, 'FNCE 425', 'International Finance', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(116, 'DPL/DBF/DHRM/DPM/DBM/DBIT 120', 'Foundations of Accounting II', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(117, 'DPL 211/DBM 211', 'Managing Risks in Supply Chain Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(118, 'ACCT 314', 'Cost Accounting', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(119, 'ACCT 110', 'Foundations of Accounting 1', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(120, 'BMGT 426', 'Cooperative Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(121, 'DBM 224/DBIT 220', 'Business Finance', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(122, 'BMGT 413', 'Strategic Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(123, 'DHRM 223', 'Industrial Relations and Labour Laws', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(124, 'DHRM 222', 'Organizational Change & Culture Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(125, 'DHRM 213', 'Human Resource Development', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(126, 'DPL/DBM/DBIT/DHTM 213/DHRM 124', 'Human Resource Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(127, 'DHRM 212', 'Employee Resourcing', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(128, 'DHRM 221', 'HRIS and Payroll management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL),
(129, 'DHRM 215', 'Strategic Human Resource Management', 30, 0, 0, 20, NULL, '2022-06-28 02:54:52', '2022-06-28 02:54:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `avatar`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'injuguna@kabarak.ac.ke', '1', 'default.jpg', NULL, '$2y$10$bqmGyYkl4QCT26PB7tBVIORJw0mWjw4Wk89eHM4IlawwwFaU68rru', NULL, '2022-06-28 02:44:21', '2022-06-28 02:44:21'),
(2, 'Timetabler', 'timetabler@mail.com', '2', 'default.jpg', NULL, '$2y$10$i3aT038/89nwHpJpHoyHgerOhYk2RniRRq5ney4Gk6ZPHFoEHP6wa', NULL, '2022-06-28 02:44:22', '2022-06-28 02:44:22'),
(3, 'lecturer', 'lecturer@mail.com', '4', 'default.jpg', NULL, '$2y$10$g8Q2Au9J9Mk.Dl4c7Xo.B.6uafwnXWn1D/OK9RSvsXVk0TimladDa', NULL, '2022-06-28 02:44:22', '2022-06-28 02:44:22'),
(4, 'hod', 'hod@mail.com', '4', 'default.jpg', NULL, '$2y$10$2W3ckqLlSH0gvYsDTfYs5Oyto8SYrLPzfvecEgwhB/L3kpBy8CPV.', NULL, '2022-06-28 02:44:22', '2022-06-28 02:44:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesstokens`
--
ALTER TABLE `accesstokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accesstokens_user_id_unique` (`user_id`),
  ADD UNIQUE KEY `accesstokens_token_unique` (`token`);

--
-- Indexes for table `csv_data`
--
ALTER TABLE `csv_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generated_documents`
--
ALTER TABLE `generated_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `generated_documents_school_id_foreign` (`school_id`),
  ADD KEY `generated_documents_program_id_foreign` (`program_id`);

--
-- Indexes for table `h_o_d_s`
--
ALTER TABLE `h_o_d_s`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `h_o_d_s_email_unique` (`email`),
  ADD KEY `h_o_d_s_lecturer_id_foreign` (`lecturer_ID`),
  ADD KEY `h_o_d_s_deparment_id_foreign` (`deparment_ID`);

--
-- Indexes for table `lab_types`
--
ALTER TABLE `lab_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lectures_email_unique` (`email`),
  ADD KEY `lectures_deparment_id_foreign` (`deparment_ID`);

--
-- Indexes for table `levels_units_pivot`
--
ALTER TABLE `levels_units_pivot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `levels_units_pivot_unit_id_foreign` (`unit_id`),
  ADD KEY `levels_units_pivot_level_id_foreign` (`level_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `periods`
--
ALTER TABLE `periods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `periods_day_id_foreign` (`day_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_levels`
--
ALTER TABLE `program_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_levels_program_id_foreign` (`program_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_location_id_foreign` (`location_id`),
  ADD KEY `rooms_lab_type_id_foreign` (`lab_type_id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_location_pivot`
--
ALTER TABLE `school_location_pivot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_location_pivot_school_id_foreign` (`school_id`),
  ADD KEY `school_location_pivot_location_id_foreign` (`location_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_room_id_foreign` (`room_id`),
  ADD KEY `sessions_period_id_foreign` (`period_id`);

--
-- Indexes for table `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetable_days`
--
ALTER TABLE `timetable_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timetable_days_timetable_id_foreign` (`timetable_id`);

--
-- Indexes for table `time_table_periods`
--
ALTER TABLE `time_table_periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_lab_type_id_foreign` (`lab_type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accesstokens`
--
ALTER TABLE `accesstokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `csv_data`
--
ALTER TABLE `csv_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `generated_documents`
--
ALTER TABLE `generated_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `h_o_d_s`
--
ALTER TABLE `h_o_d_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_types`
--
ALTER TABLE `lab_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `levels_units_pivot`
--
ALTER TABLE `levels_units_pivot`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `periods`
--
ALTER TABLE `periods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `program_levels`
--
ALTER TABLE `program_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `school_location_pivot`
--
ALTER TABLE `school_location_pivot`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `timetable_days`
--
ALTER TABLE `timetable_days`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `time_table_periods`
--
ALTER TABLE `time_table_periods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `generated_documents`
--
ALTER TABLE `generated_documents`
  ADD CONSTRAINT `generated_documents_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `generated_documents_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `h_o_d_s`
--
ALTER TABLE `h_o_d_s`
  ADD CONSTRAINT `h_o_d_s_deparment_id_foreign` FOREIGN KEY (`deparment_ID`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `h_o_d_s_lecturer_id_foreign` FOREIGN KEY (`lecturer_ID`) REFERENCES `lectures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lectures`
--
ALTER TABLE `lectures`
  ADD CONSTRAINT `lectures_deparment_id_foreign` FOREIGN KEY (`deparment_ID`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `levels_units_pivot`
--
ALTER TABLE `levels_units_pivot`
  ADD CONSTRAINT `levels_units_pivot_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `program_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `levels_units_pivot_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `periods`
--
ALTER TABLE `periods`
  ADD CONSTRAINT `periods_day_id_foreign` FOREIGN KEY (`day_id`) REFERENCES `timetable_days` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `program_levels`
--
ALTER TABLE `program_levels`
  ADD CONSTRAINT `program_levels_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_lab_type_id_foreign` FOREIGN KEY (`lab_type_id`) REFERENCES `lab_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rooms_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `school_location_pivot`
--
ALTER TABLE `school_location_pivot`
  ADD CONSTRAINT `school_location_pivot_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `school_location_pivot_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_period_id_foreign` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sessions_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `timetable_days`
--
ALTER TABLE `timetable_days`
  ADD CONSTRAINT `timetable_days_timetable_id_foreign` FOREIGN KEY (`timetable_id`) REFERENCES `timetables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_lab_type_id_foreign` FOREIGN KEY (`lab_type_id`) REFERENCES `lab_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
