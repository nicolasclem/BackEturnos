const { QueryTypes } = require('sequelize')
const res = require("express/lib/response")
const jwt = require('jsonwebtoken')
//Importo la bd
const sequelize = require('../src/database/models/index')


module.exports = login = async (req, res) => {

    try {
        const {email, password} = req.body

        if(!email || !password){
            res.status(404).json({msg:'Body empty...'})
        }
       
        const [user] = await sequelize.query(`SELECT email, name, surname, role_id FROM users WHERE email = ${"'"+email+"'"} and password = ${password} and active = 1`)
    
        if(user.length === 1){
            
            let objUser = {
                email:user[0].email,
                name:user[0].name,
                surname: user[0].surname,
                role:user[0].role_id
            }
            accessToken = jwt.sign(objUser, 'secretaccess', {expiresIn:'5m'})
            refreshToken = jwt.sign(objUser, 'secretrefresh', {expiresIn:'2d'})

            objUser.accessToken = accessToken
            objUser.refreshToken = refreshToken

            res.status(200).json(objUser)
        }else{
            res.status(401).json({msg:'Not authorized...'})
        }
        
    } catch (error) {
        console.log(error)
        res.status(402).json({msg:'Error in request...'})
    }

}