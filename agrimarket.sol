// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract agrimarket
{
    mapping(address => string) sellers;
    address[] sellerAddresses;
    mapping(address => string) customers;
    address[] customerAddresses;

    struct product
    {
        uint256 productID;
        string productName;
        uint256 price;
        uint256 quantity;
        address Seller;
    }
    product[] Product; // array of products

    /* function to set seller */
    function setSeller(address sellerAddress,string memory sellerName) public{
        sellers[sellerAddress] = sellerName;
        sellerAddresses.push(sellerAddress);
    }

    /* function to get a seller */
    function getSeller(address add_) public view returns(string memory) {
        return sellers[add_];
    }

    /* function to get all sellers */
    function getAllSellers() public view returns(address[] memory){
        return sellerAddresses;
    }

    /* function to set customer */
    function setCustomer(address customerAddress,string memory customerName) public {
        customers[customerAddress] = customerName;
        customerAddresses.push(customerAddress);
    }

    /* function to get a customer */
    function getCustomer(address add_) public view returns(string memory) {
        return customers[add_];
    }

    /* function to get all customers */
    function getAllCustomers() public view returns(address[] memory){
        return customerAddresses;
    }

    /* function to set a product */
    function setProduct(uint256 id,string memory name,uint256 price,uint256 quant,address seller_) public {
        Product.push(product(id,name,price,quant,seller_));
    }

    /* function to get a particular product */
    function getProduct(uint256 id) public view returns(product memory) {
        uint256 i;
        for(i = 0;i < Product.length;i++) {
            if(Product[i].productID == id)
                return Product[i];
        }
    }

    /* function to get all products */
    function getAllProducts() public view returns(product[] memory) {
            return Product;
    }
}