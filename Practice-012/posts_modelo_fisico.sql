DROP DATABASE IF EXISTS posts;
CREATE DATABASE posts CHARACTER SET utf8mb4;
USE posts;

CREATE TABLE tb_users (
    user_id INT(30) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(60) NOT NULL,
    user_last_name VARCHAR(60) NOT NULL,
    user_birthday DATE NOT NULL,
    user_email VARCHAR(140) UNIQUE NOT NULL,
    user_password VARCHAR(200) NOT NULL,
    user_temp_password VARCHAR(200) DEFAULT NULL,
    user_force_change enum('Y','N') NOT NULL DEFAULT 'Y',
    user_status enum('Active','Inactive') NOT NULL DEFAULT 'Active',
    user_role enum('Programador','Fotografo','Diseñador','Escritor','Musico'),
    user_imagen VARCHAR(300) DEFAULT'https://cdn0.iconfinder.com/data/icons/avatars-3/512/avatar_beanie_girl-512.png',
    user_role_other VARCHAR(60),
    user_ranked int(2),
    user_creation TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE tb_dats_users(
  dats_id INT(30) PRIMARY KEY AUTO_INCREMENT,
  dats_address VARCHAR(120),
  dats_education VARCHAR(220),
  dats_skills text,
  dats_interestings text,
  dats_gender ENUM('M', 'F'),
  dats_user_fk INT NOT NULL,
  dats_update TIMESTAMP default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (dats_user_fk) REFERENCES tb_users(user_id)
);

CREATE TABLE tb_posts(
    post_id INT(30) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    post_title VARCHAR(120) Not Null,
    post_content TEXT Not null,
    post_imagen VARCHAR(300),
    post_video VARCHAR(300),
    post_role enum('Programacion','Fotografia','Diseño','Escritos','Musica'),
    post_status enum('Active','Inactive') NOT NULL DEFAULT 'Active',
    post_user_fk INT NOT NULL,
    FOREIGN KEY (post_user_fk) REFERENCES tb_users(user_id),
    post_creation TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    post_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE tb_comments(
    comment_id INT(30) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    comment_content TEXT NOT NULL,
    comment_imgen VARCHAR(300),
    comment_status enum('Active','Inactive') NOT NULL DEFAULT 'Active',
    comment_user_fk INT NOT NULL,
    comment_creation TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    comment_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (comment_user_fk) REFERENCES tb_users(user_id)
);

/*--eliminar esto
CREATE TABLE tb_users_posts(
    users_posts_id INT(30) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_fk INT NOT NULL,
    FOREIGN KEY (user_fk) REFERENCES tb_users(user_id),
    FOREIGN KEY (post_fk) REFERENCES tb_posts(post_id)
);*/

CREATE TABLE tb_posts_comments(
    post_comments_id INT(30) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    post_fk INT NOT NULL,
    comment_fk INT NOT NULL,
    FOREIGN KEY (post_fk) REFERENCES tb_posts(post_id),
    FOREIGN KEY (comment_fk) REFERENCES tb_comments(comment_id)
);

CREATE TABLE tb_favorites_profiles(
    favorite_profile_id INT(30) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fp_user_fk INT NOT NULL,
    profile_saved_fk INT NOT NULL,
    FOREIGN KEY (fp_user_fk) REFERENCES tb_users(user_id),
    FOREIGN KEY (profile_saved_fk) REFERENCES tb_users(user_id)
);

CREATE TABLE tb_ranks_profiles(
    rank_profile_id INT(30) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rank_number INT NOT NULL DEFAULT 0,
    profile_ranked_fk INT NOT NULL,
    FOREIGN KEY (profile_ranked_fk) REFERENCES tb_users(user_id)
);

CREATE TABLE tb_favorites_posts(
    favorite_post_id INT(30) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    post_fk INT NOT NULL,
    user_fk INT NOT NULL,
    user_fv INT NOT NULL,
    FOREIGN KEY (post_fk) REFERENCES tb_posts(post_id),
    FOREIGN KEY (user_fk) REFERENCES tb_users(user_id),
    FOREIGN KEY (user_fv) REFERENCES tb_users(user_id)
);

CREATE TABLE tb_notes(
    note_id INT(30) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    note_title VARCHAR(120) NOT NULL,
    note_content TEXT NOT NULL,
    note_status enum('Active','Inactive') NOT NULL DEFAULT 'Active',
    note_user_fk INT NOT NULL,
    note_creation TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    note_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (note_user_fk) REFERENCES tb_users(user_id)
);
 
