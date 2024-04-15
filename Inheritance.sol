// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


abstract contract Employee {
    uint public idNumber;
    uint public managerId;

    constructor(uint _idNumber, uint _managerId) {
        idNumber = _idNumber;
        managerId = _managerId;
    }

    // Virtual function for getting the annual cost of an employee
    function getAnnualCost() public virtual view returns (uint);
}

// Contract for salaried employees
contract Salaried is Employee {
    uint public annualSalary;

    constructor(uint _idNumber, uint _managerId, uint _annualSalary) Employee(_idNumber, _managerId) {
        annualSalary = _annualSalary;
    }

    // Override function to return the annual salary
    function getAnnualCost() public view override returns (uint) {
        return annualSalary;
    }
}

// Contract for hourly employees
contract Hourly is Employee {
    uint public hourlyRate;
    uint constant WORKING_HOURS_PER_YEAR = 2080;

    constructor(uint _idNumber, uint _managerId, uint _hourlyRate) Employee(_idNumber, _managerId) {
        hourlyRate = _hourlyRate;
    }

    // Calculate annual cost based on hourly rate
    function getAnnualCost() public view override returns (uint) {
        return hourlyRate * WORKING_HOURS_PER_YEAR;
    }
}

// Contract for managing employee reports
contract Manager {
    uint[] public employeeIds;

    // Add an employee ID to the reports list
    function addReport(uint _employeeId) public {
        employeeIds.push(_employeeId);
    }

    // Reset the list of reports
    function resetReports() public {
        delete employeeIds;
    }
}

// Salesperson contract inheriting from Hourly
contract Salesperson is Hourly {
    constructor(uint _idNumber, uint _managerId, uint _hourlyRate) Hourly(_idNumber, _managerId, _hourlyRate) {}
}

// Engineering manager contract inheriting from Salaried and Manager
contract EngineeringManager is Salaried, Manager {
    // Constructor for the EngineeringManager, initializing both the Salaried and Manager base contracts
    constructor(uint _idNumber, uint _managerId, uint _annualSalary) Salaried(_idNumber, _managerId, _annualSalary) Manager() {
        // The annualSalary is set in the Salaried constructor
    }
}


// Contract to handle submissions for inheritance testing
contract InheritanceSubmission {
    address public salesPerson;
    address public engineeringManager;

    constructor(address _salesPerson, address _engineeringManager) {
        salesPerson = _salesPerson;
        engineeringManager = _engineeringManager;
    }
}
