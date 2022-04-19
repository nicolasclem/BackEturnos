const { QueryTypes } = require('sequelize')
const res = require("express/lib/response")
//Importo la bd
const sequelize = require('../src/database/models/index')


module.exports = login = async (req, res) => {

    try {
        
        const [results] = await sequelize.query("SELECT * FROM users")
        //const [check] = await sequelize.query("SELECT COUNT(email) AS count FROM users WHERE email = 'juanse@gmail.com' and password = '1234'")
        //console.log(check)
        /*if(check.count === 1){
            res.status(200).json(check)
        }else{
            res.status(401).json({msg:'Not authorized...'})
        }*/
        res.status(200).json(results)
        
    } catch (error) {
        console.log(error)
    }

}