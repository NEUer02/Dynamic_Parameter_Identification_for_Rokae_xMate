# 关于本文件夹下的内容说明
该文件夹下存放的是一些关于机器人动力学模型参数辨识中几种不同方法的实现、过程中产生的数据以及一些通用的函数。



## data文件夹
该文件夹下分为两个部分，

### parameters_identified

该文件夹中存放了不同算法所辨识出的动力学模型参数的值。

“Stribeck”为使用了Stribeck摩擦力模型的动力学模型参数辨识结果、“traditional”为使用库伦-粘滞摩擦力模型的动力学模型参数辨识结果、“two_step”为使用了两步法辨识策略的使用了改进Stribeck摩擦力模型的动力学模型参数辨识结果。

### Semi_parameters

该文件夹相关的辨识算法还在施工过程中。



### “filtering_data_no_downsampling.mat”文件

该文件为滤波过后的激励轨迹数据，包括关节位置、速度、加速度和力矩。



## figs文件夹

没啥用，原仓库中的文件，没动过。



## semi-parameters文件夹

该文件夹尚未施工完毕。



## Stribeck文件夹

存放了使用Stribeck摩擦力模型的动力学模型参数辨识方法。

辨识请运行：identify_dynamic_parameters_with_Stribeck.mlx

效果验证请运行：verify_parameters_Stribeck.mlx

具体请见[关于Stribeck辨识算法的说明](./Stribeck/README.md)



## traditional文件夹

存放了使用库伦-粘滞摩擦力模型的动力学模型参数辨识方法。针对该种动力学模型根据不同优化方法分为不同的文件夹。

fmincon文件夹中使用了内点法进行优化，least_squares文件夹中使用了最小二乘法进行优化。

效果验证文件在verify文件夹中。



## two-step文件夹

存放了使用了两步法辨识策略同时使用了改进Stribeck摩擦力模型的动力学模型参数辨识算法。

辨识请运行：identify_dynamic_parameters_Stribeck.mlx

效果验证合并在了辨识文件中，即identify_dynamic_parameters_Stribeck.mlx。



## utils文件夹

一些通用的函数工具。



---

编辑于2023年5月3日--庞嗷呜
