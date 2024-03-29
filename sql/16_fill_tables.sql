INSERT INTO `users_group` (`id`, `name`, `parent_id`) VALUES
(16001, "разработчики", null),
(16002, "аналитики", null),
(16003, "admin", null),
(16010, "java", 16001),
(16011, "web", 16001),
(16012, "c#", 16001),
(16020, "по", 16002),
(16021, "системный", 16002);

INSERT INTO `user` (`id`, `name`, `password`, `first_name`, `middle_name`, `last_name`, `is_admin`, `group_id`) VALUES
(16001, "patron" , "123", "петя", "петрович", "петров", false, 16010),
(16002, "frodo" , "123", "григорий", "алексеевич", "франц", false, 16010),
(16003, "vanil" , "123", "иван", "иванович", "иванов", false, 16011),
(16004, "yury" , "123", "юра", "васильевич", "зазулин", false, 16012),
(16005, "elena" , "123", "елена", "александровна", "синякова", false, 16021),
(16006, "flower" , "123", "татьяна", "николаевна", "турковская", false, 16020),
(16007, "administrator", "123", "вася", "васильевич", "василевский", true, 16003);

INSERT INTO `contacts_type` (`id`, `name`, `regexp`) VALUES
(16001, "email", "^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$"),
(16002, "mobile", "^(\+375()\d{2})\d{3}-\d{2}-\d{2}");

INSERT INTO `contact` (`id`, `name`, `user_id`, `type_id`) VALUES
(16001, "vasia@gmail.com",16007, 16001 ),
(16002, "tania@mail.ru", 16006, 16001),
(16003, "+375(29)891-03-12", 16007, 16002),
(16004, "+375(33)396-45-90", 16006, 16002);

INSERT INTO `projects_category` (`id`, `name`, `parent_id`) VALUE
(16001, "main", null),
(16002, "prcat2", 16001),
(16003, "prcat3", 16001);

INSERT INTO `project` (`id`, `name`, `description`, `category_id`, `manager_id`) VALUES
(16001, "pr1", "descr1 manag - patron", 16002, 16001),
(16002, "pr2", "descr2 manag - flower", 16003, 16006);

INSERT INTO `team` (`id`, `project_id`, `leader_id`) VALUES
(16001, 16001, 16001),
(16002, 16002, 16006);

INSERT INTO `employee` (`id`, `user_id`, `team_id`, `role`) VALUES
(16001, 16001, 16001, 1),
(16002, 16002, 16001, 1),
(16003, 16003, 16001, 1),
(16004, 16004, 16001, 1),
(16005, 16005, 16002, 0),
(16006, 16006, 16002, 0);

INSERT INTO `actor` (`id`, `name`, `project_id`) VALUES
(16001, "user1", 16001),
(16002, "admin1", 16001),
(16003, "user2", 16002),
(16004, "admin2", 16002);

INSERT INTO `module` (`id`, `name`, `parent_id`, `project_id`) VALUES
(16001, "mod1", null, 16001),
(16002, "mod2", null, 16002),
(16003, "mod3.1", 16001, 16001),
(16004, "mod4.1", 16001, 16001);

INSERT INTO `use_case` (`id`, `name`, `module_id`) VALUES
(16001, "u_c_1 mod3", 16003),
(16002, "u_c_2 mod3", 16003),
(16003, "u_c_3 mod4", 16004);

INSERT INTO `actor_use_case_relation` (`id`, `actor_id`, `use_case_id`) VALUES
(16001, 16001, 16001),
(16002, 16001, 16002),
(16003, 16002, 16001),
(16004, 16002, 16002),
(16005, 16002, 16003);

INSERT INTO `requirement` (`id`, `name`, `description`, `importance`, `change_probability`, `use_case_id`, `module_id`) VALUES
(16001, "req1", "descr1", 0.01, 0.01, 16001, null),
(16002, "req2", "descr2", 0.02, 0.02, 16002, null),
(16003, "req3", "descr3", 0.03, 0.03, 16003, null),
(16004, "req4", "descr4", 0.04, 0.04, null, 16004);

INSERT INTO `tasks_category` (`id`, `name`, `parent_id`) VALUES
(16001, "t_c_1", null),
(16002, "t_c_2.1", 16001),
(16003, "t_c_3.1", 16001);

INSERT INTO `task` (`id`, `name`, `description`, `plan_time`, `difficulty`, `open_date`, `accept_date`, `close_date`, `category_id`, `requirement_id`, `module_id`, `employee_id`, `status`) VALUES
(16001, "task1", "desc1", 11, 0.1, "2014-11-11", "2014-11-12", null,         16002, 16001, null,  16001, 2),
(16002, "task2", "desc2", 12, 0.2, "2014-11-12", "2014-11-13", null,         16002, 16002, null,  16002, 1),
(16003, "task3", "desc3", 13, 0.3, "2014-11-13", "2014-11-14", "2014-11-15", 16003, null,  16004, 16005, 5);

INSERT INTO `tasks_dependency` (`id`, `task_id`, `dependent_task_id`) VALUE
(16001, 16001, 16002);