string(APPEND CMAKE_C_FLAGS " -mcmodel=medium")
string(APPEND CMAKE_Fortran_FLAGS " -mcmodel=medium -fconvert=big-endian -ffree-line-length-none -ffixed-line-length-none")

if (CMAKE_Fortran_COMPILER_VERSION VERSION_GREATER_EQUAL 10)
   string(APPEND CMAKE_Fortran_FLAGS " -fallow-argument-mismatch")
endif()

string(APPEND CPPDEFS " -DFORTRANUNDERSCORE -DNO_R16 -DCPRGNU")

if (compile_threaded)
  string(APPEND CMAKE_C_FLAGS " -fopenmp")
  string(APPEND CMAKE_CXX_FLAGS " -fopenmp")
  string(APPEND CMAKE_Fortran_FLAGS " -fopenmp")
  string(APPEND CMAKE_EXE_LINKER_FLAGS " -fopenmp")
endif()

string(APPEND CMAKE_C_FLAGS_DEBUG   " -O0 -g -Wall -fbacktrace -fcheck=bounds -ffpe-trap=invalid,zero,overflow")
string(APPEND CMAKE_Fortran_FLAGS_DEBUG   " -O0 -g -Wall -fbacktrace -fcheck=bounds -ffpe-trap=zero,overflow")
string(APPEND CMAKE_CXX_FLAGS_DEBUG " -O0 -g -Wall -fbacktrace")
string(APPEND CPPDEFS_DEBUG  " -DYAKL_DEBUG")
string(APPEND CMAKE_C_FLAGS_RELEASE " -O")
string(APPEND CMAKE_CXX_FLAGS_RELEASE " -O")
string(APPEND CMAKE_Fortran_FLAGS_RELEASE " -O")

if (COMP_NAME STREQUAL csm_share)
  string(APPEND CMAKE_C_FLAGS " -std=c99")
endif()

string(APPEND CMAKE_Fortran_FORMAT_FIXED_FLAG " -ffixed-form")
string(APPEND CMAKE_Fortran_FORMAT_FREE_FLAG " -ffree-form")

set(MPICC "mpicc")
set(MPICXX "mpicxx")
set(MPIFC "mpif90")
set(SCC "gcc")
set(SCXX "g++")
set(SFC "gfortran")
