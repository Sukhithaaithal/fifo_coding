class fifo_sequence_item extends uvm_sequence_item;

    //---------------------------------------
  //data and control fields
  //---------------------------------------

   rand bit i_wren;
   rand bit i_rden;
   rand bit [127:0] i_wrdata;
   bit o_full;
   bit o_empty;
   bit o_alm_full;
   bit o_alm_empty;
   bit [127:0] o_rddata;


    //---------------------------------------
  //Utility and Field macros
  //-----------------------------------------

    `uvm_object_utils_begin(fifo_sequence_item)
   `uvm_field_int(i_wrdata, UVM_ALL_ON)
   `uvm_field_int( i_rden, UVM_ALL_ON)
   `uvm_field_int(i_wren, UVM_ALL_ON)
   `uvm_field_int(o_full, UVM_ALL_ON)
   `uvm_field_int(o_empty, UVM_ALL_ON)
   `uvm_field_int(o_alm_full, UVM_ALL_ON)
   `uvm_field_int(o_alm_empty, UVM_ALL_ON)
   `uvm_field_int(o_rddata, UVM_ALL_ON)
  `uvm_object_utils_end

    constraint c1 {{i_wren,i_rden} inside {2'b00,2'b01,2'b10,2'b11};}


   //---------------------------------------
  //Constructor
  //---------------------------------------

    function new(string name="fifo_sequence_item");
    super.new(name);
  endfunction


     function string convert2string();
         return $psprintf("i_wrdata=%0h,o_rddata=%0h,i_wren=%0d,i_rden=%0d,o_full=%od,o_empty=%0d",i_wrdata,o_rddata,i_wren,i_rden,o_full,o_empty);
  endfunction

endclass

