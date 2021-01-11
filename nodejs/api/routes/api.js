//Required
    const express = require('express');
    const router = express.Router();
    const pool = require('../data/config');
    const bcrypt = require('bcrypt');
    const jwt = require('jsonwebtoken');
    const cookieParser = require('cookie-parser');


//======================================================================================================================
//                                                      OFFICIAL ROUTES
//======================================================================================================================


//index.html : Create new user
router.post('/create_user', function(req, res) {

    //Console logs
    console.log('\u001b[34m A create_user request has been triggered. \033[0m');
    console.log(req.body);

    //Email check
    pool.query("SELECT pe_email FROM people WHERE pe_email='" + req.body.pe_email + "';", function(err, result) {
        if (result < 1 ) {
            //Encryption and user creation on database
            bcrypt.hash(req.body.pe_password, 10, function(err, hash) {
                if (err) throw err;
                console.log('\u001b[33m     > Password successfully encrypted. \u001b[0m');

                pool.query("INSERT INTO people(first_name, pe_name, pe_email, pe_password) VALUES ('" + req.body.first_name + "','" + req.body.pe_name + "','" + req.body.pe_email + "','" + hash + "');", function (err, result) {
                    if (err) throw err;
                    console.log('\u001b[33m     > User have been successfully created \u001b[0m');
                    res.status(200).json('User successfully created');
                        });
                    });
                }
        else {
            console.log("\u001b[31m   > Email address already exists, user creation aborted \u001b[0m");
            res.status(500).json('User address already taken');
        }
    });
});

//login.html : Login
router.post('/login', function(req, res) {
    //Console logs
    console.log('\u001b[36m A login request has been triggered. \u001b[0m');
    console.log(req.body);

    pool.query("SELECT pe_id ,pe_email, pe_password, pe_isadmin FROM people WHERE pe_email='" + req.body.pe_email + "';", function (err, result) {
        bcrypt.compare(req.body.pe_password, result[0].pe_password, function (err, results) {
            if (err) throw err;
            if (results) {
                console.log('\u001b[33m User successfully logged. \u001b[0m');

                    let token = jwt.sign({ id: result[0].pe_id, email:req.body.pe_email }, "test", {
                        expiresIn: 86400 // expires in 24 hours
                    });

                    res.status(200).send({ auth: true, token: token, isadmin: result[0].pe_isadmin });

        }
        else {
                console.log('\u001b[33m Password incorrect : Login failed. \u001b[0m');
                res.status(500).json("There was a problem with user's login cred.")
            }
        });
    });
});

//Log off route | TODO | Testing and working on it
router.get('/logout', function(req, res) {
    res.status(200).send({ auth: false, token: null });
});

//profile.html | TODO | Is it post or get ?
router.get('/profile', function(req,res) {
    pool.query("SELECT pe_name, pe_email, pe_address, city, postal_code, pe_number, pe_country WHERE pe_email='" + req.body.pe_email + "';", function(err, result){
        res.json(result);
    });
});

//profile.html
router.get('/offers_responded', function(req,res){
    pool.query("SELECT advertisement.ad_name, advertisement.ad_desc, company.co_name FROM job_application CROSS JOIN (advertisement, company) ON (advertisement.ad_id=job_application.ad_id AND company.co_id=job_application.su_co_id) WHERE job_application.pe_id='"+ req.body.pe_id + "';", function(err, result) {
        if (err) throw err;
        res.json(result);
    });
});

//home.html
//I aim here to create a more basic route, that grabs '15' the offers from the database.
router.get('/offers', function( req,res) {
    pool.query('SELECT advertisement.ad_id ,advertisement.ad_desc, company.co_name, ad_name, detail, ad_date FROM advertisement CROSS JOIN company ON company.co_id=advertisement.co_id; ', function(err, results) {
        if(err) throw err;
        console.log(results);
        res.status(200).json(results);
    });
});

