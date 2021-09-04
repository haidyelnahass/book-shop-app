const mongoose = require('mongoose');

const Schema = mongoose.Schema;


const UserSchema = new Schema({

    email: {
        type: String,
        required: true,
    },
    password: {
        type: String, 
        required: true,
    },
    name: {
        type: String,
        required: true,
    },
    books: [{
        type: Schema.Types.ObjectId,
        ref: 'Book'
    }]

}, {timestamps: true});


module.exports = mongoose.model('User',UserSchema);
