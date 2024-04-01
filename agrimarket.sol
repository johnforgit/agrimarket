// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract agrimarket
{
    struct Seller
    {
        address sellerAdd;
        string name;
    }
    Seller[] sellers;
    // track what the seller sells
    mapping(address => mapping(uint256 => uint256)) itemssold;

    struct Customer
    {
        address customerAdd;
        string name;
    }
    Customer[] customers;
    // track what the customer buys
    mapping(address => mapping(uint256 => uint256)) itemsbought;

    struct Product
    {
        uint256 productID;
        string productName;
        uint256 price;
        uint256 quantity;
        address Seller;
    }
    Product[] Products;

    struct Transaction
    {
        uint256 productID;
        address seller;
        uint256[] itemsSold;
        address customer;
        uint256[] itemsBought;
    }

    /* function to set seller */
    function setSeller(address sellerAddress, string memory sellerName) public {
        sellers.push(Seller(sellerAddress, sellerName));
    }

    /* function to get a seller */
    function getSeller(address add_) public view returns (string memory) {
        for (uint256 i = 0; i < sellers.length; i++) {
            if (sellers[i].sellerAdd == add_) return sellers[i].name;
        }
        return "Seller not available";
    }

    /* function to get all sellers */
    function getAllSellers() public view returns (Seller[] memory) {
        return sellers;
    }

    /* function to set customer */
    function setCustomer(address customerAddress, string memory customerName) public {
        customers.push(Customer(customerAddress, customerName));
    }

    /* function to get a customer */
    function getCustomer(address add_) public view returns (string memory) {
        for (uint256 i = 0; i < customers.length; i++) {
            if (customers[i].customerAdd == add_) return customers[i].name;
        }
        return "Customer not found!!";
    }

    /* function to get all customers */
    function getAllCustomers() public view returns (Customer[] memory) {
        return customers;
    }

    /* function to set a product */
    function setProduct(uint256 id, string memory name, uint256 price, uint256 quant, address seller_) public {
        Products.push(Product(id, name, price, quant, seller_));
    }

    /* function to get a particular product */
    function getProduct(uint256 id) public view returns (Product memory) {
        for (uint256 i = 0; i < Products.length; i++) {
            if (Products[i].productID == id) return Products[i];
        }
    }

    /* function to get all products */
    function getAllProducts() public view returns (Product[] memory) {
        return Products;
    }

    /* function to update the price of a product */
    function updatePrice(uint256 id_, uint256 newPrice_) public {
        for (uint256 i = 0; i < Products.length; i++) 
            if (Products[i].productID == id_)
                Products[i].price = newPrice_;
    }
    
    /* function to update the quantity of a product */
    function updateQuantity(uint256 id_, uint256 newQuant_) public {
        for (uint256 i = 0; i < Products.length; i++)
            if (Products[i].productID == id_)
                Products[i].quantity = newQuant_;
    }

    /* function to buy a product */
    function buy(address customer,uint256 quant,uint256 id_) public {
        uint256 i;
        uint256 pos;
        for(i = 0;i < Products.length; i++)
            if(Products[i].productID == id_) {
                pos = i;
                break;
            }
        
        /* ensuring the presence of a product and it's quantity */
        require(Products[pos].quantity > 0,"Product out of stock!!");
        require(pos < Products.length,"Product not found!!");

        for(i = 0;i < customers.length; i++) {
            if (customers[i].customerAdd == customer)
                itemsbought[customer][id_] = quant;
                break;
        }

        uint256 remainingQuant = Products[pos].quantity - quant;
        itemssold[Products[pos].Seller][id_] = remainingQuant;
        Products[pos].quantity -= quant;
    }
}