//profile.html
router.put('/update_user', function(req,res){

    //Declare variables
    let arr_request = [];                           //Contains an array that stores the different request part, space them with coma.
    let sql_request_mod = "UPDATE people SET ";     //Contains the SQL request basis.
    let x = 0;                                      //Contains index navigation int to move in the array.
    let y = 0;                                      //Contains index to navigate in the loop.

    //Some fancy console outputs.
    console.log('\u001b[34mA profile update event have been triggered.\u001b[0m');

    //Core if cascade, to check if values are to be changed or not.
    if (req.body.pe_first_name == "" || req.body.pe_first_name == null) {
        console.log("\u001b[33m pe_first_name: null \u001b[0m");
    } else {
         arr_request[x] = "first_name='" + req.body.pe_first_name + "'";
        console.log(arr_request[x]);
        x++;
    }
    if (req.body.pe_last_name == "" || req.body.pe_last_name == null) {
        console.log("\u001b[33m pe_last_name: null \u001b[0m");
    } else {
        arr_request[x] = "pe_name='" + req.body.pe_last_name + "'";
        console.log(arr_request[x]);
        x++;
    }
    if (req.body.pe_email == "" || req.body.pe_email == null) {
        console.log("\u001b[33m pe_email: null \u001b[0m");
    } else {
        arr_request[x] = "pe_email='" + req.body.pe_email + "'";
        console.log(arr_request[x]);
        x++;
    }
    if (req.body.pe_tel == "" || req.body.pe_tel == null) {
        console.log("\u001b[33m pe_tel: null \u001b[0m");
    } else {
        arr_request[x] = "pe_number='" + req.body.pe_tel + "'";
        console.log(arr_request[x]);
        x++;
    }
    if (req.body.pe_address == "" || req.body.pe_address == null) {
        console.log("\u001b[33m pe_address: null \u001b[0m");
    } else {
        arr_request[x] = "pe_address='" + req.body.pe_address + "'";
        console.log(arr_request[x]);
        x++;
    }
    if (req.body.pe_postal == "" || req.body.pe_postal == null) {
        console.log("\u001b[33m pe_postal_code: null \u001b[0m");
    } else {
        arr_request[x] = "postal_code='" + req.body.pe_postal + "'";
        console.log(arr_request[x]);
        x++;
    }
    if (req.body.pe_country == "" || req.body.pe_country == null) {
        console.log("\u001b[33m pe_country: null \u001b[0m");
    } else {
        arr_request[x] = "pe_country='" + req.body.pe_country + "'";
        console.log(arr_request[x]);
        x++;
    }
    if (req.body.pe_password == "" || req.body.pe_password == null) {
        console.log("\u001b[33m pe_email: null \u001b[0m");
    } else {
        /*
            arr_request[x] = "pe_password='" + req.body.pe_password + "'"; //Not gonna use it now.
            console.log(arr_request[x]);
            x++;
         */
    }

while (y <= (x - 1)) {

    if (y == (x - 1)) {
        sql_request_mod = sql_request_mod + arr_request[y];
        y++;
    } else {
        sql_request_mod = sql_request_mod +  arr_request[y] + ",";
        y++;
    }
}
    //console.log("\u001b[35m> Request preview : " + sql_request_mod + "\u001b[0m");
    //console.log(req.body.tokenc);

    let i = 0;
    let arr_token = "";
    //while (req.body.tokenc[i] !== "=") {
    //    i++;
    //};
    //i++;

    while (req.body.tokenc[i] !== undefined) {
        if (req.body.tokenc[i] == "="){
            i++;
        }
        else {
            arr_token = arr_token + req.body.tokenc[i];
            i++;
        }
    }

    jwt.verify(arr_token, 'test', 'HS256'  ,function(err, decoded) {
      if (err) throw err;
      if (decoded) {
          sql_request_mod = sql_request_mod + " WHERE pe_id='" + decoded.id + "';"
          console.log("\u001b[35m> Request preview : " + sql_request_mod + "\u001b[0m");
          pool.query(sql_request_mod, function(err, results){
              if (err) throw err;
              console.log("\u001b[33m User infos successfully updated. \u001b[0m")
          })
      } else {
          console.log("Looks like there is no token at all.");
      }



    })
    res.status(204).json('Update complete');
});

