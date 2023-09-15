class fifo_scoreboard extends uvm_scoreboard;
  uvm_analysis_imp#(fifo_sequence_item, fifo_scoreboard) item_got_export;
  `uvm_component_utils(fifo_scoreboard)
  
  function new(string name = "fifo_scoreboard", uvm_component parent);
    super.new(name, parent);
    item_got_export = new("item_got_export", this);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  bit [127:0] queue[$];
   
  function void write(input fifo_sequence_item item_got);
    bit [127:0] examdata;
    if(item_got.i_wren == 'b1)begin
      if(queue.size() < 1023) begin
      queue.push_back(item_got.i_wrdata);
      end
        else
          begin
          $display("---------FIFO IS FULL------------");
      end
      `uvm_info("write Data", $sformatf("write: %0d read: %0d wrdata: %0d full: %0d almost full: %0d",item_got.i_wren, item_got.i_rden,item_got.i_wrdata, item_got.o_full, item_got.o_alm_full), UVM_LOW);
    end
    
     if (item_got.i_rden == 'b1)begin
      if(queue.size() >= 'd1)begin
        examdata = queue.pop_front();
      end
       else
         begin
           $display("-------FIFO IS EMPTY---------");
         end
       `uvm_info("Read Data", $sformatf("examdata: %0d rddata: %0d empty: %0d almost empty: %0d", examdata, item_got.o_rddata, item_got.o_empty, item_got.o_alm_empty), UVM_LOW);
        if(examdata == item_got.o_rddata)begin
          $display("-------- Pass! --------");
        end
        else begin
          $display("-------Fail!-------");
        end
     end
  
  endfunction
 
endclass
        
