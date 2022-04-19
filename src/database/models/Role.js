module.exports=(sequelize,dataTypes)=>{
    let alias='Role';
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
            tableName:"roles",
            timestamps:false
        }
        const Role=sequelize.define(alias,cols,config);


        // Role.associate = function(models){

        //     Role.belongsTo(models.User,{
        //         as:'users',
        //     foreignKey:'role_id'
        //     })
        // }
        return Role    
}
