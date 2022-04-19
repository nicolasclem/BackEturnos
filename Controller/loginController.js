const { QueryTypes } = require('sequelize')
const res = require("express/lib/response")
//Importo la bd
const sequelize = require('../src/database/models/index')


module.exports = login = async (req, res) => {

    try {
        

        const [results] = await sequelize.query("SELECT * FROM users")

        res.status(200).json(results)
    } catch (error) {
        console.log(error)
    }

}