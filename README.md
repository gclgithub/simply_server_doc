# simply_server_doc
Io doc
### 登录

| 接口地址             | 请求类型 | 修改人 | 修改时间   | 备注 |
| -------------------- | :------: | :----- | ---------- | ---- |
| /auth/register_login |   POST   | gcl    | 2021-04-21 |      |

#### 请求

```json
{
    account:string, 账号(可以直接手机号、同时保证了唯一性)
    password:string, 使用md5哈希过的用户密码
    device:string, 设备ID
}

note:用户已经注册自动登录、如果没有注册、则注册之后登录
```

#### 返回

```json
{
    "code": string,200 is ok
    "msg":string,"succeed"
    "data":{
    			"session_id":string
    }
}
```

msg:

```
succeed,成功
user exist,用户已登录
product not support,
user_disabled,用户未激活
```

### 删除用户

| 接口地址          | 请求类型 | 修改人 | 修改时间   | 备注       |
| ----------------- | -------- | ------ | ---------- | ---------- |
| /auth/delete_user | POST     | gcl    | 2021-04-22 | 可能用不到 |

#### 请求

```json
{
    account:string
}
```

#### 返回

```
{
    "code": string,200 is ok
    "msg":string,
    "data":null
}

msg:
	user not exist,
	delete user error,
	login_timeout,
```

### 编辑用户

| 接口地址                  | 请求类型 | 修改人 | 修改时间   | 备注 |
| ------------------------- | -------- | ------ | ---------- | ---- |
| /auth/post_edit_user_info | POST     | gcl    | 2021-04-23 |      |

#### 请求



```
{
    	"account":string,//账户
        "nick_name": string,
        "password": string,
        "avartUrl": string,//用户头像
        "mobile": string,
        "birth_date": {
            "time": 1591527751603(int64)//时间戳
        },
        "sex": string,
        "type": string,
        "token":"用户令牌",
        "wx":"微信账号绑定",
        "apple":"苹果账号绑定"
        "created_time": {
            "time": 1591527751603(int64)//时间戳
        },
    	"last_mod_time": {
            "time": 1591527751603(int64)
        },
        "last_operator": string,
        "description": string,
        "enabled": bool,
        "extra_info": string,
}
```

#### 返回

```
{
    "code": string,200 is ok
    "msg":string,
    "data":{}
}
msg:
	login_timeout,
	user not exist,
	edit user error,
```

### 获取用户信息

| 接口地址            | 请求类型 | 修改人 | 修改时间   | 备注 |
| ------------------- | -------- | ------ | ---------- | ---- |
| /auth/get_user_info | POST     | gcl    | 2021-04-23 |      |

#### 请求

```
{
    account:string,
}
```

#### 返回

```
{
    "code": string,200 is ok
    "msg":string,
    "data":{
        "account":string,//必须要有
        "nick_name": string,
        "password": string,
        "avartUrl": string,//用户头像
        "mobile": string,
        "birth_date": string,
        "sex": string,
        "type": string,
        "token":"用户令牌",
        "wx":"微信账号绑定",
        "apple":"苹果账号绑定"
        "created_time": {
            "time": 1591527751603(int64)//时间戳
        },
    	"last_mod_time": {
            "time": 1591527751603(int64)
        },
        "last_operator": string,
        "description": string,
        "enabled": bool,
        "extra_info": string,
	}
}
```

msg:

```
login_timeout,
```

### 修改密码

| 接口地址              | 请求类型 | 修改人 | 修改时间   | 备注 |
| --------------------- | -------- | ------ | ---------- | ---- |
| /auth/change_password | POST     | gcl    | 2021-04-24 |      |

#### 请求

```
{
	"account":string,
	"old_password":string
    "new_password": string
}
```

#### 返回

```
{
    "code": string,200 is ok
    "msg":string,
    "data":null
}
```

### 退出登录

| 接口地址     | 请求类型 | 修改人 | 修改时间   | 备注 |
| ------------ | -------- | ------ | ---------- | ---- |
| /auth/logout | POST     | gcl    | 2020-06-15 |      |

#### 请求

```
{
	"account":string
}
note:调用其他接口重置自动退出时间，调用其他接口如果token已经过期，返回过期标志
```

#### 返回

```
{
    "code": string,200 is ok
    "msg":string,
    "data":null
}
```

