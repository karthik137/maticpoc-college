pragma solidity ^0.4.9;

contract Ngo{

    //@notice donor information
    struct Donor {
        string      donorName;
        address     donorWalletAddress;
    }
    
    //@notice ngo information
    struct NGO {
        string      ngoName;
        address     ngoWalletAddress;
    }
    
    //@notice college details
    struct College {
        string      collegeName;
        address     collegeWalletAddress;
        address[]   vendors;
    }
    
    //@notice student info
    struct Student {
        string      studentName;
        uint        age;
        address     collegeWalletAddress;
        address     studentWalletAddress;
        uint        scholorshipAmount;
        uint        amountReceived;
    } 
    
    //@notice vendor struct
    struct Vendor {
        string      vendorName;
        string      vendorType;
        address     vendorWalletAddress;
    }
    
    //@notice expense struct
    struct Expense {
        uint        expenseId;
        address     studentWalletAddress;
        address     vendor;
        uint        amount;
        string      message;
        address     ngoWalletAddress;
        address     collegeWalletAddress;
    }
    
    
    
    //@notice donation data
    struct Donation {
        uint                            donationId;
        //mapping(uint => address)        sender;
        address                         recipient;
        mapping(address => uint)        amount;
        string                          message;
        address                         ngo;
        address                         college;
        address[]                       donors;
    }
    
    uint donationIdCounter = 10000;
    
    //mappings
    mapping(address => Donor)       donor;
    mapping(address => College)     college;
    mapping(address => NGO)         ngo;
    mapping(address => Student)     student;
    mapping(uint => Expense)        expense;
    mapping(address => Vendor)      vendor;
    mapping(uint => Donation)       donation;
    
    //events
    event RegisterDonor(address donorWalletAddress, string donorName);
    event RegisterCollege(address collegeWalletAddress, string collegeName);
    event RegisterNGO(address ngoWalletAddress, string ngoName);
    event RegisterStudent(address studentWalletAddress, string studentName);
    event DonationEvent(uint donationId, address studentWalletAddress, address vendorWalletAddress, uint amount, string message, string eventType);
    
    //@dev function to register donor 
    function registerDonor( address donorWalletAddress, 
                            string donorName
                        ) public {
            
            //Create donor 
            donor[donorWalletAddress] = Donor ({
                donorName:donorName,
                donorWalletAddress:donorWalletAddress
            });
            
            //emit event 
            RegisterDonor(donorWalletAddress, donorName);
    }
    
    //@dev function to register vendor
    function registerVendor(
            address vendorWalletAddress,
            string vendorType,
            string vendorName
            ) public {
            
            //Create vendor 
            vendor[vendorWalletAddress] = Vendor({
                vendorName:vendorName,
                vendorType:vendorType,
                vendorWalletAddress:vendorWalletAddress
            });
                   
    }
    
    
    //@dev function to register college 
    function registerCollege(
                address collegeWalletAddress, 
                string collegeName
            ) public {
                            
            //empty vendors list 
            address[] vendors;
            
            //create college 
            college[collegeWalletAddress] = College({
                collegeName:collegeName,
                collegeWalletAddress:collegeWalletAddress,
                vendors:vendors
            });
            
            //emit event
            RegisterCollege(collegeWalletAddress, collegeName);
    }
    
    
    //@dev function to register ngo 
    function registerNgo(
                address ngoWalletAddress,
                string ngoName
        ) public {
            
            //create ngo 
            ngo[ngoWalletAddress] = NGO({
               ngoWalletAddress:ngoWalletAddress,
               ngoName:ngoName
            });
    
            //emit event 
            RegisterNGO(ngoWalletAddress, ngoName);
    }
    
    
    //@dev function to register student 
    function registerStudent(
                address studentWalletAddress,
                string studentName,
                address collegeWalletAddress,
                uint age,
                uint scholorshipAmount,
                string donationMessage,
                address ngoWalletAddress
        ) public {
            
            //create student 
            student[studentWalletAddress] = Student({
                studentWalletAddress:studentWalletAddress,
                studentName:studentName,
                collegeWalletAddress:collegeWalletAddress,
                age:age,
                scholorshipAmount:scholorshipAmount,
                amountReceived:0
            });
            
            
            //create donation struct 
            address[] donors;
            donation[donationIdCounter] = Donation({
                donationId:donationIdCounter,
                recipient:studentWalletAddress,
                message:donationMessage,
                ngo:ngoWalletAddress,
                college:collegeWalletAddress,
                donors:donors
            });
            
            //emit event
            RegisterStudent(studentWalletAddress, studentName);
        }
        
    //@dev function to donate money 
    function donateMoney(
            address studentWalletAddress, 
            address donorWalletAddress,
            uint amount,
            string message,
            address ngoWalletAddress,
            address collegeWalletAddress
        ) public {
        
            
    }
    
    
    
    // getter functions
    
    //@dev function to get student details
    function getStudentDetails(address studentWalletAddress) public view returns(string, uint, address, uint, uint) {
        return (
            student[studentWalletAddress].studentName,
            student[studentWalletAddress].age,
            student[studentWalletAddress].collegeWalletAddress,
            student[studentWalletAddress].scholorshipAmount,
            student[studentWalletAddress].amountReceived
            );
    }
    
    //@dev function to get college details
    function getCollegeDetails(address collegeWalletAddress) public view returns(string, address[]){
        return (
            college[collegeWalletAddress].collegeName,
            college[collegeWalletAddress].vendors
        );
    }
    
    //@dev function to get donor details 
    function getDonorDetails(address donorWalletAddress) public view returns(string){
        return (
            donor[donorWalletAddress].donorName
        );
    }
    
    //@dev function to ngo details 
    function getNGODetails(address ngoWalletAddress) public view returns(string){
        return (
            ngo[ngoWalletAddress].ngoName    
        );
    }
    
    //@dev function to get vendor details
    function getVendorDetails(address vendorWalletAddress) public view returns(string, string){
        return (
            vendor[vendorWalletAddress].vendorType,
            vendor[vendorWalletAddress].vendorName
        );
    }

}
