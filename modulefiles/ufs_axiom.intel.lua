help([[
loads UFS Model prerequisites for Axiom Azure clusters with Intel + OpenMPI
]])

intel_ver=os.getenv("intel_ver") or "2022.2"
load(pathJoin("intel", intel_ver))

openmpi_ver=os.getenv("openmpi_ver") or "4.1.5"
load(pathJoin("openmpi", openmpi_ver))

prepend_path("MODULEPATH", "/lustre/save/spack-stack/envs/ubuntu20-intel2022.2-override-openmpi-v2/install/modulefiles/Core")
prepend_path("MODULEPATH", "/lustre/save/spack-stack/envs/ubuntu20-intel2022.2-override-openmpi-v2/install/modulefiles/")

load("stack-intel/2021.6.0")
load("stack-openmpi/4.1.5")

load("ufs_common")

setenv("CC", "mpicc")
setenv("CXX", "mpicxx")
setenv("FC", "mpifort")
setenv("CMAKE_Platform", "axiom.intel")

whatis("Description: UFS build environment")
