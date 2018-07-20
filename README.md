### 如何初始化

1. 部署`Registry`合约
2. 部署逻辑合约的初始版本(V1)，并确保它继承了`Upgradeable`合约
3. 向`Registry`合约中注册这个最初版本(V1)的地址
4. 要求`Registry`合约创建一个`UpgradeabilityProxy`实例
5. 调用你的`UpgrageabilityProxy`实例来升级到你最初版本(V1)


### 如何升级

1. 部署一个继承了你最初版本合约的新版本(V2)，V2必须继承V1
2. 向`Registry`中注册合约的新版本V2
3. 调用你的`UpgradeabilityProxy`实例来升级到最新注册的版本


### 如何调用
对proxy套用当前版本的逻辑合约的ABI，正常调用方法

### 如何转移proxy合约所有权
调用`Registry`中的`transferProxyOwnership`方法进行所有权转移；

