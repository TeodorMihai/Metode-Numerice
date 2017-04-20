function [retval] = facto (n)
  if (n > 0)
    retval = n * facto (n-1);
  else
    retval = 1;
  endif
endfunction