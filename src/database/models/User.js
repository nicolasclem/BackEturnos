module.exports =(sequelize,dataTypes)=>{
    let alias="User";
    let cols={

        id:{
            type:dataTypes.INTEGER(11),
            primaryKey:true,
            autoincrement :true
        },
        email: {
            type: dataTypes.STRING(60),
            unique: true
        },
        password:{
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
        role_id:{
            type:dataTypes.INTEGER(11)
        },
        offices_id:{
            type:dataTypes.INTEGER(11)
        }

    }
    let config={
        tableName:'users',
        timestamps:false
    }

    const User= sequelize.define(alias,cols,config)

    User.associate = function (models){

        User.hasMany(models.Role,{
            as:'roles',
            foreignKey:'role_id'
        })

        User.hasMany(models.Office,{
            as:'offices',
            foreignKey:'offices_id'
        })

        User.belongsTo(models.Schedule,{
            as:'scheduless',
            foreignKey:'user_id'
        })

    }

    return User
}