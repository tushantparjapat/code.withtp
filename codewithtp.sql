-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2022 at 05:02 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codewithtp`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_no`, `msg`, `date`) VALUES
(35, 'dsf', 'sadfsad@fs', 'safdsd', 'sdfa', '2022-01-07 10:40:34'),
(36, 'fghd', 'dfsg@gm', 'fgfg', 'dfsgfsg', '2022-01-19 19:49:59');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `slug` varchar(25) NOT NULL,
  `sno` int(50) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `cantent` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`slug`, `sno`, `title`, `tagline`, `cantent`, `img_file`, `date`) VALUES
('4th-post', 1, 'Flask (web framework)', 'Flask for web devlapmant', 'Flask is a micro web framework written in Python. It is classified as a microframework because it does not require particular tools or libraries.[2] It has no database abstraction layer, form validation, or any other components where pre-existing third-party libraries provide common functions. However, Flask supports extensions that can add application features as if they were implemented in Flask itself. Extensions exist for object-relational mappers, form validation, upload handling, various open authentication technologies and several common framework related tools.[3] ', 'home-bg.jpg', '2022-01-19 20:27:57'),
('1st-post', 2, 'Python (programming language)', 'Python is high level language', 'Python is an interpreted high-level general-purpose programming language. Its design philosophy emphasizes code readability with its use of significant indentation. Its language constructs as well as its object-oriented approach aim to help programmers write clear, logical code for small and large-scale projects.[31] ', 'tushant.png', '2022-01-19 20:37:02'),
('2ns-post', 3, 'Jinja (template engine)', '', 'Jinja is a web template engine for the Python programming language. It was created by Armin Ronacher and is licensed under a BSD License. Jinja is similar to the Django template engine but provides Python-like expressions while ensuring that the templates are evaluated in a sandbox. It is a text-based template language and thus can be used to generate any markup as well as source code.\r\n\r\nThe Jinja template engine allows customization of tags,[3] filters, tests, and globals.[4] Also, unlike the Django template engine, Jinja allows the template designer to call functions with arguments on objects. Jinja is Flask\'s default template engine [5] and it is also used by Ansible,[6] Trac, and Salt. \r\n', '  ', '2022-01-19 17:15:16'),
('c', 9, 'C language', 'Programing in C', 'C is a high level language .', 'c', '2022-01-07 16:01:36'),
('PythonAnywhere', 11, 'PythonAnywhere', ' an online integrated development environment (IDE)', 'PythonAnywhere is an online integrated development environment (IDE) and web hosting service (Platform as a service) based on the Python programming language.[1] Founded by Giles Thomas and Robert Smithson in 2012, it provides in-browser access to server-based Python and Bash command-line interfaces, along with a code editor with syntax highlighting. Program files can be transferred to and from the service using the user\'s browser. Web applications hosted by the service can be written using any WSGI-based application framework.\r\n\r\nPythonAnywhere was created by Resolver Systems,[2] who also produced Resolver One, a Python-based Spreadsheet program. On 16 October 2012 the product was acquired by a new company, PythonAnywhere LLP, who will develop and maintain the product in the future, and have taken on the existing development team.[3]\r\n\r\nThe development team uses PythonAnywhere to develop PythonAnywhere, and say that its collaboration features help because they use the extreme programming methodology.[4]\r\n\r\nFeatures\r\nCPython, PyPy and IPython support, including Python versions 2.7, 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, and 3.9.[5]\r\nIn-browser interactive consoles with code running on hosted servers, shareable between multiple users.\r\nWSGI-based web hosting, e.g. Django, Flask, web2py\r\nSupport for coding from iPad and other mobile devices.\r\nSyntax-highlighting in-browser editor.\r\nMany popular Python modules pre-installed.[6]\r\nCron-like scheduled tasks to run scripts at a given time of day.\r\nAlways-on tasks to run scripts and restart them automatically when they fail.[7][8]', ' ss', '2022-01-19 17:51:59'),
('c#', 12, 'C Sharp (programming language)', '', 'C# (/si ʃɑːrp/ see sharp)[b] is a general-purpose, multi-paradigm programming language. C# encompasses static typing, strong typing, lexically scoped, imperative, declarative, functional, generic, object-oriented (class-based), and component-oriented programming disciplines.[15]\r\n\r\nC# was designed by Anders Hejlsberg from Microsoft in 2000 and was later approved as an international standard by Ecma (ECMA-334) in 2002 and ISO (ISO/IEC 23270) in 2003. Microsoft introduced C# along with .NET Framework and Visual Studio, both of which were closed-source. At the time, Microsoft had no open-source products. Four years later, in 2004, a free and open-source project called Mono began, providing a cross-platform compiler and runtime environment for the C# programming language. A decade later, Microsoft released Visual Studio Code (code editor), Roslyn (compiler), and the unified .NET platform (software framework), all of which support C# and are free, open-source, and cross-platform. Mono also joined Microsoft but was not merged into .NET.\r\n\r\nAs of 2021, the most recent version of the language is C# 10.0, which was released in 2021 in .NET 6.0.', ' ', '2022-01-19 17:53:51'),
('ss', 13, 'tusdhs', 'sdfg', 'sdfg', 'home-bg.jpg ', '2022-01-19 20:28:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
