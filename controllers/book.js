const Book = require('../models/book');
const User = require('../models/user');


exports.getBooks = (req,res,next) => {

    Book.find()
    .then(books => {
        if(!books) {
            const error = new Error('no books found in database!');
            error.statusCode = 400;
            throw error;
        }

        return res.status(200).json(books);
    })
    
}
exports.postBook = (req,res,next) => {
    const title = req.body.title;
    const description = req.body.description;
    const imageURL = req.body.imageURL;
    const author = req.body.author;
    const format = req.body.format;
    const amount = req.body.amount;
    const userId = req.userId;

    const book = new Book({
        title: title,
        description: description,
        imageURL: imageURL,
        author: author,
        format: format,
        amount: amount,
        creator: userId,
    });
    let newUser;
    book.save()
    .then(book => {

        return User.findById(userId);

    })
    .then(user => {
        if(!user) {
            const error = new Error('No user with this id!');
            throw error;
        }
        newUser = user;
       return newUser.books.push(book);

    })
    .then(result => {
        return newUser.save();
    })
    .then(() => {
        return res.status(201).json({
            message: "Book created successfully!",
            book: book,
        })
    })
    .catch(err => {
        next(err);
    }) 

}
exports.getBook = (req,res,next) => {
    const bookId = req.params.bookId;

    Book.findById(bookId)
    .then(book => {
        if(!book) {
            const error = new Error('No book found!');
            throw error;
        }

        return res.status(200).json({
            message: "Book fetched successfully!",
            book: book,
        })
        

    })
    .catch(err => {
        next(err);
    })

}
exports.updateBook = (req,res,next) => {
    const title = req.body.title;
    const description = req.body.description;
    const imageURL = req.body.imageURL;
    const author = req.body.author;
    const format = req.body.format;
    const amount = req.body.amount;
    const bookId = req.params.bookId;


    Book.findById(bookId)
    .then(book => {
        if(!book) {
            const error = new Error('No book found!');
            throw error;
        }
        if(book.creator.toString() !== req.userId) {
            const error = new Error('Unauthorized!');
            throw error;
        }

        book.title = title;
        book.description = description;
        book.imageURL = imageURL;
        book.amount = amount;
        book.author = author;
        book.format = format;

        return book.save();


    })
    .then(book => {
        return res.status(200).json({
            message: "Book updated successfully!",
            book: book,
        })
    })
    .catch(err => {
        next(err);
    })

}
exports.deleteBook = (req,res,next) => {
    const bookId = req.params.bookId;

    Book.findById(bookId)
        .then((book) => {
            if (!book) {
                const error = new Error('NOT_FOUND');
                error.statusCode = 404;
                throw error;
            }
            if (book.creator.toString() !== req.userId) {
                const error = new Error('Not authorized!');
                error.statusCode = 403;
                throw error;
            }
            return book.findByIdAndDelete(bookId);
        })
        .then(() => {
            res.status(200).json({ message: "Deleted" });
            return user.findById(req.userId);
        })
        .then(user => {
            user.books.pull(bookId);

            return user.save();


        }).then(result => {


            return res.status(200).json({
                message: 'book deleted successfully!',
            })
        })
        .catch(err => next(err))

}
