module.exports()=(sequelize,dataTypes)=>{
    let alias='Office';
    let cols = {
        id:{
            type:dataTypes.INTEGER(11),
            primaryKey:true,
            autoincrement :true
        },
        name:{
            type:dataTypes.STRING(45)
        },
        isAviable:{
            type:dataTypes.TINYINT(4)
        }
        }
        let config={
            tableName:"offcies",
            timestamps:false
        }
        const Office =sequelize.define(alias,cols,config);


        Office.associate = function(models){

            Office.belongsTo(models.User,{
                as:'users',
            foreignKey:'offices_id'
            })
        }
        return Office
    }



