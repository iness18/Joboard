
<h1>SQL Structure</h1>
<table>
    <tr>
        <td>SQL</td>
        <td>General Database management</td>
    </tr>
</table>

<h3>Database structure : joboard</h3>
<details><summary>Click me to show content !</summary>
For an easier read, I suggest you take a look at 

[the database structure file](./doc/database_structure.rtf)

```sql
TABLE advertisement { ad_id (PK), ad_name, ad_desc, detail, ad_date, company (#) }
TABLE company { co_id (PK), co_name, co_address, postal_code, city, contact_number, website, co_desc }
TABLE people { pe_id (PK), first_name, pe_name, pe_number, address, postal_code, city, pe_email, cv }
TABLE skill { sk_id (PK), sk_name, sk_desc }
TABLE supervisor { id_comp (#PK) ,id_people (#PK) }
TABLE people_skill { id_people (#PK), id_skill (#PK) }
TABLE required_skill { id_ad (#PK), id_skill (#PK) }
TABLE job_application { id_supervisor (#PK), id_people (#PK), id_ad (#PK) }
TABLE application_mail { id_mail (PK), id_people (#), id_supervisor (#) }
```


</details>

<h3> Database creation steps :</h3>

<details><summary>Click me to show content !</summary>
<h6>1. XAMPP Configuration</h6>
    
    The goal here is to setup XAMPP so we can start working on MariaDB,
    we chose MariaDB because it goes along with XAMPP, and does the job well.
    
   
<h6>2. Creating database</h6>
    
```sql
CREATE DATABASE IF NOT EXISTS joboard;
```

<h6>Creating unlinked tables</h6>
<p>We are first working on tables that have no direct links with other : company, people, skill</p>

```sql
/* company */
CREATE TABLE company (
    co_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    co_name VARCHAR(50),
    co_address VARCHAR(255),
    postal_code VARCHAR(20),
    city VARCHAR(50),
    contact_number VARCHAR(10),
    website VARCHAR(255),
    comp_desc MEDIUMTEXT 
);

/* people */
CREATE TABLE people (
    pe_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    pe_name VARCHAR(50),
    pe_address VARCHAR(255),
    postal_code VARCHAR(20),
    city VARCHAR(50),
    pe_number VARCHAR(10),
    pe_email VARCHAR(100),
    CV LONGBLOB
);
/* I chose longblob to handle pdf CV, seems like a promising solution to explore */

CREATE TABLE skill (
    sk_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sk_name VARCHAR(255),
    sk_desc MEDIUMTEXT
);
```

<h6>Creating linked tables</h6>  
<p>The goal here is to make links between tables, and to be sure the same data isn't stored twice in the database<br />
so we have to create concatenated foreign to primary key to be able to link multiple required skills to an advertisement<br />
for example.</p>

```sql
CREATE TABLE supervisor (
    co_id INTEGER,
    pe_id INTEGER,
    PRIMARY KEY(co_id, pe_id),
    FOREIGN KEY(co_id) REFERENCES company(co_id),
    FOREIGN KEY(pe_id) REFERENCES people(pe_id)
);

/* Here we concatenate two foreign key to make them a primary one */

CREATE TABLE people_skill (
    pe_id INTEGER,
    sk_id INTEGER,
    PRIMARY KEY (pe_id, sk_id),
    FOREIGN KEY (pe_id) REFERENCES people(pe_id),
    FOREIGN KEY (sk_id) REFERENCES skill(sk_id)
);

CREATE TABLE advertisement (
    ad_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    ad_name VARCHAR(255),
    ad_desc MEDIUMTEXT,
    detail MEDIUMTEXT,
    ad_date DATETIME,
    co_id INTEGER,
    FOREIGN KEY (co_id) REFERENCES company(co_id)
);

CREATE TABLE required_skill (
    ad_id INTEGER,
    sk_id INTEGER,    
    PRIMARY KEY(ad_id, sk_id),
    FOREIGN KEY(ad_id) REFERENCES advertisement(ad_id),
    FOREIGN KEY(sk_id) REFERENCES skill(sk_id)
);

CREATE TABLE job_application (
    su_co_id INTEGER,
    su_pe_id INTEGER,
    pe_id INTEGER,
    ad_id INTEGER,
    PRIMARY KEY(su_co_id, su_pe_id, pe_id, ad_id),
    FOREIGN KEY (su_co_id, su_pe_id) REFERENCES supervisor(co_id, pe_id),
    FOREIGN KEY (pe_id) REFERENCES people(pe_id),
    FOREIGN KEY (ad_id) REFERENCES advertisement(ad_id)
);

/* Here we use the composite primary key from supervisor as a foreign key */

CREATE TABLE application_mail (
    id_mail INTEGER UNIQUE AUTO_INCREMENT,
    su_co_id INTEGER,
    su_pe_id INTEGER,
    pe_id INTEGER,
    ad_id INTEGER,
    PRIMARY KEY (id_mail, su_co_id, su_pe_id, pe_id, ad_id),
    FOREIGN KEY (su_co_id, su_pe_id, pe_id, ad_id) REFERENCES job_application(su_co_id, su_pe_id, pe_id, ad_id)
);
```  

