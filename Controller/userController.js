const db = require('../src/database/models');
const path =require('path');

const { QueryTypes } = require('sequelize');

const bcrypt =require ('bcryptjs')












const controllerUsers ={
    
    /*********************************************************** 
     * 
     * Testeando data
     * 
    ***************************************************************/
    show: (req,res)=>{
        db.User.findAll()
        .then(
            user=>{
            return  res.status(200).json({
                
                data: user,
                status: 200,
                })
            }
            
          
       )


    }
    
    

}

module.exports =controllerUsers