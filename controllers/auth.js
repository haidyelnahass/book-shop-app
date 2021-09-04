const User = require('../models/user');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { validationResult } = require('express-validator/check');


exports.postLogin = (req, res, next) => {
    console.log(req.body);

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


exports.postSignup = (req,res,next) => {

    const errors = validationResult(req);

    if (!errors.isEmpty()) {

        const error = new Error('Failed to validate!');
        error.statusCode = 422;
        error.data = errors.array();
        //to keep the errors retrieved by validation!
        throw error;

    }

    const email = req.body.email;
    const password = req.body.password;
    const name = req.body.name;

    bcrypt.hash(password, 12)
        .then(hashedPass => {
            const user = new User({
                email: email,
                password: hashedPass,
                name: name,
                books: [],
            });
            return user.save();
        })
        .then(result => {
            console.log(result);
            //reach out to db to create user

            res.status(201).json({
                message: 'User created successfully!',
                userId: result._id,
            })
        })
        .catch(err => {
            if (!err.statusCode) {
                err.statusCode = 500;
            }

            next(err);
        });

}