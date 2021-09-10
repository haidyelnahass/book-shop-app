const { Int32 } = require('bson');
const mongoose = require('mongoose');

const Schema = mongoose.Schema;


const bookSchema = new Schema({
    title: {
        type: String,
        required: true,
    },
    author: {
        type: String,
        required: true,
    },
    format: {
        type: String,
        required: true,
    },
    imageURL : {
        type: String,
        required: true,
    },
    rating: {
        type: Number,
    },
    description: {
        type: String,
        required: true,
    },
    creator: {
        type: Schema.Types.ObjectId,
    },
    amount: {
        type: Number,
        required: true,
    },
});

module.exports = mongoose.model('Book', bookSchema);