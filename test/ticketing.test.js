const Ticketing = artifacts.require("Ticketing");

contract("Ticketing", (accounts) => {
  it("devrait permettre la création d'un billet", async () => {
    const ticketing = await Ticketing.deployed();
    await ticketing.createTicket("Concert", web3.utils.toWei("0.1", "ether"), {
      from: accounts[0],
    });
    const ticket = await ticketing.tickets(1);
    assert.equal(ticket.eventName, "Concert");
  });
});
