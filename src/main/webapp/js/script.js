
//Client side programing to add products into the cart.
//Function to add elements into the bag
function addToBag(pid, pname, pprice) {

    let cart = localStorage.getItem("cart");
    //adding in cart when the cart is empty
    if (cart === null) {

        let products = [];
        let product = {productId: pid, productName: pname, productBuyQuantity: 1, productPrice: pprice};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));

        //console.log("New Product Added to cart");
        showToast("Item added in bag");
    }
    //adding when the cart has some value
    else {

        let pcart = JSON.parse(cart);

        //check if product of same id is added we 

        let oldProduct = pcart.find((item) => item.productId === pid);
        //If element of same id is found we will add quantity of the product
        if (oldProduct) {

            //This is the updated quantity of product a user has bought
            oldProduct.productBuyQuantity = oldProduct.productBuyQuantity + 1;

            pcart.map((item) => {
                if (item.productId === oldProduct.productId) {
                    item.productBuyQuantity = oldProduct.productBuyQuantity;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));
            //console.log("Product Quantity Updated");
            showToast("Product Quantity Updated");
        }
        //else there are other products. SO we will add these products
        else {

            let product = {
                productId: pid,
                productName: pname,
                productBuyQuantity: 1,
                productPrice: pprice
            };
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));

            console.log("New Product Added");
        }
    }
    updateCart();

}

function updateCart(){
    //taking value of cart as string
    let cartString = localStorage.getItem("cart");
    
       //Converting string into object
    let cart = JSON.parse(cartString);
    
    //Condition while cart is empty
    
    if (cart === null || cart.length === 0) {
        console.log("Bag is Empty");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>Cart does not have any items</h3>");
        $(".checkout-btn").addClass('disabled');
    } else {
         
        //Card has Some Products
        console.log(cart)
        
        $(".cart-items").html(`( ${cart.length} )`);
        let table = `  
        <table class='table'>
        <thead class='thead-light'>
            <tr>
                <th>Item Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Action</th>
            </tr>
        </thead>
        `;
        
        let totalPrice=0;
        cart.map ((item) => {
            
            table+=`
                <tr>
            <td> ${item.productName}</td>
            <td> ${item.productPrice}</td>
            <td> ${item.productBuyQuantity}</td>
            <td> ${item.productBuyQuantity * item.productPrice}</td>
            <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm' >Remove</button></td>
            </tr>`
                
             totalPrice += item.productPrice * item.productBuyQuantity;
                       
        })
             
        table = table + `
          <tr>
                <td> Total Price: ${totalPrice} </td>
            </tr>  
        </table>`
        $(".cart-body").html(table);
    }
}   

//Function to remove item from the cart
function deleteItemFromCart(pid) {
    
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item) => item.productId != pid)
    localStorage.setItem('cart' , JSON.stringify(newcart))
    
    showToast("Item Deleted")
    
    //UpdateCart function is called
    updateCart();
}

//$(document).ready(function () {
//    updateCart()
//})


//function showToast(content){
//    $("#toast").addClass("display");
//    $("#toast").html(content);
//    setTimeout(() => {
//        $("#toast").removeClass("display");
//    }, 2000);
//}



