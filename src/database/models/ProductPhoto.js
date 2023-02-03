module.exports = (sequelize, dataTypes) => {
    
    const alias = "Products_photos";
    const cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        photo1: {
            type: dataTypes.STRING,
        },
        photo2: {
            type: dataTypes.STRING,
        },
        photo3: {
            type: dataTypes.STRING,
        }
    };
    const config = {
        tableName: "products_photos",
        timestamps: false
    }
    
    const ProductPhoto = sequelize.define(alias, cols, config);

    return ProductPhoto;
}