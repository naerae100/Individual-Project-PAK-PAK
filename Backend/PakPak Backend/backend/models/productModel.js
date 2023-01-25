const mongoose=require('mongoose');

const productSchema=mongoose.Schema({
    name:{
        type:String,
        required:[true,"Please Enter the product Name"],
        trim:true
    },
    description:{
        type:String,
        required:[true,"Please Enter the product Description"]
    },
    price:{
        type:Number,
        required:[true,"Please Enter the product Price"],
        maxLength:[8,"price cannot excessed 8 Character"]
    },
    ratings:{
        type:Number,
        default:0,
    },
    images:[
        {
            public_id:{
                type:String,
                required:true
            },
            url:{
                type:String,
                required:true
            }, 
        }

    ],
    category:{
        type:String,
        required:[true,"Please enter Product Category"],
    },
    Stock:{
        type:Number,
        required:[true,"Please Enter Product Stock"],
        maxlength:[4," Stock Cannot eccessed 4 character"],
        default:1
    },
    numOfReviews:{
        type:Number,
        default:0
    },
    reviews:[
        {
            user:{
                type:mongoose.Schema.ObjectId,
                ref:"User",
                required:true,
            },
            name:{
                type:String,
                required:true
            },
            ratings:{
                type:Number,
                required:true
            },
            comment:{
                type:String,
                required:true
            }
        }
    ],
    user:{
        type:mongoose.Schema.ObjectId,
        ref:"User",
        required:true,
    },
    createdAt:{
        type:Date,
        default:Date.now

    }

})

module.exports=mongoose.model("Product",productSchema);