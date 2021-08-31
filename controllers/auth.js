const User = require('../models/user');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
exports.postLogin = (req, res, next) => {

    const email = req.body.email;
    const password = req.body.password;
    console.log(email);
    console.log(password);
    

    //find if email address exists 
    let loadedUser;
    User.findOne({
        email: email
    })
        .then(user => {
            if (!user) {
                const error = new Error('No user retrieved!');
                error.statusCode = 401;
                throw error;
            }

            loadedUser = user;
            return bcrypt.compare(password, user.password);

        })
        .then(isEqual => {
            if (!isEqual) {
                const error = new Error('wrong password!!!');
                error.statusCode = 401;
                throw error;
            }
            //we want to generate jwt
            const token = jwt.sign({
                email: loadedUser.email,
                userId: loadedUser._id.toString()
            }, 'supersecretstring', {
                expiresIn: '2h',
            });

            //creates new signature and packs it into the token
            //the second argument is the private key 
            //which is used for signing, only known to the server

            //third argument configures the token


            return res.status(200).json({
                token: token,
                userId: loadedUser._id.toString()
            })
        })
        .catch(err => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }

            next(err);
        });

};