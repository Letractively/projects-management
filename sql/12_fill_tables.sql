/* users_group
   12101-12110
*/
INSERT INTO users_group (id,name,parent_id)
VALUES
  ( 12101, 'дизайнеры', null),
  ( 12102, 'тестировщики', null),
  ( 12103, 'разработчики', null);
/* user
   12000-12100
*/
INSERT INTO `user` (`id`, `name`, `password`, `first_name`, `middle_name`, `last_name`, `is_admin`, `group_id`)
	VALUES (12001, "user6", "pass1", "Иван", "Иванович", "Иванов", false, 12101),
		   (12002, "user7", "pass2", "Сидр", "Сидорович", "Сидоров", false, 12102),
		   (12003, "user8", "pass3", "Петр", "Петрович", "Петров", false, 12103);

/* contact_type
   12111-12120
*/
INSERT INTO contacts_type (id,name,`regexp`)
VALUES
  ( 12111, 'mobile', 'regexp for mobile number' ),
  ( 12112, 'eMail', 'regexp for email' ),
  ( 12113, 'address', 'regexp for address' );

/* contact
    12121-12200
*/
/* mobile */

INSERT INTO contact (id,name,user_id,type_id)
VALUES
  ( 12121, '111-11-11', 12003, 12111 ),
  ( 12122, '222-22-22', 12001, 12111 ),
  ( 12123, '333-33-33', 12002, 12111 ),
/* eMail */
  ( 12126, 'users1@mail.ru', 12003, 12112 ),
  ( 12127, 'users2@gmail.com', 12001, 12112 ),
  ( 12128, 'users3@yandex.ru', 12002, 12112 ),
/* address */
  ( 12131, 'ул.Лазо 1', 12002, 12113 ),
  ( 12132, 'ул.Ленина 2', 12001, 12113 ),
  ( 12134, 'ул.Фрунзе 3', 12003, 12113 );

/* projects_category
  12201-12210
*/
INSERT INTO projects_category (id,name,parent_id)
VALUES
  ( 12201, 'Java', NULL ),
  ( 12202, 'С++', NULL ),
  ( 12203, 'С#', NULL );
	
/* project
   12211-12220
*/
INSERT INTO project (id,name,description,category_id,manager_id)
VALUES
  ( 12211, 'MucicS', 'Music Search', 12201, 12001 ),
  ( 12212, 'Steam', 'Steam Game Shop', 12203, 12001 );

/* team
  12221-12230
*/
INSERT INTO team (id,project_id,leader_id)
VALUES
  ( 12221, 12211, 12002 ),
  ( 12222, 12212, 12003 );

/* employee
    12231-12240
 */
/*first team*/
INSERT INTO employee (id,user_id,team_id,role)
VALUES
  ( 12231, 12001, 12221, 0 ),
  ( 12232, 12002, 12221, 0 ),
  ( 12233, 12003, 12221, 1 ),

/*second team*/
  ( 12234, 12003, 12222, 0 ),
  ( 12235, 12002, 12222, 0 ),
  ( 12236, 12001, 12222, 1 );

/* module
   12241-12250
*/
INSERT INTO module (id,name,parent_id,project_id)
VALUES
  ( 12241, 'front', NULL, 12211),
  ( 12242, 'back', NULL, 12211);

/* actor
   12251-12260
 */
INSERT INTO actor (id,name,project_id)
VALUES ( 12251 , 'Пользователь MucicS' , 12211 );

/* use_case
   12261-12270
*/
INSERT INTO use_case (id,name,module_id)
VALUES ( 12261, 'Выполнение поискового запроса', 12241);


/* actor_use_case_relation
   12271-12280
*/
INSERT INTO actor_use_case_relation (id,actor_id,use_case_id)
VALUES ( 12271, 12251, 12261);

/* requirement
   12281-12290
*/
INSERT INTO requirement (id,name,description,importance,change_probability,use_case_id,module_id)
VALUES ( 12281, 'Основное требование' , 'Создать web-поисковик музыки' , 1 , 0 , NULL , NULL );

/* task_category
  12291-12299
*/
INSERT INTO tasks_category (id,name,parent_id)
VALUES
  ( 12291, 'Важная', NULL ),
  ( 12292, 'Обычная', NULL ),
  ( 12293, 'Не важная', NULL );

/* task
   12300-12400
*/
INSERT INTO task (id,name,description,plan_time,difficulty,open_date,accept_date,close_date,category_id,requirement_id,module_id,employee_id,status)
VALUES
  (12002, "task2", "desc2", 12, 0.2, "2014-11-12", "2014-11-13", null,12291, 12281, null,  12231, 1),
(12003, "task3", "desc3", 13, 0.3, "2014-11-13", "2014-11-14", "2014-11-15", 12292, null,  12241, 12232, 5);
