module.exports =(sequelize, dataTypes) =>{

    let alias = "Schedule";
    let cols = {
        id: {
            type:dataTypes.INTEGER(11),
            primaryKey:true,
            autoincrement :true
            },
        status_id:{
            type:dataTypes.INTEGER(11)
        },
        user_id:{
            type:dataTypes.INTEGER(11)
        },
        info:{
            type:dataTypes.STRING(45)
        },
        patient_id:{
            type:dataTypes.INTEGER(11)
        }

    };

    let config = {
        tableName:"schedules",
        timestamps:false
    };

    const Schedule =sequelize.define (alias,cols,config);

    // Schedule.associate= function (models){

    //     Schedule.hasMany(models.Status,{
    //         as:'status',
    //         foreignKey:"status_id"
    //     })
    //     Schedule.hasMany(models.Patient,{
    //         as:'patients',
    //         foreignKey:"patient_id"
    //     })
    //     // Schedule.hasMany(models.User,{
    //     //     as:'users',
    //     //     foreignKey:"user_id"
    //     // })
    // }
    return Schedule
}