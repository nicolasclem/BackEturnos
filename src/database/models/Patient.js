module.exports =(sequelize,dataTypes)=>{
    let alias="Patient";
    let cols={

        id:{
            type:dataTypes.INTEGER(11),
            primaryKey:true,
            autoincrement :true
        },
        insurance_name:{
            type: dataTypes.STRING(45),
        },
        insurance_number:{
            type: dataTypes.STRING(45),
        },        
       
        medical_history:{
            type:dataTypes.STRING(245)
        },
        name: {
            type: dataTypes.STRING(45),
            
        },
        surname: {
            type: dataTypes.STRING(45),
            
        },
        dni:{
            type:dataTypes.INTEGER(11)
        },
        phone:{
            type:dataTypes.INTEGER(11)
        },
        email: {
            type: dataTypes.STRING(60),
            unique: true
        }


    }
    let config={
        tableName:'patients',
        timestamps:false
    }

    const Patient= sequelize.define(alias,cols,config)

    // Patient.associate = function (models){

    //     Patient.belongsTo(models.Schedule,{
    //         as:'schedules',
    //         foreignKey:'patient_id'
    //     })

      

    // }

    return Patient
}