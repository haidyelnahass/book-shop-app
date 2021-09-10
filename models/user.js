const mongoose = require('mongoose');
const book = require('./book');

const Schema = mongoose.Schema;


const userSchema = new Schema({

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
    cart: {
        items: [{ //we will have an array of docs.
            bookId: {
                type: Schema.Types.ObjectId,
                ref: 'Book',
                required: true
            },
            amount: { type: Number, required: true }
        }]
    },
    role: {
        type: String,
        default: 'User',
    },
    books: [{
        type: Schema.Types.ObjectId,
        ref: 'Book',
    }]

}, { timestamps: true });
userSchema.pre('remove', function (next) {
    //on deletion of user, delete all related books.
    book.remove({ creator: this._id }).exec();
    next();
});

userSchema.methods.addToCart = function (product) {

    const cartProductIndex = this.cart.items.findIndex(cp => {
        console.log(cp.productID);
        return cp.productID.toString() === product._id.toString();
    });


    const updatedCartItems = [...this.cart.items];

    let newQty = 1;
    if (cartProductIndex >= 0) {
        newQty = this.cart.items[cartProductIndex].qty + 1;
        updatedCartItems[cartProductIndex].qty = newQty;
    }
    else {
        updatedCartItems.push({
            productID: product._id,
            qty: newQty
        });
    }

    //code to add product or update

    //get all cart items

    //we can now edit the cart

    const updatedCart = { items: updatedCartItems };
    this.cart = updatedCart;
    //object can save itself
    return this.save();
};

userSchema.methods.removeFromCart = function (productId) {
    const updatedCartItems = this.cart.items.filter(item => {
        return item.productId.toString() !== productId.toString();
    });
    this.cart.items = updatedCartItems;
    return this.save();
};

userSchema.methods.clearCart = function () {
    this.cart = { items: [] };
    return this.save();
};



module.exports = mongoose.model('User', userSchema);
