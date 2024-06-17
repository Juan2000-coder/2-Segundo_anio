function y=lagrangeC(x)
	%tm=[0;15.98;38.73;75.56;114.52];%Resistor
	%vm=[30;25;20;15;10];%Resistor
	tm=[0;19.57;42.58;77.43;108.46];%capacitor
	vm=0:5:20;%capacitor
	y=0;
	for i=1:length(vm)
		prod=vm(i);
		for j=1:length(tm)
			if i!=j
				prod=(prod.*((x.-tm(j))/(tm(i)-tm(j))));
			endif
		endfor
		y=y.+prod;
	endfor
endfunction