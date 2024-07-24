pragma solidity 0.8.22;

contract JustDoIt {
    struct DoI {
        string name;
        string desc;
        bool check;
    }

    DoI[] public doit;

    function createDoIt(
        string calldata _name,
        string calldata _desc
    ) external {
        doit.push(DoI(_name, _desc, false));
    }

    function updateDoIt(
        uint _index,
        string calldata _name,
        string calldata _desc
    ) external {
        doit[_index].name = _name;
        doit[_index].desc = _desc;
    }

    function checkDoIt(uint _index) external {
        doit[_index].check = !doit[_index].check;
    }

    function getDoIt(
        uint _index
    ) external view returns (string memory, string memory, bool) {
        DoI memory task = doit[_index];
        return (task.name, task.desc, task.check);
    }

    function deleteDoIt(uint _index) external {
        delete doit[_index];
    }

    function getAllDoIT() external view returns (DoI[] memory) {
        return doit;
    }
}
