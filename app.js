const express=require('express')
const app=express()

const port=3003
const path = require('path');
const cors= require('cors')
const cookies = require ('cookie-parser');


const methodOverride =  require('method-override'); // Pasar poder usar los métodos PUT y DELETE





app.use(cors())// politica de seguirdad

app.use(
    express.static(path.resolve(__dirname, '../public'))
);// rutas partiendo desde / public


app.use(methodOverride('_method')); // Pasar poder pisar el method="POST" en el formulario por PUT y DELETE
app.use(express.json())
app.use(express.urlencoded({extended:false}))


// nuestro motor de plantillas
// app.set('view engine', 'ejs');
// app.set('views', path.resolve(__dirname, 'views'));


app.use(cookies());

// middle de aplicacion






app.listen(port, ()=>console.log(` servidor corriendo en ${port} `) )