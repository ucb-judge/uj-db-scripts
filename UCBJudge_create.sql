-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-05-07 04:33:34.662

-- tables
-- Table: admitted_language
CREATE TABLE admitted_language (
    admitted_langauge_id serial  NOT NULL,
    problem_id int  NOT NULL,
    language_id int  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT admitted_language_pk PRIMARY KEY (admitted_langauge_id)
);

-- Table: campus
CREATE TABLE campus (
    campus_id serial  NOT NULL,
    name varchar(30)  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT campus_pk PRIMARY KEY (campus_id)
);

-- Table: campus_major
CREATE TABLE campus_major (
    campus_major_id serial  NOT NULL,
    major_id int  NOT NULL,
    campus_id int  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT campus_major_pk PRIMARY KEY (campus_major_id)
);

-- Table: catalog
CREATE TABLE catalog (
    catalog_id serial  NOT NULL,
    catalog_type_id int  NOT NULL,
    name varchar(60)  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT FA_catalog_pk PRIMARY KEY (catalog_id)
);

-- Table: catalog_hierarchy
CREATE TABLE catalog_hierarchy (
    catalog_hierarchy_id serial  NOT NULL,
    parent_catalog_id int  NOT NULL,
    child_catalog_id int  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT FA_CatalogHierarchy_pk PRIMARY KEY (catalog_hierarchy_id)
);

-- Table: catalog_type
CREATE TABLE catalog_type (
    catalog_type_id serial  NOT NULL,
    type varchar(60)  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT FA_catalog_type_pk PRIMARY KEY (catalog_type_id)
);

-- Table: clarification
CREATE TABLE clarification (
    clarification_id serial  NOT NULL,
    contest_problem_id int  NOT NULL,
    student_contest_id int  NOT NULL,
    professor_id int  NOT NULL,
    response varchar(255)  NOT NULL,
    question varchar(255)  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT clarification_pk PRIMARY KEY (clarification_id)
);

-- Table: comment
CREATE TABLE comment (
    kc_uuid varchar(30)  NOT NULL,
    comment_id serial  NOT NULL,
    submission_id int  NOT NULL,
    comment varchar(255)  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT comment_pk PRIMARY KEY (comment_id)
);

-- Table: contest
CREATE TABLE contest (
    contest_id int  NOT NULL,
    professor_id int  NOT NULL,
    starting_date timestamp  NOT NULL,
    ending_date timestamp  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT contest_pk PRIMARY KEY (contest_id)
);

-- Table: contest_problem
CREATE TABLE contest_problem (
    contest_problem_id serial  NOT NULL,
    problem_id int  NOT NULL,
    contest_id int  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT contest_problem_pk PRIMARY KEY (contest_problem_id)
);

-- Table: contest_scoreboard
CREATE TABLE contest_scoreboard (
    contest_scoreboard_id serial  NOT NULL,
    student_student_id int  NOT NULL,
    contest_contest_id int  NOT NULL,
    rank int  NOT NULL,
    problems_solved int  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT contest_scoreboard_pk PRIMARY KEY (contest_scoreboard_id)
);

-- Table: languages
CREATE TABLE languages (
    language_id int  NOT NULL,
    name varchar(30)  NOT NULL,
    extension varchar(5)  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT languages_pk PRIMARY KEY (language_id)
);

-- Table: major
CREATE TABLE major (
    major_id int  NOT NULL,
    name varchar(30)  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT major_pk PRIMARY KEY (major_id)
);

-- Table: problem
CREATE TABLE problem (
    problem_id serial  NOT NULL,
    professor_id int  NOT NULL,
    is_public smallint  NOT NULL,
    s3_description int  NOT NULL,
    max_time decimal(5,3)  NOT NULL,
    max_memory int  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT problem_pk PRIMARY KEY (problem_id)
);

-- Table: problem_tag
CREATE TABLE problem_tag (
    problem_tag_id serial  NOT NULL,
    problem_id int  NOT NULL,
    tag_id int  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT problem_tag_pk PRIMARY KEY (problem_tag_id)
);

-- Table: professor
CREATE TABLE professor (
    kc_uuid varchar(30)  NOT NULL,
    professor_id int  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT professor_pk PRIMARY KEY (professor_id)
);

-- Table: s3_object
CREATE TABLE s3_object (
    s3_object_id serial  NOT NULL,
    url varchar(100)  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT s3_object_pk PRIMARY KEY (s3_object_id)
);

-- Table: student
CREATE TABLE student (
    kc_uuid varchar(30)  NOT NULL,
    student_id int  NOT NULL,
    campus_major_id int  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY (student_id)
);

