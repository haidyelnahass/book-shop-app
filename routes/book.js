const express = require('express');
const router = express.Router();
const bookController = require('../controllers/book');
const isAuth = require('../middleware/isAuth');

//******************************************//
// USER ROUTES //
router.get('/books', bookController.getBooks);
router.post('/books',isAuth, bookController.postBook); 
router.get('/books/:bookId', bookController.getBook);

// //add to cart route
// router.post('/cart/:bookId', isAuth, bookController.addToCart);
// router.get('/cart', bookController.getCart);
// //my orders route
// router.get('/orders', bookController.getOrders);
// router.post('/checkout', isAuth, bookController.postCheckout);


// ADMIN ROUTES //
router.put('/books/:bookId', isAuth, bookController.updateBook); 
router.delete('/books/:bookId',isAuth, bookController.deleteBook); 


module.exports = router;