//form.html
//Using post because I need to send some data through the request.
router.post('/get_user_info', function(req,res) {

    //Request to get the info for the user logged with the token.
    let i = 0;
    let arr_token = "";

    if ((req.body.tokenc != undefined) && (req.body.tokenc != "")) {

        while (req.body.tokenc[i] !== undefined) {
            if (req.body.tokenc[i] == "=") {
                i++;
            } else {
                arr_token = arr_token + req.body.tokenc[i];
                i++;
            }
        }


        jwt.verify(arr_token, 'test', 'HS256', function (err, decoded) {
            if (err) throw err;
            if (decoded) {
                pool.query("SELECT pe_name, first_name, pe_email, pe_number FROM people WHERE pe_id='" + decoded.id + "';", function (err, results) {
                    if (err) throw err;

                    //console.log(results);
                    res.status(200).json(results);
                });

            } else {
                console.log("Looks like there is no token at all.");
                res.status(500).json("Error.");
            }
        });
    } else {
        console.log("User not logged in, returning nothing");
        res.status(200).send("Nothing");
    }
});

//form.html
router.post('/create_job_application', function(req,res) {


    //Request to get the supervisor of the ad.
    //We already should have this intel, because the front will send us which ad we are talking about, so I decide
    //to skip this for the moment, and act like we already had everything
    //All this variables will disappear |TODO| Suppress this testing route when front is done.
    let su_id = '40';
    let co_id = '2';
    //let ad_id = '1';
    let ad_id = req.body.ad_id;

    //This is now the official route, but it needs the req.body.ad_id from form.html to work to be tested. |TODO| Wait for front to get those infos.
    //Request to get co_id and su_id
    pool.query("SELECT advertisement.co_id, supervisor.pe_id FROM advertisement CROSS JOIN supervisor ON supervisor.co_id=advertisement.co_id WHERE advertisement.co_id=" + req.body.ad_id + ";", function (err, resu){
        su_id = resu[0].pe_id;
        co_id = resu[0].co_id;
    });



    //Variable declare & init
    let i = 0;
    let arr_token = "";


    console.log(req.body.tokenc);
    if (req.body.tokenc !== undefined && (req.body.tokenc != "")) {


        while (req.body.tokenc[i] !== undefined) {
            if (req.body.tokenc[i] == "=") {
                i++;
            } else {
                arr_token = arr_token + req.body.tokenc[i];
                i++;
            }
        }
        jwt.verify(arr_token, 'test', 'HS256', function (err, decoded) {


            //Inserting data into the database
            if (decoded) {
                pool.query("INSERT INTO job_application(su_co_id, su_pe_id, pe_id, ad_id) VALUES ('" + co_id + "','" + su_id + "','" + decoded.id + "','" + ad_id + "');", function (err, result1) {
                    if (err) throw err;
                    console.log("Verified INSERT request done");
                    console.log(result1);
                });
            }
        });

    } else {

        //About this whole "visitor concept", I think this is going to be ugly because I will not be able to delete the visitor user after creating the job_application, so it's not a good solution,
        // but we don't have the time to do better, so it will be |TODO| Rethink temporary user handling globally.
        console.log("User is not verified, creating a ghost user to handle this");
        pool.query("INSERT INTO people (first_name, pe_name, pe_email, pe_number, pe_password) VALUES ('" + req.body.pe_first_name + "','" + req.body.pe_last_name + "','" + req.body.pe_email + "','" + req.body.pe_tel + "','tempghost');", function (err, result2) {
            if (err) throw err;
            pool.query("INSERT INTO job_application(su_co_id, su_pe_id, pe_id, ad_id) VALUES ('"+ co_id +"','" + su_id + "','" + result2.insertId + "','" + ad_id + "');", function (err, result2){
                if(err) throw err;
                //console.log(result2);
                console.log('\u001b[32m > A visitor have successfully applied to the job offer\u001b[0m');
            });

        });
    }
});



