#include <dream_cheeky_big_red_button.h>


static void deallocate(void * handle)
{
  hid_close((hid_device *)handle);
}

static VALUE allocate(VALUE klass)
{
  hid_device * handle;

  handle = hid_open(0x1d34, 0x000d, NULL);
  /*handle = hid_open(0x1e54, 0x2030, NULL); // TypeMatrix*/
  if(!handle) {
    rb_exc_raise(rb_exc_new2(rb_eRuntimeError, "No Big Red Button Detected"));
  }

  hid_set_nonblocking(handle, 1);

  return Data_Wrap_Struct(klass, NULL, deallocate, handle);
}

static VALUE get_current_state(VALUE self)
{
  hid_device * handle;
  int res;
  unsigned char buf[8];

  Data_Get_Struct(self, hid_device, handle);

  // Set up the command buffer.
  memset(buf,0x00,sizeof(buf));
  buf[0] = 0x08;
  buf[7] = 0x02;

  hid_write(handle, buf, 8);
  res = 0;
  while (0 == res) {
    res = hid_read(handle, buf, 8);
    if (res == 0) {
      hid_write(handle, buf, 8);
      usleep(10000);
    }
  }

  return INT2NUM(buf[0]);
}


void Init_dream_cheeky_big_red_button()
{
  VALUE cDreamCheekyBigRedButton = rb_define_class_under(mDreamCheeky, "BigRedButton", rb_cObject);

  rb_define_alloc_func(cDreamCheekyBigRedButton, allocate);
  rb_define_method(cDreamCheekyBigRedButton, "get_current_state", get_current_state, 0);
}
