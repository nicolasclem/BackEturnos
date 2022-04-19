const express =require('express');
const router =express.Router();
const controller= require('../Controller/userController')

 //render de fomularios usuarios

 router.get('/',controller.show)
    



 module.exports =router;
