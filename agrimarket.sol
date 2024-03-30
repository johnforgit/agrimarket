// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract agrimarket
{
    struct seller 
    {
        address sellerAdd;
        string name;
        product[] itemssold;
    }
    seller[] sellers;

    struct customer
    {
        address customerAdd;
        string name;
        product[] itemsbought;
    }
    customer[] customers;

    struct product
    {
        uint256 productID;
        string productName;
        uint256 price;
        uint256 quantity;
        address Seller;
    }
    product[] Products;

    /* function to set seller */
    function setSeller(address sellerAddress,string memory sellerName,product[] memory produce) public{
        sellers.push(seller(sellerAddress,sellerName,produce));
    }

    /* function to get a seller */
    function getSeller(address add_) public view returns(string memory) {
        uint256 i;
        for(i = 0;i < sellers.length;i++) {
            if(sellers[i].sellerAdd == add_) return sellers[i].name;
            else return "Seller not available";
        }
    }

    /* function to get all sellers */
    function getAllSellers() public view returns(seller[] memory){
        return sellers;
    }

    /* function to set customer */
    function setCustomer(address customerAddress,string memory customerName,product[] memory produce) public {
        customers.push(customer(customerAddress,customerName,produce));
    }

    /* function to get a customer */
    function getCustomer(address add_) public view returns(string memory) {
        for(uint256 i = 0;i < customers.length;i++) {
            if(customers[i].customerAdd == add_) return customers[i].name;
            else return "Customer not found!!";
        }
    }

    /* function to get all customers */
    function getAllCustomers() public view returns(customer[] memory){
        return customers;
    }

    /* function to set a product */
    function setProduct(uint256 id,string memory name,uint256 price,uint256 quant,address seller_) public {
        Products.push(product(id,name,price,quant,seller_));
    }

    /* function to get a particular product */
    function getProduct(uint256 id) public view returns(product memory) {
        uint256 i;
        for(i = 0;i < Products.length;i++) {
            if(Products[i].productID == id)
                return Products[i];
        }
    }

    /* function to get all products */
    function getAllProducts() public view returns(product[] memory) {
            return Products;
    }

    /* function to buy a product */
    function buy(address customer_,uint256 id_,uint256 quant) public {
        uint256 POS;
        for(uint256 i = 0;i < Products.length;i++) {
            if(Products[i].productID == id_) POS = i;
        }
        require(Products[POS].quantity > 0,"Product out of stock!!");

        for(uint256 i = 0;i < customers.length;i++) {
            for(uint256 j = 0;j < Products.length;j++) {
                if((customers[i].customerAdd == customer_) && (Products[j].productID == id_)) {
                     customers[i].itemsbought.push(Products[j]);
                    Products[i].quantity -= quant;
                }
               
            }
        }
        /* need logic here which reflects the change of buying on the farmer's side */
        for(uint256 i = 0;i < sellers.length;i++) {
            for(uint256 j = 0;j < Products.length;j++) {
                if((Products[j].productID == id_) && (Products[j].Seller == sellers[i].sellerAdd))
                    sellers[i].itemssold.push(Products[j]);
            }
        }
    }

}
