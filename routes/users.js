const express =require('express');
const router =express.Router();
const controller = require('../Controller/userController')
const login = require('../Controller/loginController')

 //render de fomularios usuarios

 router.get('/users',controller.show)
 router.post('/login', login)
    



 module.exports =router;
