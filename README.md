### 如何初始化

1. 部署OwnedUpgradeabilityProxy实例
2. 部署逻辑合约的初始版本(V1)
3. 调用OwnedUpgradeabilityProxy实例来更新到初始版本的逻辑合约


### 如何升级

1. 部署一个新版本的逻辑合约(V2)，确保它继承了上一个版本里的状态变量结构。
2. 调用ownedUpgradeabilityProxy实例中的`upgradeToAndCall`来升级到新版本合约的地址，并把新老版本的逻辑合约联系在一起

### 如何调动
1. 调用OwnedUpgradeabilityProxy中的`callMethod`方法

### 智能合约升级指南
1. 下一个版本的合约需在合约中声明上一个版本逻辑合约的实体，并在`initialize`方法中传入上一个版本的地址。
2. 所有state variables建议使用private/internal限定。
3. 新老版本合约之间不建议使用继承，建议写逻辑合约之前先写接口，而后把之前的接口文档备份。
