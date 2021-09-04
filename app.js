const mongoose = require('mongoose');
const express = require('express');

const authRoutes = require('./routes/auth');
const User = require('./models/user');
const cors = require('cors');
const bcrypt = require('bcryptjs');
const http = require('http');

const MONGODB_URI = 'mongodb+srv://haidy:nodejs@cluster0.jxnq9.mongodb.net/Library?retryWrites=true&w=majority'
const bodyParser = require('body-parser');
const app = express();
const server = http.createServer(app);

app.use(cors({
    origin: '*',
    methods:['GET', 'POST', 'DELETE', 'UPDATE', 'PUT', 'PATCH']
}));
app.use(bodyParser.json());
//add headers to the whole response to prevent CORS errors

// app.use((req,res,next) => {

//     console.log('Am I here?');

//     res.setHeader('Access-Control-Allow-Origin', '*');
//     // star(*) allows access of all clients.

//     // we need to tell client which methods are allowed

//     res.setHeader('Access-Control-Allow-Methods','GET, POST, PUT, PATCH, DELETE');

//     //allow headers to be set on client side

//     res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');

//     next();

// });

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

    server.listen(8000);
    console.log('Connected!!!!');

    // bcrypt.hash('1234',12)
    // .then(hashedPass => {
    //     const user = new User({
    //         email: 'test33@test.com',
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