-- Table: student_contest
CREATE TABLE student_contest (
    student_contest_id serial  NOT NULL,
    contest_id int  NOT NULL,
    student_id int  NOT NULL,
    registered_on date  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT student_contest_pk PRIMARY KEY (student_contest_id)
);

-- Table: student_subject
CREATE TABLE student_subject (
    student_subject_id serial  NOT NULL,
    subject_id int  NOT NULL,
    student_id int  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT student_subject_pk PRIMARY KEY (student_subject_id)
);

-- Table: subject
CREATE TABLE subject (
    subject_id int  NOT NULL,
    professor_id int  NOT NULL,
    name varchar(50)  NOT NULL,
    code varchar(10)  NOT NULL,
    campus_major_id int  NOT NULL,
    date_from date  NOT NULL,
    date_to date  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT subject_pk PRIMARY KEY (subject_id)
);

-- Table: submission
CREATE TABLE submission (
    submission_id int  NOT NULL,
    student_id int  NOT NULL,
    s3_source_code int  NOT NULL,
    language_id int  NOT NULL,
    contest_problem_id int  NOT NULL,
    verdict_type_id int  NOT NULL,
    submission_date timestamp  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT submission_pk PRIMARY KEY (submission_id)
);

-- Table: tag
CREATE TABLE tag (
    tag_id int  NOT NULL,
    name varchar(50)  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT tag_pk PRIMARY KEY (tag_id)
);

-- Table: testcase
CREATE TABLE testcase (
    testcase_id serial  NOT NULL,
    problem_id int  NOT NULL,
    tescase_number int  NOT NULL,
    s3_testcase int  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT testcase_pk PRIMARY KEY (testcase_id)
);

-- Table: testcase_submission
CREATE TABLE testcase_submission (
    tescase_submission_id serial  NOT NULL,
    testcase_id int  NOT NULL,
    verdict_type_id int  NOT NULL,
    submission_id int  NOT NULL,
    memory int  NOT NULL,
    time decimal(5,3)  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT testcase_submission_pk PRIMARY KEY (tescase_submission_id)
);

-- Table: verdict_type
CREATE TABLE verdict_type (
    verdict_type_id int  NOT NULL,
    description varchar(20)  NOT NULL,
    abbreviation varchar(4)  NOT NULL,
    status smallint  NOT NULL,
    CONSTRAINT verdict_type_pk PRIMARY KEY (verdict_type_id)
);

