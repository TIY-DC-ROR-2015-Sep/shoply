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

function updateCartCount() {
  var cartDisplay = document.querySelector(".cart-link");
  console.log(cartDisplay.innerHTML);
  var currentCount = parseInt(cartDisplay.innerText.split(" ")[0]);
  cartDisplay.innerText = (currentCount + 1) + " items in cart";
}

function addProductToCart(product_id, button) {
  var cat = button.getAttribute("data-category-id");
  $.ajax("/categories/" + cat + "/products/" + product_id + "/add_to_cart", {
    method: "PUT",
    success: function() {
      button.innerText = "Added";
      updateCartCount();
    },
    error: function() {
      alert("Something went wrong. Please try again");
      button.removeAttribute("disabled");
    }
  })
}
