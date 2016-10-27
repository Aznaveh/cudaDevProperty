all:
	nvcc -arch=sm_20 test.cu -run
