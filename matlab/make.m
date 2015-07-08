% This make.m is for MATLAB and OCTAVE under Windows, Mac, and Unix

try
	% This part is for OCTAVE
	if (exist ('OCTAVE_VERSION', 'builtin'))
		mex libsvmread.c
		mex libsvmwrite.c
		mex -I.. svmtrain.c ../svm.cpp svm_model_matlab.c
		mex -I.. svmpredict.c ../svm.cpp svm_model_matlab.c
	% This part is for MATLAB
	% Add -largeArrayDims on 64-bit machines of MATLAB
	else
		mex CFLAGS="\$CFLAGS -std=c99" -largeArrayDims libsvmread.c
		mex CFLAGS="\$CFLAGS -std=c99" -largeArrayDims libsvmwrite.c
		mex CFLAGS="\$CFLAGS -std=c99" -I.. -largeArrayDims svmtrain.c ../svm.cpp svm_model_matlab.c
		mex CFLAGS="\$CFLAGS -std=c99" -I.. -largeArrayDims svmpredict.c ../svm.cpp svm_model_matlab.c
	end
catch
	fprintf('If make.m fails, please check README about detailed instructions.\n');
end
