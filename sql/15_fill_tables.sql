
INSERT INTO `users_group` (`id`, `name`, `parent_id`) VALUES 
(15001, "admins", null),
(15002, "developers", 15001),
(15003, "users", 15002);

INSERT INTO `user` (`id`, `name`, `password`, `first_name`, `middle_name`, `last_name`, `is_admin`, `group_id`) VALUES 
(15001, "adminRullers", "12345", "ϸ��", "��������", "������", true, 15001),
(15002, "Petya", "543345", "����", "�����������", "�����", false, 15002),
(15003, "Vasya", "76434", "����", "��������", "��������", false, 15002),
(15004, "Olegorii", "65478", "����", "����������", "�������", false, 15002),
(15005, "mysa", "543323", "����", "��������", "�������", false, 15003),
(15006, "lusya", "986456", "�������", "����������", "�������", false, 15003),
(15007, "potron", "654222", "���������", "��������", "����������", false, 15002);

INSERT INTO `contacts_type` (`id`,`name`,`regexp`) VALUES 
(15001,"mobile_phone","\\d{3}-\\d{2}-\\d{2}"),
(15002,"work_phone","\\d{3}-\\d{3}"),
(15003,"home_phone","\\d{2}-\\d{2}-\\d{2}"),
(15004,"eMail",".+@.{2,}\\..{2,}");

INSERT INTO `contact` (`id`,`name`,`user_id`,`type_id`) VALUES 
(15001, "43-54-23",15001, 15003 ),
(15002, "lol@gmail.com", 15002, 15004),
(15003, "Pupka@gmail.com", 15003, 15004),
(15004, "234-54-76", 15004, 15001),
(15005, "345-762", 15006, 15002),
(15006, "aloha@mail.ru", 15007, 15004);

INSERT INTO `projects_category` (`id`, `name`, `parent_id`) VALUES 
(15001, "Java", 15001),
(15002, "C#", 15002),
(15003, "html", 15001),
(15004, "C++", null),
(15005, "Drupal", 15003),
(15006, "Joomla", 15004);


INSERT INTO `project` (`id`, `name`, `description`,`category_id`,`manager_id`) VALUES 
(15001, "�����", "��������� �����",15001,15002),
(15002, "�����", "����������, ������� �� ����� �� ������",15003,15003),
(15003, "����-����", "�� � ��� �� ������� ������ ���",15004,15004),
(15004, "�����", "��������� �������� ����",15001,15005),
(15005, "�������", "���� ��� ������� ������",15005,15006);

INSERT INTO `team` (`id`,`project_id`,`leader_id`) VALUES 
(15001, 15001,15001),
(15002, 15002,15006),
(15003, 15004,15002),
(15004, 15005,15007),
(15005, 15003,15003);
	
INSERT INTO `employee` (`id`, `user_id`, `team_id`,`role`) VALUES 
(15001, 15001, 15002, 1),
(15002, 15002, 15002, 0),
(15003, 15003, 15002, 0),
(15004, 15004, 15004, 0),
(15005, 15005, 15005, 0);
	   		
INSERT INTO `module` (`id`, `name`, `parent_id`, `project_id`) VALUES 
(15001, "�����������", null, 15005),
(15002, "���� � �������", 15001, 15005),
(15003, "����� �� �������", 15001, 15005),
(15004, "���������������� �����������", 15002, 15005),
(15005, "CRUD ��������", 15004, 15005),
(15006, "�����������", null, 15004),
(15007, "���� � �������", 15006, 15004),
(15008, "����� �� �������", 15006, 15004),
(15009, "���������������� �����������", 15007, 15004),
(15010, "CRUD ��������", 15009, 15004);
	
INSERT INTO `actor` (`id`, `name`, `project_id`) VALUES 
(15001, "unknown user", 15001),
(15002, "admin", 15001),
(15003, "user", 15001),
(15004, "unknown user", 15002),
(15005, "admin", 15002),
(15006, "user", 15002),
(15007, "unknown user", 15003),
(15008, "admin", 15003),
(15009, "user", 15003);	

INSERT INTO `tasks_category` (`id`, `name`, `parent_id`) VALUES
(15001, "����������� ������������ �� �������", null), 
(15002, "���������� ������ ��", 15001),
(15003, "�������� DAO", 15002),
(15004, "�����������", 15003),
(15005, "���������", 15004);

INSERT INTO `use_case` (`id`, `name`, `module_id`) VALUES 
(15001, "case1", 15002),
(15002, "case2", 15005),
(15003, "case3", 15006),
(15004, "case4", 15003),
(15005, "case5", 15005),
(15006, "case6", 15001),
(15007, "case7", 15003);

INSERT INTO `requirement` (`id`, `name`, `description`, `importance`, `change_probability`, `use_case_id`, `module_id`) VALUES 
(15001, "���������", "����������� �������� ���������", 0.6, 0.0, 15001, 15009),
(15002, "������� ������", "������ ������ ���� ��������", 0.3, 0.0, 15002, 15001),
(15003, "������� ����", "���������� �������� ���������� ��������", 0.9, 0.1, 15003, 15009),
(15004, "���������� ������", "������������� ����������� ������� �����", 0.2, 0.1, 15004, 15009),
(15005, "�����������", "������������� ���� � ������� ����������� ����", 0.5, 0.4, 15005, 15004),
(15006, "����", "������ ���� ����������� �������������", 0.7, 0.3, 15006, 15007),
(15007, "��������", "�������� ���� �� ������", 0.8, 0.2, 15007, 15009);

INSERT INTO `task` (`id`, `name`, `description`, `plan_time`, `difficulty`, `open_date`, `accept_date`, `close_date`,`category_id`, `requirement_id`, `module_id`,`employee_id`,`status`) VALUES 
(15001, "�������", "���������� ��������", 3, 0.5, "06.04.2015", "10.04.2015", "11.04.2015", 15001, 15001, 15001, 15001, 2),
(15002, "������", "���������� ���� ������", 2, 0.2, "06.04.2015", "08.04.2015", "08.04.2015", 15002, 15005, 15002, 15002, 3),
(15003, "����������", "����������� ���������� �� ���������� ������", 1, 0.7, "06.04.2015", "07.04.2015", "07.04.2015", 15003, 15007, 15003, 15003, 1),
(15004, "������", "������� ���� ������", 5, 0.5, "06.04.2015", "15.04.2015", "15.04.2015", 15004, 15002, 15004, 15004, 3),
(15005, "������", "�������� ������", 3, 0.3, "06.04.2015", "09.04.2015", "15.04.2015", 15005, 15004, 15005, 15005, 2);

INSERT INTO `tasks_dependency` (`id`,`task_id`,`dependent_task_id`) VALUES 
(15001, 15005, 15003),
(15002, 15002, 15001),
(15003, 15003, 15002);

INSERT INTO use_cases_relation (`id`,`source_id`,`destination_id`,`type`) VALUES 
(15001,15001,15002,1),
(15002,15002,15003,2),
(15003,15003,15004,3),
(15004,15004,15005,2), 
(15005,15005,15006,1); 	      