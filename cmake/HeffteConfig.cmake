include("${CMAKE_CURRENT_LIST_DIR}/HeffteTargets.cmake")

if (@Heffte_ENABLE_FFTW@)
    add_library(Heffte::FFTW INTERFACE IMPORTED GLOBAL)
    target_link_libraries(Heffte::FFTW INTERFACE @FFTW_LIBRARIES@)
    set_target_properties(Heffte::FFTW PROPERTIES INTERFACE_INCLUDE_DIRECTORIES @FFTW_INCLUDES@)
endif()

if (NOT TARGET MPI::MPI_CXX)
    if (NOT MPI_CXX_COMPILER)
        set(MPI_CXX_COMPILER @MPI_CXX_COMPILER@)
    endif()
    find_package(MPI REQUIRED)
endif()

set(Heffte_SHARED_FOUND  "@BUILD_SHARED_LIBS@")
set(Heffte_FFTW_FOUND    "@Heffte_ENABLE_FFTW@")
set(Heffte_MKL_FOUND    "@Heffte_ENABLE_MKLW@")
set(Heffte_CUDA_FOUND    "@Heffte_ENABLE_CUDA@")

