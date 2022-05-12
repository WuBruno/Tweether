const receiver = "0x2340CE3d0b52849E3192FaebFf75C4d327dA9440";
const amount = web3.utils.toWei("10", 'ether');

module.exports = async function (callback) {
  const addresses = await web3.eth.getAccounts()

  web3.eth.sendTransaction({
    from: addresses[2],
    to: receiver,
    value: amount
  }, callback)
}