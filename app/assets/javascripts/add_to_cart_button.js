window.onload = function() {
  var buttons = document.querySelectorAll(".add-to-cart");
  for (var i = 0; i < buttons.length; i ++) {
    var b = buttons[i];
    b.addEventListener("click", function(e){
      e.preventDefault();
      this.setAttribute("disabled", "disabled");
      var product_id = this.getAttribute("data-product-id");
      addProductToCart(product_id, this);
    })
  }
}

function updateCartCount(newCount) {
  var cartDisplay = document.querySelector(".cart-link");
  cartDisplay.innerText = newCount + " items in cart";
}

function addProductToCart(product_id, button) {
  var cat = button.getAttribute("data-category-id");
  $.ajax("/categories/" + cat + "/products/" + product_id + "/add_to_cart", {
    method: "PUT",
    success: function(data) {
      button.innerText = "Added";
      updateCartCount(data.items_in_cart);
    },
    error: function() {
      alert("Something went wrong. Please try again");
      button.removeAttribute("disabled");
    }
  })
}
