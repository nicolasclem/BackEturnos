const db = require('../src/database/models');
const path =require('path');

const { QueryTypes } = require('sequelize');

const bcrypt =require ('bcryptjs');
const { resolveSoa } = require('dns');












const controllerUsers ={
    
    /*********************************************************** 
     * 
     * Testeando data
     * 
    ***************************************************************/
     show: async (req,res)=>{
        let oneUser = await db.User.findAll({
            include: [ {association: 'roles'}]
        })
        try{
            getUser = oneUser.map( user =>{
                    user = {
                        role : user.roles.dataValues.name,
                      //  office: user.offices.dataValues.name,

                };
                return user
            })
            res.status(200).json({
                user: getUser,
                status:200
            })
        }catch (err) { console.log(err) };


    }
    
    
    

}

module.exports =controllerUsers