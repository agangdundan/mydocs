---
title: 线路号修改
sidebar: true
sidebarDepth: 1
---

## 线路号操作

| 功能操作           | 操作数据表                                                   | 数据变动说明                                                 |
| ------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 采购商线路删除     | 采购商线路表             | 删除自身线路，社区店分采分付主账号，会关联删除其子账号的线路。 |
| 采购商线路新增     | 采购商线路表             | 新增member_line记录；                                        |
|                    | 三联单数据表    | 历史三联单数据（未退还完成的押金订单三联单数据）变更线路号       |
| 采购商线路批量修改  | 采购商线路表             | 若目标线路存在线路序号，则修改数据线路序号会自增             |
|                    | 三联单数据表    | 近1月的标签数据和三联单数据变更线路号                        |

::: tip 提示 
在采购商线路新增 或者 线路批量修改时，都会处理的逻辑是修改采购商线路号；<br>不同的是修改三联单数据（采购商设置会修改所有三联单数据，线路批量修改会修改近1个月的三联单数据）
:::

<div style="display:none;">
    <a-alert message="注意" type="warning">
      <p slot="description"></p>
    </a-alert>
</div>

<br/>
<br/>


## 线路号查询


| 查询操作        |        查询线路号关联说明                               |  角色   |
| -------------- | ------------------------------------------------------ | ------ |
| 押金物品交接确认 | 关联司机线路名、订单及详情、分拣单及详情                   |  司机      |
| 押金物品交接查询 | 关联订单及详情、分拣单及详情                              |  客服/司机  |
| 押金物品入库申请 | 关联司机线路号、订单及详情、分拣单及详情                   |  司机      |
| 押金物品入库查询 | 关联订单及详情、分拣单及详情、押金物品交接确认履历表        |  客服/司机  |
| 押金退款申请     | 关联订单及详情、押金退款申请履历表、标签表（显示线路号+序号）|  客服     |
| 押金退款查询     | 关联订单及详情、押金退款申请履历表、标签表（显示线路号+序号）|  客服     |
| 押金退还申请查询 | 关联订单及详情、采购商线路号、押金退款申请履历表           | 客服  |



## 数据修改后记录确认情况

> 上周你修改了时间后以后的确认结果如下：
账号 15000000170   
原线路号1984，批量修改后的线路号是1986   
4.10对应的订单，在label_list_detail中trade_attr1仍然是1984   
4.11对应的订单，在label_list_detail中trade_attr1变更为1986   
4.10和4.11对应的订单在仓库管理 > 押金退还申请查询画面，线路号显示的都是：1986   
将4.10对应的订单进行押金物品退还，1984线路上的司机可以看到4.10的押金物品   
将4.11对应的订单进行押金物品退还，1986线路上的司机可以看到4.11的押金物品   

::: tip  整理
分析整理Boos Ding的确认结果如下：
:::

1.  账号<br/>
   
    | 账号 | 修改方式 | 原线路号 | 修改后线路号 | 操作时间 |
    | ---- | :-------: | :--------: | :--------:  | :-----: |
    | 15000000170 | 批量修改 |1984 | 1986 | 2021-04-12 |
    <br/>

2.  数据<br/>
    ::: danger 注意
      设置了批量修改时，查询提示2天前至3个月内的押金订单信息   
      修改时，则是修改2天内的数据(三联单中，未完成退还的押金订单)
    ::: 

    | 数据表 | 修改订单日期 | 修改字段 | lineId | 线路名称 | 是否发生变化 |
    | ---    | --------- | ------ | --- | --- | :---: |
    | 标签表 | 4.10 | trade_attr1 | 1605 | 1984 | <a-tag color="red">无</a-tag> |
    | 标签表 | 4.11 | trade_attr1 | 1609 | 1986 | <a-tag color="green">有</a-tag> |
    | 采购商线路表 | 4.11 | line_id | 1609 | 1986 | <a-tag color="green">有</a-tag> |
    | 采购商线路表 | 4.11 | line_id | 1610 | 1986 | <a-tag color="green">有</a-tag> |
    <br/>

