%.rom:	%.temp
	dd if=$< of=$@ bs=4096 conv=sync

%.temp:	%.ecof
	./mips/bin/mipsel-ecoff-objcopy -O binary $< $@

%.ecof:	%.o
	./mips/bin/mipsel-ecoff-ld -EL -T ./mips/ld.script -o $@ ./mips/tiiolib.o $<


%.o:	%.S
	cpp $< | ./mips/bin/mipsel-ecoff-as -EL -o $@

#%.ecof:	%.o
#	vmipstool --ld-script=/usr/share/vmips/ld.script --link -o $@ tiiolib.o $<
#
#%.rom:	%.ecof
#	vmipstool --make-rom $< $@
#
#%.o:	%.S
#	vmipstool --verbose --assemble  -o $@ -I /usr/include/vmips $<

.PHONY:	clean

clean:	
	rm -f *.o *.rom *.ecof *.temp
