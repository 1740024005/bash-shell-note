# 登录超级用户
oc login -u system:admin

# 获取用户列表
oc get serviceaccount

# 查看anyuid (允许用户指定容器用户)
oc describe scc anyuid

# 提升用户为系统管理员
oc adm policy add-cluster-role-to-user cluster-admin dev

# 添加default用户到anyui作用域为myproject
oc adm policy add-scc-to-user anyuid -z default -n myproject
