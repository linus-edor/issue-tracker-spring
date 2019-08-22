CREATE DATABASE IF NOT EXISTS `linus-issue-tracker`;


CREATE TABLE IF NOT EXISTS `issue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `closingComment` varchar(255) DEFAULT NULL,
  `dateIdentified` date DEFAULT NULL,
  `fullDetails` varchar(255) DEFAULT NULL,
  `resolutionDate` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `assignedTo_id` int(11) DEFAULT NULL,
  `identifiedBy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_hrt1v4tkxpkix0hnd7mglq2h2` (`assignedTo_id`),
  KEY `FK_3qse3gr2cpokpl8y517xfjndw` (`identifiedBy_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `issue`
--

INSERT INTO `issue` (`ID`, `closingComment`, `dateIdentified`, `fullDetails`, `resolutionDate`, `status`, `summary`, `assignedTo_id`, `identifiedBy_id`) VALUES
(1, 'some nice closing comment in here', '2014-07-22', 'an interesting thing, upon login, you are automatically logged out....', '2014-07-24', 1, 'Login issue...', 1, 1),
(2, 'Quite a notorious issue. it took me about three days to complete it', '2014-07-23', 'gs cxhzcxzc zxchzxc zxchzxczxchhdasd asdasdasda dasjdasd', '2014-07-24', 0, 'some litle issue', 1, 1),
(4, 'hsjdjkdsakdaskd', NULL, 'i dont actually know yet', NULL, 1, 'another login issue', 3, NULL),
(5, NULL, '2014-07-23', 'some full descripion and whta i smeadn is not jjdjasjdjas dasjdasj dajdda joke', NULL, 1, 'another login issue here again', 3, NULL),
(6, NULL, '2014-07-23', 'some full descripion and whta i smeadn is not a joke h sdfsdjf sdkfsdf sdfsfsd', NULL, 1, 'this is ratther a  askdasd askds', NULL, NULL),
(7, NULL, '2014-07-23', 'it''s basically login issue.....', NULL, 1, 'some issue to be dealt with', 3, NULL),
(8, NULL, '2014-07-23', 'login details not being .......', NULL, 1, 'new issue', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_issue`
--

CREATE TABLE IF NOT EXISTS `project_issue` (
  `project_ID` bigint(20) NOT NULL,
  `issues_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_kob60otyqj1wj39cqjb2yf19f` (`issues_ID`),
  KEY `FK_kob60otyqj1wj39cqjb2yf19f` (`issues_ID`),
  KEY `FK_lk15kvvd2o5ty3xynb1m4qaqx` (`project_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_users`
--

CREATE TABLE IF NOT EXISTS `project_users` (
  `project_ID` bigint(20) NOT NULL,
  `members_id` int(11) NOT NULL,
  UNIQUE KEY `UK_8dct9d191nwjhr876knaxruyy` (`members_id`),
  KEY `FK_8dct9d191nwjhr876knaxruyy` (`members_id`),
  KEY `FK_96oknhgkt52htu3ha11b07uh1` (`project_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `FK_g46n82f45xs0ds0r7m7ahel3d` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `user_id`) VALUES
(1, 'ROLE_ADMIN', 2),
(2, 'ROLE_TEAM_MEMBER', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dob` datetime DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_avh1b2ec82audum2lyjx2p1ws` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `dob`, `email`, `name`, `password`) VALUES
(1, NULL, 'linus@gmail.com', 'linus', 'linus'),
(2, NULL, 'admin@gmail.com', 'admin', 'admin'),
(3, NULL, 'linus1@gmail.com', 'linus1', 'linus1'),
(4, NULL, 'linus2@gmail.com', 'linus2', 'linus2');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `issue`
--
ALTER TABLE `issue`
  ADD CONSTRAINT `FK_3qse3gr2cpokpl8y517xfjndw` FOREIGN KEY (`identifiedBy_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_hrt1v4tkxpkix0hnd7mglq2h2` FOREIGN KEY (`assignedTo_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `project_issue`
--
ALTER TABLE `project_issue`
  ADD CONSTRAINT `FK_lk15kvvd2o5ty3xynb1m4qaqx` FOREIGN KEY (`project_ID`) REFERENCES `project` (`ID`),
  ADD CONSTRAINT `FK_kob60otyqj1wj39cqjb2yf19f` FOREIGN KEY (`issues_ID`) REFERENCES `issue` (`ID`);

--
-- Constraints for table `project_users`
--
ALTER TABLE `project_users`
  ADD CONSTRAINT `FK_96oknhgkt52htu3ha11b07uh1` FOREIGN KEY (`project_ID`) REFERENCES `project` (`ID`),
  ADD CONSTRAINT `FK_8dct9d191nwjhr876knaxruyy` FOREIGN KEY (`members_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `FK_g46n82f45xs0ds0r7m7ahel3d` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