3.  功能关联查询及数据对功能的影响<br/>
    <div>
      <a-tabs type="card" default-active-key="1">
        <a-tab-pane key="1" tab="押金物品交接、入库">
          <!-- <a-card style=""> -->
            <!-- <a-tag style='margin-bottom:15px;' color='green'>押金物品交接、入库</a-tag> -->
            <a-alert
              message2="押金物品交接、入库"
              description2="押金物品交接、入库会关联三联单中分拣单的数据"
              type="success">
              <p slot="description">
                【押金物品交接、入库】 <span style="color: green">会关联订单及详情、分拣单及详情、押金物品交接确认履历表(入库查询)</span>
              </p>
            </a-alert>
          <!-- </a-card> -->
        </a-tab-pane>
        <a-tab-pane key="2" tab="押金退款申请、查询" force-render>
            <!-- <a-card style=""> -->
              <!-- <a-tag style='margin-bottom:15px;' color='green'>押金退款申请、查询</a-tag> -->
              <a-alert
                message2="押金退款申请、查询"
                description2="押金退款申请、查询会关联订单及详情、押金退款申请履历表、标签表（显示线路号+序号）"
                type="success">
                <p slot="description">
                  【押金退款申请、查询】 <span style="color: green">会关联订单及详情、押金退款申请履历表、标签表（显示线路号+序号）</span>
                </p>
              </a-alert>
            <!-- </a-card> -->
        </a-tab-pane>
        <a-tab-pane key="3" tab="押金退还申请查询">
            <!-- <a-card style=""> -->
              <!-- <a-tag style='margin-bottom:15px;' color='green'>押金退还申请查询</a-tag> -->
              <a-alert
                description22="押金退还申请查询会关联关联订单及详情、采购商线路号、押金退款申请履历表"
                type="success">
                <p slot="description">
                  【押金退还申请查询】 <span style="color: green">会关联关联订单及详情、采购商线路号、押金退款申请履历表</span>
                </p>
              </a-alert>
            <!-- </a-card> -->
        </a-tab-pane>
      </a-tabs>
    </div>
    <br/>

4.  功能关联查询<br/>

    | 序号 | 功能操作 | 订单日期 | 线路号显示 | 显示关联表 | 影响 | 最终影响 |
    | --- | ---    | --------- | ------ | --- | :---: | :---- |
    | 1 | 押金物品交接确认 | 4.10 | 1984 | 采购商线路表 | <a-tag color="green">有</a-tag> | 1984线路上的司机可以看到4.10的押金物品 |
    | 2 | 押金物品交接确认 | 4.11 | 1986 | 采购商线路表 | <a-tag color="red">无</a-tag> | 对新线路上的司机显示的都是修改后的线路号 |
    | 3 | 押金退款申请、查询 | 4.11 | 1986 | 采购商线路表 | <a-tag color="red">无</a-tag> | 对新线路上的司机显示的都是修改后的线路号 |

5.  及数据对功能的影响<br/>

    ::: danger 线路批量修改
    当存在1月前的数据时，修改三联单数据后(批量修改的是1月内数据)，会出现2条线路的数据。   
    如果想要让新线路司机直接接手老线路的数据(新线路司机与原线路司机线下交接)，此处需要如何进行调整？    
    否则，依然是原线路司机才能操作。
    是否采用 **采购商设置** 来调整？
    :::

    ::: warning 押金退款申请、押金退款查询添加子线路号
    押金退款申请、押金退款查询 两个页面，在数据列表页的“线路号”项目中，线路号显示格式变更为“705-12-0”，即添加了子线路号的显示。   
    这个线路号和标签、三联单上的线路号一致。页面查询条件，查询线路时不变，仍然查询主线路号705等。
    :::

    2021-04-13

    <br/>