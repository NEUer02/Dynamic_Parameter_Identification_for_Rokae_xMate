# Guidance:

> 写在前面：
>
> 本仓库基于[YanjunLIU-ac](https://github.com/YanjunLIU-ac/Dynamic_Parameter_Identification_for_Rokae_xMate)的仓库进行修改。下面的文档也出自原作者。
>
> 本仓库对原作者的仓库修改的部分为：
>
> 1. 替换了真实的上机数据和回归矩阵；
> 2. 归回矩阵使用symoro计算得出。symoro可以参考清风伴酒的[配置过程](https://zhuanlan.zhihu.com/p/621143395)和[使用指南](https://zhuanlan.zhihu.com/p/447348147)。一同附上symoro文件；
>
> 鸣谢[YanjunLIU-ac](https://github.com/YanjunLIU-ac)和[清风伴酒](https://www.zhihu.com/people/xukun-68-46)的努力和付出！



Dynamic parameter identification code for rokae xmate manipulator based on MATLAB, including excitation trajectory optimization, LSM method, and N-E formulation of dynamic equation.

## Project Structure and Description:

### Dynamics: 
- Formulate robot dynamic model through Newton-Euler method.
- Linearize robot dynamic model to obtain regressor.
- Apply QR decomposition to obtain minimal regressor.
- Convert minimal parameter set Pmin to standard set.
- Verify error between observation and NE-based estimation. 
- Deduce robot dynamic equation item.  

See `./dynamics/README.md` and `run_dynamics.m` for details. 

### Excitation:
- optimize excitation trajectory based on cond of minimal regressor.
- matrixized constraints for trajectory optimization:
|q| < qmax, |qd| < qdmax, |qdd| < qddmax, q0=qn=q_init
- plot figures of {q, qd, qdd, cart_pos} and also animation.
- cpp scripts for running excitation trajectory based on rci client.  

See `./excitation/README.md` and `run_optimize.m` for details.

### Filtering:
- Downsample observation data to assigned size.
- Apply butterworth and zero-phase filter to q, qd, qdd, tau data.
- Plot figures of raw and filtered data.  

See `./filtering/README.md` and `run_filtering.m` for details.

### Identify:
- Apply LSE (least square estimation) to figure out minimal param set.
- Verify error between observation and estimation by min regressor.  

See `./identify/README.md` and `run_identify.m` for details.

## Usage scenarios:
### Identification pipeline:
<div align="center">
  <img src="flowchart.png" height=500>
</div>

1. Derive robot dynamics, regressor and minimum paramset: `run_dynamics.m` PART-IA and PART-IB.
2. Optimize excitation trajectory: `run_optimze.m`.
3. Data filtering and processing: `run_filtering.m`.
4. Estimate minimum paramset using LSE: `run_identify.m`.
5. Map minimum paramset to standard paramset: `run_dynamics.m` PART-II.
6. [OPTIONAL] Test the performance of identified dynamics model with standard paramset: `run_dynamics.m` PART-III.

Notes:
1. Keep System of Units consistent throughout the project (mm and Nmm).
2. Additional adjustment of virtual mass in `dyn_mapping_Pmin2P.m` is needed for better paramset mapping.

### Excitation Trajectory Optimization:
  Obtain min regressor matrix in `\dynamics` and then turn to `\excitation`.

### Validation Error Verification:
  Copy raw sensor data in `\filtering` and then turn to `\dynamics`.



