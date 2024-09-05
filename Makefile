-include .env

fund :; cast send ${account} --value 1ether -f 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266

deploy-any :;
	@echo "Running $(contract) on remote network"
	@SAVE_DEPLOYMENTS=1 $(if $(context),DEPLOYMENT_CONTEXT=$(context)) \
	forge script scripts/${contract}.s.sol:${contract} \
	--rpc-url ${rpc} --private-key ${private_key} --broadcast
