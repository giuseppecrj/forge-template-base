-include .env

.PHONY: all test clean deploy-anvil

all: clean remove install update build

# Clean the repo
clean  :; forge clean

# Remappings
remap :; forge remappings > remappings.txt

# Remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib

install :; yarn

# Update Dependencies
update:; forge update

build:; forge build

test :; forge test

snapshot :; forge snapshot

slither :; slither ./src

format :; prettier --write src/**/*.sol && prettier --write src/*.sol

# solhint should be installed globally
lint :; solhint src/**/*.sol && solhint src/*.sol

anvil :; anvil -m 'test test test test test test test test test test test junk'

fund :; cast send ${account} --value 1ether -f 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266

# use the "@" to hide the command from your shell
deploy-sepolia :; @forge script scripts/${contract}.s.sol:${contract} --rpc-url ${SEPOLIA_RPC_URL}  --private-key ${PRIVATE_KEY} --broadcast --verify --etherscan-api-key ${ETHERSCAN_API_KEY}  -vvvv

deploy-base-sepolia :;
	@forge build
	@forge script scripts/${contract}.s.sol:${contract} --rpc-url ${BASE_RPC_URL} --private-key ${BASE_PRIVATE_KEY} --verifier-url https://api-sepolia.basescan.org/api --etherscan-api-key ${BLOCKSCOUT_API_KEY} --broadcast --verify -vvvv

# This is the private key of account from the mnemonic from the "make anvil" command
deploy-anvil :;
	@LOCAL_PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 ETHERSCAN_API_KEY=test forge script scripts/${contract}.s.sol:${contract} --rpc-url http://localhost:8545 --broadcast

deploy-ganache :; @forge script scripts/${contract}.s.sol:${contract} --rpc-url http://localhost:8545  --private-key ${GANACHE_PRIVATE_KEY} --broadcast
