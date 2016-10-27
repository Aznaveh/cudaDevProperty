
struct cudaDeviceProp {
    char name[256];
    size_t totalGlobalMem;
    size_t sharedMemPerBlock;
    int regsPerBlock;
    int warpSize;
    size_t memPitch;
    int maxThreadsPerBlock;
    int maxThreadsDim[3];
    int maxGridSize[3];
    size_t totalConstMem;
    int major;
    int minor;
    int clockRate;
    size_t textureAlignment;
    int deviceOverlap;
    int multiProcessorCount;
    int kernelExecTimeoutEnabled;
    int integrated;
    int canMapHostMemory;
    int computeMode;
    int concurrentKernels;
    int ECCEnabled;
    int pciBusID;
    int pciDeviceID;
    int tccDriver;
}

where:

name[256] is an ASCII string identifying the device;

totalGlobalMem is the total amount of global memory available on the device in bytes;

sharedMemPerBlock is the maximum amount of shared memory available to a thread block in bytes; this amount is shared by all thread blocks simultaneously resident on a multiprocessor;

regsPerBlock is the maximum number of 32-bit registers available to a thread block; this number is shared by all thread blocks simultaneously resident on a multiprocessor;

warpSize is the warp size in threads;

memPitch is the maximum pitch in bytes allowed by the memory copy functions that involve memory regions allocated through cudaMallocPitch();

maxThreadsPerBlock is the maximum number of threads per block;

maxThreadsDim[3] contains the maximum size of each dimension of a block;

maxGridSize[3] contains the maximum size of each dimension of a grid;

clockRate is the clock frequency in kilohertz;

totalConstMem is the total amount of constant memory available on the device in bytes;

major, minor are the major and minor revision numbers defining the device's compute capability;

textureAlignment is the alignment requirement; texture base addresses that are aligned to textureAlignment bytes do not need an offset applied to texture fetches;

deviceOverlap is 1 if the device can concurrently copy memory between host and device while executing a kernel, or 0 if not;

multiProcessorCount is the number of multiprocessors on the device;

kernelExecTimeoutEnabled is 1 if there is a run time limit for kernels executed on the device, or 0 if not.

integrated is 1 if the device is an integrated (motherboard) GPU and 0 if it is a discrete (card) component.

canMapHostMemory is 1 if the device can map host memory into the CUDA address space for use with cudaHostAlloc()/cudaHostGetDevicePointer(), or 0 if not;

computeMode is the compute mode that the device is currently in. Available modes are as follows:

cudaComputeModeDefault: Default mode - Device is not restricted and multiple threads can use cudaSetDevice() with this device.

cudaComputeModeExclusive: Compute-exclusive mode - Only one thread will be able to use cudaSetDevice() with this device.

cudaComputeModeProhibited: Compute-prohibited mode - No threads can use cudaSetDevice() with this device. Any errors from calling cudaSetDevice() with an exclusive (and occupied) or prohibited device will only show up after a non-device management runtime function is called. At that time, cudaErrorNoDevice will be returned.

concurrentKernels is 1 if the device supports executing multiple kernels within the same context simultaneously, or 0 if not. It is not guaranteed that multiple kernels will be resident on the device concurrently so this feature should not be relied upon for correctness;

ECCEnabled is 1 if the device has ECC support turned on, or 0 if not.

pciBusID is the PCI bus identifier of the device.

pciDeviceID is the PCI device (sometimes called slot) identifier of the device.

tccDriver is 1 if the device is using a TCC driver or 0 if not.


Parameters:
prop    - Properties for the specified device
device  - Device number to get properties for

Returns:
cudaSuccess, cudaErrorInvalidDevice