//======================================================================================================================
//                                                      TEST ROUTES
//======================================================================================================================

router.post('/logtest', function(req, res){
    res
        .writeHead(200, {
            "Set-Cookie": "token=encryptedstring; HttpOnly",
            "Access-Control-Allow-Credentials": "true"
        })
        .send();
});

router.get('/test', function(req, res) {
    if(!req.cookies.token) return res.status(401).send();
    res.status(200).json({ secret: "Ginger ale is a specific Root Beer" });
});


//======================================================================================================================
//                                                      GENERAL ROUTES
//======================================================================================================================

//GENERAL ROUTES
//POST - Get people from ID
router.get('/get_people/:id', function(req,res) {
    pool.query("SELECT * FROM people WHERE pe_id=" + req.params.id + ";", function(err, result) {
        if (err) throw err;
        res.send(result);
    });
});

//GET - READ - TESTS
router.get('/get_people', function(req, res) {
    pool.query("SELECT * FROM people;", function (err, result) {
        if (err) throw err;
        res.send(result);
    });
});
router.get('/get_company', function(req, res) {
     pool.query("SELECT * FROM company", function (err, result) {
         if (err) throw err;
         res.send(result);
     });
});
router.get('/get_advertisement', function(req,res) {
    pool.query("SELECT * FROM advertisement", function (err, result) {
        if (err) throw err;
        res.send(result);
    });
});
router.get('/get_job_application', function(req,res) {
    pool.query("SELECT * FROM job_application", function (err, result) {
        if (err) throw err;
        res.send(result);
    });
});
router.get('/get_people_skill', function(req,res) {
    pool.query("SELECT * FROM people_skill", function (err, result) {
        if (err) throw err;
        res.send(result);
    });
});
router.get('/get_required_skill', function(req,res) {
    pool.query("SELECT * FROM required_skill", function (err, result) {
        if (err) throw err;
        res.send(result);
    });
});
router.get('/get_supervisor', function(req,res) {
    pool.query("SELECT * FROM supervisor", function (err, result) {
        if (err) throw err;
        res.send(result);
    });
});
router.get('/get_skill', function(req,res) {
    pool.query("SELECT * FROM skill", function (err, result) {
        if (err) throw err;
        res.send(result);
    });
});
router.get('/get_application_mail', function(req,res) {
    pool.query("SELECT * FROM application_mail", function (err, result) {
        if (err) throw err;
        res.send(result);
    });
});

//GET - READ - FINAL
//Advertisement
router.get('/get_all_advertisement', function(req, res) {
    pool.query("SELECT * FROM advertisement;", function (err, result) {
        if (err) throw err;
        res.send(result);
    });
});
router.get('/get_advertisement/:city', function(req,res) {
   pool.query("SELECT * FROM advertisement WHERE company.city", function(err, result) {

   });
    //The advertisement should have a city linked to her, because an advertisement can have a different city than her linked company
});



//PUT - UPDATE
router.put('/update_people', function(req, res) {
    pool.query("UPDATE people SET first_name='Djimy', pe_name='Jgame' WHERE pe_id=3;", function(err, result) {
        if (err) throw err;
        res.send('User data updated successfully');
    });
});
router.put('/update_people/:id', function(req,res) {
    pool.query("UPDATE "+ req.params.id +" SET people WHERE pe_id=" + req.params.id + ";", function(err, result) {
        if (err) throw err;
        res.send(result);
    });
});





//TO BE COMPLETED

//DELETE - DELETE
router.delete('/delete_people', function(req, res) {
   pool.query("DELETE FROM people WHERE pe_id=4;", function(err, result) {
      if (err) throw err;
        res.send('User successfully deleted from database');
   });
});

router.delete('/delete_people/:id', function(req,res) {
    pool.query("DELETE FROM people WHERE pe_id = " + req.params.id + ";", function(err, result) {
        if (err) throw err;
        res.send(result);
    });
});

//DELETE - Delete people with ID condition
//router.delete('/delete_people/')




module.exports = router;