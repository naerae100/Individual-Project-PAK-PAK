const express = require("express");

const {
  getAllProducts,
  createProduct,
  updateProduct,
  deleteProuct,
  getProductDetails,
  getAdminProducts
  
} = require("../controllers/productController");

const { isAuthenticatedUser,authorizeRoles } = require("../middleware/auth");

const router = express.Router();

router.route("/products").get(getAllProducts);


router
  .route("/admin/products")
  .get(isAuthenticatedUser, authorizeRoles("admin"), getAdminProducts);

  router
  .route("/admin/product/new")
  .post(isAuthenticatedUser, authorizeRoles("admin"), createProduct);

router
  .route("/product/:id")
  .put(isAuthenticatedUser,authorizeRoles("admin"),updateProduct)
  .delete(isAuthenticatedUser,authorizeRoles("admin"),deleteProuct)
  .get(getProductDetails);

module.exports = router;
