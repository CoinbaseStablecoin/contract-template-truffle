import { expectRevert } from "./helpers";
import {
  HelloWorldInstance,
  MessageChanged,
} from "../@types/generated/HelloWorld";

const HelloWorld = artifacts.require("HelloWorld");

contract("HelloWorld", (accounts) => {
  const owner = accounts[0];
  let helloWorld: HelloWorldInstance;

  beforeEach(async () => {
    helloWorld = await HelloWorld.new({ from: owner });
  });

  it("has a default message", async () => {
    expect(await helloWorld.getMessage()).to.equal("Hello, world!");
  });

  it("has a default owner", async () => {
    expect(await helloWorld.owner()).to.equal(owner);
  });

  it("lets the owner change the message", async () => {
    const res = await helloWorld.setMessage("Good bye!", { from: owner });
    expect(await helloWorld.getMessage()).to.equal("Good bye!");

    const log = res.logs[0] as Truffle.TransactionLog<MessageChanged>;
    expect(log.address).to.equal(helloWorld.address);
    expect(log.event).to.equal("MessageChanged");
    expect(log.args[0]).to.equal(owner);
  });

  it("does not let any account that is not an owner to change the message", async () => {
    await expectRevert(
      helloWorld.setMessage("Good bye!", { from: accounts[1] }),
      "caller is not the owner"
    );
  });

  it("lets a new owner change the message", async () => {
    const newOwner = accounts[1];
    await helloWorld.transferOwnership(newOwner, { from: owner });
    expect(await helloWorld.owner()).to.equal(newOwner);

    await helloWorld.setMessage("Good bye!", { from: newOwner });
    expect(await helloWorld.getMessage()).to.equal("Good bye!");
  });
});
