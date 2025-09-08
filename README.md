
# SageMath Docker

[本项目](https://github.com/MetaMikuAI/sagemath-docker) 为 SageMath 的个人 Docker 镜像，集成了常用数学库和 CTF Crypto 相关插件

## 构建镜像

   ```powershell
   git clone https://github.com/MetaMikuAI/sagemath-docker.git
   git checkout 9.8
   docker build -t metamiku/sagemath:9.8 .
   ```

## 运行容器

```powershell
docker run -it -p 8888:8888 --name metamiku_sagemath_9.8 metamiku/sagemath:9.8
```

访问容器内打印的地址 (如 http://127.0.0.1:8888/tree?token=010b95173ebdf0b64b64890382f5cd0fa8a03319eb686ec0) 即可使用 Jupyter Notebook。

## 依赖项目

| 项目        | 版本         | 协议 | 地址 |
| ----------- | ------------ | ------------- | ------------- |
| SageMath    | 9.8          | [GPL-3](https://github.com/sagemath/sage/blob/develop/COPYING.txt) | https://hub.docker.com/r/sagemath/sagemath |
| gmp         | 6.2.1        | [LGPL-3](https://www.gnu.org/licenses/lgpl-3.0.html) | https://gmplib.org/download/gmp/ |
| mpfr        | 4.2.1        | [LGPL-3](https://www.mpfr.org/) | https://www.mpfr.org/mpfr-current/ |
| flint       | 3.1.3 | [LGPL-3](https://flintlib.org/doc/history.html#flint-3-1-0) | https://flintlib.org/downloads.html |
| msolve      | 0.7.3        | [GPL-2](https://github.com/algebraic-solving/msolve/blob/master/COPYING) | https://github.com/algebraic-solving/msolve |
| flatter     | d2b8026  | [LGPL-3](https://github.com/keeganryan/flatter/blob/main/COPYING.LESSER) | https://github.com/keeganryan/flatter |
| lbc_toolkit | v0.1.0 | [MIT](https://github.com/josephsurin/lattice-based-cryptanalysis/blob/main/LICENSE) | https://github.com/josephsurin/lattice-based-cryptanalysis |

## 目录结构

```
sagemath-docker
├── Dockerfile
├── README.md
└── sources
    ├── flatter-d2b8026.tar.gz
    ├── flint-3.1.3.tar.gz
    ├── gmp-6.2.1.tar.xz
    ├── lattice-based-cryptanalysis-v0.1.0.tar.gz
    ├── mpfr-4.2.1.tar.gz
    └── msolve-0.7.3.tar.gz
```
