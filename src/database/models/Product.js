module.exports = (sequelize, dataTypes) => {
    
    const alias = "Products";
    const cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
        },
        title: {
            type: dataTypes.STRING
        },
        description: {
            type: dataTypes.STRING
        },
        price: {
            type: dataTypes.INTEGER
        },
        price_discount: {
            type: dataTypes.INTEGER
        },
        size: {
            type: dataTypes.STRING
        },
        color: {
            type: dataTypes.STRING
        },
        genre_product: {
            type: dataTypes.STRING
        },
        type: {
            type: dataTypes.STRING
        },
        new:{
            type: dataTypes.TINYINT
        },        
        created: {
            type: dataTypes.DATE
        },
        updated: {
            type: dataTypes.DATE
        },        
        deleted: {
            type: dataTypes.DATE
        },
        id_purchase_order: {
            type: dataTypes.INTEGER,
            foreignKey: true,
        },
        id_product_photo: {
            type: dataTypes.INTEGER,
            foreignKey: true,
        }
    };
    const config = {
        tableName: "products",
        timestamps: {
            createdAt:{
                type: DataTypes.DATE
            },
            updatedAt:{
                type: DataTypes.DATE
            },
            deletedAt: {
                type: DataTypes.DATE
            }
        },
    }

    const Product = sequelize.define(alias, cols, config);

    return Product;
}