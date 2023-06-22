help([[
loads UFS Model prerequisites for Axiom Azure clusters with Intel + OpenMPI
]])

intel_ver=os.getenv("intel_ver") or "2022.2-override"
load(pathJoin("intel", intel_ver))

openmpi_ver=os.getenv("openmpi_ver") or "4.1.5"
load(pathJoin("openmpi", openmpi_ver))

prepend_path("MODULEPATH", "/lustre/save/spack-stack/envs/ubuntu20-intel2022.2-override-openmpi-v2/install/modulefiles/Core")
prepend_path("MODULEPATH", "/lustre/save/spack-stack/envs/ubuntu20-intel2022.2-override-openmpi-v2/install/modulefiles/")

load("stack-intel/2021.6.0")
load("stack-openmpi/4.1.5")

setenv("CC", "mpicc")
setenv("CXX", "mpicxx")
setenv("FC", "mpifort")
setenv("CMAKE_Platform", "axiom.intel")

whatis("Description: UFS build environment")

local ufs_modules = {
  {["jasper"]      = "2.0.25"},
  {["zlib"]        = "1.2.11"},
  {["libpng"]      = "1.6.37"},
  {["hdf5"]        = "1.10.6"},
  {["netcdf-c"]    = "4.7.4"},
  {["netcdf-fortran"] = "4.5.4"},
  {["pio"]         = "2.5.7"},
  {["esmf"]        = "8.3.0b09"},
  {["fms"]         = "2022.04"},
  {["bacio"]       = "2.4.1"},
  {["crtm"]        = "2.4.0"},
  {["g2"]          = "3.4.5"},
  {["g2tmpl"]      = "1.10.2"},
  {["ip"]          = "3.3.3"},
  {["sp"]          = "2.3.3"},
  {["w3emc"]       = "2.9.2"},
  {["gftl-shared"] = "1.5.0"},
  {["mapl"]        = "2.22.0-esmf-8.3.0b09"},
}

for i = 1, #ufs_modules do
  for name, default_version in pairs(ufs_modules[i]) do
    local env_version_name = string.gsub(name, "-", "_") .. "_ver"
    load(pathJoin(name, os.getenv(env_version_name) or default_version))
  end
end
