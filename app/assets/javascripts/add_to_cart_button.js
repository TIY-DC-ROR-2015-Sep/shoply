window.onload = function() {
  var buttons = document.querySelectorAll(".add-to-cart");
  for (var i = 0; i < buttons.length; i ++) {
    var b = buttons[i];
    b.addEventListener("click", function(e){
      e.preventDefault();
      var product_id = this.getAttribute("data-product-id");
      addProductToCart(product_id);
    })
  }
}

function addProductToCart(product_id) {
  $.ajax("/categories/_/products/" + product_id + "/add_to_cart", {
    method: "PUT",
    success: function() {
      alert("It was successful");
    },
    error: function() {
      alert("Something went wrong");
    }
  })
}
