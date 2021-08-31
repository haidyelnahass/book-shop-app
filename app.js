const mongoose = require('mongoose');
const express = require('express');

const authRoutes = require('./routes/auth');
const User = require('./models/user');

const bcrypt = require('bcryptjs');

const MONGODB_URI = 'mongodb+srv://haidy:nodejs@cluster0.jxnq9.mongodb.net/Library?retryWrites=true&w=majority'
const bodyParser = require('body-parser');
const app = express();

app.use(bodyParser.json());

app.use(authRoutes);

app.use((error,req,res,next) => {
    console.log(error);

    const status = error.statusCode || 500;
    const message = error.message;
    const data = error.data;

    res.status(status).json({
        message: message,
        data: data
    })
});

mongoose.connect(MONGODB_URI, { useNewUrlParser: true, useUnifiedTopology: true })
.then(result => {

    app.listen(3030);
    console.log('Connected!!!!');

    // bcrypt.hash('1234',12)
    // .then(hashedPass => {
    //     const user = new User({
    //         email: 'test2@test.com',
    //         password: hashedPass,
    //         name: 'maxi'
    //     });
    
    //     return user.save();

    // })
    // .then(result => {
    //     console.log(result);
    // })
    // .catch(err => {
    //     console.log(err);
    // })

    
})
.catch(err => {
    console.log(err);
})