<h6>Inject data</h6>
To test if every link works well, we now have to input some data in every table, with the INSERT sql request

```sql
INSERT INTO company(co_name, co_address, postal_code, city, contact_number, website, comp_desc) VALUES (
    'Denis Corp',
    '201 rue des paquerettes',
    '69001',
    'Lyon',
    '0102030405',
    'www.google.fr',
    'This is a test company description to see if everything works well'
);
```

To check if our first INPUT worked fine, we are gonna make a SELECT sql request type
   
```sql
SELECT * FROM company WHERE co_name='Denis Corp';
```


[Request result](./img/req_result.png)

As you can see, the request worked fine, we can then focus on making more INPUT requests :

```sql
INSERT INTO people (first_name, pe_name, pe_address, postal_code, city, pe_number, pe_email) VALUES ('Denis','Valsons','05 rue Thisaddressdoesntexist','69001','Lyon','0123456789','denis.test@gmail.com');

INSERT INTO people (first_name, pe_name, pe_address, postal_code, city, pe_number, pe_email) VALUES ('John','Smith','10 rue Ilovesquash','69007','Lyon','0123456789','john.smith.test@gmail.com');

INSERT INTO skill (sk_name, sk_desc) VALUES ('SQL','SQL is the language that allow interaction with databases');

INSERT INTO supervisor (co_id, pe_id) VALUES ('1','1');

INSERT INTO advertisement (ad_name, ad_desc, detail, ad_date, co_id) VALUES ('Recherche alternant dev Full Stack','Nous recherchons un alternant dev fullstack','Open space, remuneration en Mojito envisageable','2020-08-29','1');

INSERT INTO required_skill (ad_id, sk_id) VALUES ('1','1');

INSERT INTO job_application (su_co_id, su_pe_id, pe_id, ad_id) VALUES ('1','1','2','1');
/* TOTHINK : Doing this request I wonder if I should improve this table, it seems highly perfectible */

INSERT INTO application_mail (su_co_id, su_pe_id, pe_id, ad_id) VALUES ('1','1','2','1');
```
</details>

<h3> Temporary |  Exporting database :</h3>

<details><summary>Click me to show content !</summary>


Now that database is created and have some content, let's share it, you can find it here :

[Database : joboard](./joboard.sql)

</details>

<h3>Updating database structure :</h3>

<details><summary>Click me to show content !</summary>

<table>
    <tr>
        <td>Version : 0.1</td>
        <td>Changelog</td>
    </tr>
</table>

 Modifying the way CV are stored, now they will be stored in table people and job_application.
 The logic behind this is that a person should be able to create a CV for a particular offer,
 and also have a CV all the time on his profile. Also Front needs to send cover letter too, so let's
 add this too.
 
```sql
ALTER TABLE job_application
ADD (pe_cv LONGBLOB,
    pe_cl LONGBLOB);
```     


<table>
    <tr>
        <td>Version : 0.2</td>
        <td>Changelog</td>
    </tr>
</table>

I considered the fact that email address should be unique.

```sql
ALTER TABLE people ADD UNIQUE (pe_email);
```


<table>
    <tr>
        <td>Version : 0.3</td>
        <td>Changelog</td>
    </tr>
</table>


Front suggested that users should have password.
Writing password in clear inside the database is a bad idea, so we decided to get a better look at encryption, we chose bcrypt as it seems to be one of the best at the moment

```sql
ALTER TABLE people ADD pe_password VARCHAR(255);
```

<table>
    <tr>
        <td>Version : 0.4</td>
        <td>Changelog</td>
    </tr>
</table>

Front suggested that job research should have contract type, also an user should have a country.

```sql
ALTER TABLE people ADD pe_country VARCHAR(255);
ALTER TABLE company ADD co_country VARCHAR(255);
ALTER TABLE advertisement ADD ad_country VARCHAR(255);
ALTER TABLE advertisement ADD ad_contract_type VARCHAR(255);
```

<table>
    <tr>
        <td>Version : 0.5</td>
        <td>Changelog</td>
    </tr>
</table>

Front added a profile picture zone, so we add it in the database to store the image.

```sql
ALTER TABLE people ADD pe_profile_picture BLOB;
```

<table>
    <tr>
        <td>Version : 0.6</td>
        <td>Changelog</td>
    </tr>
</table>

Front needs to know if an user is admin or not, adding a pe_type column in people table.

```sql
ALTER TABLE people ADD pe_isadmin BOOLEAN;
```

</details>

