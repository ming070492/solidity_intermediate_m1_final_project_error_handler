const hre = require("hardhat");

async function main() {
    await hre.run("compile");

    const ErrorHandler = await hre.ethers.getContractFactory("ErrorHandler");
    const errorHanlder = await ErrorHandler.deploy();
    await errorHanlder.deployed();

    const transactionResponse = await errorHanlder.test_error(5, 3);
    const transactionReceipt = await transactionResponse.wait();

    console.log("CURRENT VALUE IS: ", transactionReceipt.events[0].args.current_value.toString());
    console.log("ERROR MESSAGE: ", transactionReceipt.events[0].args.err_mes.toString());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});