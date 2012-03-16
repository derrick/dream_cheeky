#include <dream_cheeky.h>

VALUE mDreamCheeky;

void Init_dream_cheeky(void)
{
  mDreamCheeky = rb_define_module("DreamCheeky");

  Init_dream_cheeky_big_red_button();
}
