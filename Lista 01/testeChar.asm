loop:  
  li   $v0, 12       
  syscall            # Read Character

  addiu $a0, $v0, 1  # $a0 gets the next char

  li   $v0, 11       
  syscall            # Write Character

  b loop
  nop