-- foreign keys
-- Reference: FA_CatalogHierarchy_FA_Catalog (table: catalog_hierarchy)
ALTER TABLE catalog_hierarchy ADD CONSTRAINT FA_CatalogHierarchy_FA_Catalog
    FOREIGN KEY (parent_catalog_id)
    REFERENCES catalog (catalog_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FA_CatalogHierarchy_FA_catalog (table: catalog_hierarchy)
ALTER TABLE catalog_hierarchy ADD CONSTRAINT FA_CatalogHierarchy_FA_catalog
    FOREIGN KEY (child_catalog_id)
    REFERENCES catalog (catalog_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FA_Catalog_FA_CatalogType (table: catalog)
ALTER TABLE catalog ADD CONSTRAINT FA_Catalog_FA_CatalogType
    FOREIGN KEY (catalog_type_id)
    REFERENCES catalog_type (catalog_type_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: admitted_languages_languages (table: admitted_language)
ALTER TABLE admitted_language ADD CONSTRAINT admitted_languages_languages
    FOREIGN KEY (language_id)
    REFERENCES languages (language_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: admitted_languages_problem (table: admitted_language)
ALTER TABLE admitted_language ADD CONSTRAINT admitted_languages_problem
    FOREIGN KEY (problem_id)
    REFERENCES problem (problem_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: campus_major_campus (table: campus_major)
ALTER TABLE campus_major ADD CONSTRAINT campus_major_campus
    FOREIGN KEY (campus_id)
    REFERENCES campus (campus_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: campus_major_major (table: campus_major)
ALTER TABLE campus_major ADD CONSTRAINT campus_major_major
    FOREIGN KEY (major_id)
    REFERENCES major (major_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: clarification_contest_problem (table: clarification)
ALTER TABLE clarification ADD CONSTRAINT clarification_contest_problem
    FOREIGN KEY (contest_problem_id)
    REFERENCES contest_problem (contest_problem_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: clarification_professor (table: clarification)
ALTER TABLE clarification ADD CONSTRAINT clarification_professor
    FOREIGN KEY (professor_id)
    REFERENCES professor (professor_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: clarification_student_contest (table: clarification)
ALTER TABLE clarification ADD CONSTRAINT clarification_student_contest
    FOREIGN KEY (student_contest_id)
    REFERENCES student_contest (student_contest_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: comments_submission (table: comment)
ALTER TABLE comment ADD CONSTRAINT comments_submission
    FOREIGN KEY (submission_id)
    REFERENCES submission (submission_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: contest_problem_contest (table: contest_problem)
ALTER TABLE contest_problem ADD CONSTRAINT contest_problem_contest
    FOREIGN KEY (contest_id)
    REFERENCES contest (contest_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: contest_problem_problem (table: contest_problem)
ALTER TABLE contest_problem ADD CONSTRAINT contest_problem_problem
    FOREIGN KEY (problem_id)
    REFERENCES problem (problem_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: contest_professor (table: contest)
ALTER TABLE contest ADD CONSTRAINT contest_professor
    FOREIGN KEY (professor_id)
    REFERENCES professor (professor_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: contest_scoreboard_contest (table: contest_scoreboard)
ALTER TABLE contest_scoreboard ADD CONSTRAINT contest_scoreboard_contest
    FOREIGN KEY (contest_contest_id)
    REFERENCES contest (contest_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: contest_scoreboard_student (table: contest_scoreboard)
ALTER TABLE contest_scoreboard ADD CONSTRAINT contest_scoreboard_student
    FOREIGN KEY (student_student_id)
    REFERENCES student (student_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: problem_professor (table: problem)
ALTER TABLE problem ADD CONSTRAINT problem_professor
    FOREIGN KEY (professor_id)
    REFERENCES professor (professor_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: problem_tag_problem (table: problem_tag)
ALTER TABLE problem_tag ADD CONSTRAINT problem_tag_problem
    FOREIGN KEY (problem_id)
    REFERENCES problem (problem_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: problem_tag_tag (table: problem_tag)
ALTER TABLE problem_tag ADD CONSTRAINT problem_tag_tag
    FOREIGN KEY (tag_id)
    REFERENCES tag (tag_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: student_campus_major (table: student)
ALTER TABLE student ADD CONSTRAINT student_campus_major
    FOREIGN KEY (campus_major_id)
    REFERENCES campus_major (campus_major_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: student_contest_contest (table: student_contest)
ALTER TABLE student_contest ADD CONSTRAINT student_contest_contest
    FOREIGN KEY (contest_id)
    REFERENCES contest (contest_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: student_contest_student (table: student_contest)
ALTER TABLE student_contest ADD CONSTRAINT student_contest_student
    FOREIGN KEY (student_id)
    REFERENCES student (student_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: student_subject_student (table: student_subject)
ALTER TABLE student_subject ADD CONSTRAINT student_subject_student
    FOREIGN KEY (student_id)
    REFERENCES student (student_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: student_subject_subject (table: student_subject)
ALTER TABLE student_subject ADD CONSTRAINT student_subject_subject
    FOREIGN KEY (subject_id)
    REFERENCES subject (subject_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: subject_campus_major (table: subject)
ALTER TABLE subject ADD CONSTRAINT subject_campus_major
    FOREIGN KEY (campus_major_id)
    REFERENCES campus_major (campus_major_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: subject_professor (table: subject)
ALTER TABLE subject ADD CONSTRAINT subject_professor
    FOREIGN KEY (professor_id)
    REFERENCES professor (professor_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: submission_contest_problem (table: submission)
ALTER TABLE submission ADD CONSTRAINT submission_contest_problem
    FOREIGN KEY (contest_problem_id)
    REFERENCES contest_problem (contest_problem_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: submission_languages (table: submission)
ALTER TABLE submission ADD CONSTRAINT submission_languages
    FOREIGN KEY (language_id)
    REFERENCES languages (language_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: submission_student (table: submission)
ALTER TABLE submission ADD CONSTRAINT submission_student
    FOREIGN KEY (student_id)
    REFERENCES student (student_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: submission_verdict_type (table: submission)
ALTER TABLE submission ADD CONSTRAINT submission_verdict_type
    FOREIGN KEY (verdict_type_id)
    REFERENCES verdict_type (verdict_type_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: testcase_problem (table: testcase)
ALTER TABLE testcase ADD CONSTRAINT testcase_problem
    FOREIGN KEY (problem_id)
    REFERENCES problem (problem_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: testcase_submission_submission (table: testcase_submission)
ALTER TABLE testcase_submission ADD CONSTRAINT testcase_submission_submission
    FOREIGN KEY (submission_id)
    REFERENCES submission (submission_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: testcase_submission_testcase (table: testcase_submission)
ALTER TABLE testcase_submission ADD CONSTRAINT testcase_submission_testcase
    FOREIGN KEY (testcase_id)
    REFERENCES testcase (testcase_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: testcase_submission_verdict_type (table: testcase_submission)
ALTER TABLE testcase_submission ADD CONSTRAINT testcase_submission_verdict_type
    FOREIGN KEY (verdict_type_id)
    REFERENCES verdict_type (verdict_type_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

