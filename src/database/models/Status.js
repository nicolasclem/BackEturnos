module.exports()=(sequelize,dataTypes)=>{
    let alias='Status';
    let cols = {
        id:{
            type:dataTypes.INTEGER(11),
            primaryKey:true,
            autoincrement :true
        },
        name:{
            type:dataTypes.STRING(45)
        }
        }
        let config={
            tableName:"status",
            timestamps:false
        }
        const Status=sequelize.define(alias,cols,config);


        Status.associate = function(models){

            Status.belongsTo(models.Schedule,{
                as:'schedules',
                foreignKey:'status_id'
            })
        }
        return Status  
}