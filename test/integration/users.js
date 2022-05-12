const UserStorage = artifacts.require("UserStorage");
const UserController = artifacts.require('UserController')

const { assertVMException } = require("../utils")

contract("users", () => {
  it("can create user with controller", async () => {
    const controller = await UserController.deployed()

    const tx = await controller.createUser(
      web3.utils.fromAscii("tristan"),
      web3.utils.fromAscii("Tristan"),
      web3.utils.fromAscii("Edwards"),
      "I like building stuff",
      "example@example.com"
    )

    assert.isOk(tx)
  })

  it("can't create user without controller", async () => {
    const storage = await UserStorage.deployed()

    try {
      const tx = await storage.createUser(
        0x0,
        "tristan",
        "Tristan",
        "Edwards",
        "I like building stuff",
        "example@example.com"
      )
      assert.fail();
    } catch (err) {
      assertVMException(err);
    }
  })

  it("can get user", async () => {
    const storage = await UserStorage.deployed();
    const userId = 1

    const userInfo = await storage.profiles.call(userId);
    const username = web3.utils.toAscii(userInfo[1]).replace(/\u0000/g, '');

    assert.equal(username, "tristan")
  })
})