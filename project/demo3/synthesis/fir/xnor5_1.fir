circuit xnor5_1:
  module xnor5_1:
    input func: UInt<5>
    input opcode: UInt<5>
    output out: UInt<1>

    wire _and_____verilog_xnor5_1_v_13_1037_Y: UInt<1>
    wire _and_____verilog_xnor5_1_v_13_1038_Y: UInt<1>
    wire _and_____verilog_xnor5_1_v_13_1039_Y: UInt<1>
    wire _xor_____verilog_xnor5_1_v_10_1033_Y: UInt<1>
    wire _xor_____verilog_xnor5_1_v_11_1035_Y: UInt<1>
    wire _xor_____verilog_xnor5_1_v_7_1027_Y: UInt<1>
    wire _xor_____verilog_xnor5_1_v_8_1029_Y: UInt<1>
    wire _xor_____verilog_xnor5_1_v_9_1031_Y: UInt<1>
    wire xor0: UInt<1>
    wire xor1: UInt<1>
    wire xor2: UInt<1>
    wire xor3: UInt<1>
    wire xor4: UInt<1>
    wire _and_____verilog_xnor5_1_v_13_1037: UInt<1>
    wire _and_____verilog_xnor5_1_v_13_1038: UInt<1>
    wire _and_____verilog_xnor5_1_v_13_1039: UInt<1>
    wire _and_____verilog_xnor5_1_v_13_1040: UInt<1>
    wire _not_____verilog_xnor5_1_v_10_1034: UInt<1>
    wire _not_____verilog_xnor5_1_v_11_1036: UInt<1>
    wire _not_____verilog_xnor5_1_v_7_1028: UInt<1>
    wire _not_____verilog_xnor5_1_v_8_1030: UInt<1>
    wire _not_____verilog_xnor5_1_v_9_1032: UInt<1>
    wire _xor_____verilog_xnor5_1_v_10_1033: UInt<1>
    wire _xor_____verilog_xnor5_1_v_11_1035: UInt<1>
    wire _xor_____verilog_xnor5_1_v_7_1027: UInt<1>
    wire _xor_____verilog_xnor5_1_v_8_1029: UInt<1>
    wire _xor_____verilog_xnor5_1_v_9_1031: UInt<1>

    _and_____verilog_xnor5_1_v_13_1037 <= and(pad(xor0, 1), asUInt(pad(xor1, 1)))
    _and_____verilog_xnor5_1_v_13_1038 <= and(pad(_and_____verilog_xnor5_1_v_13_1037_Y, 1), asUInt(pad(xor2, 1)))
    _and_____verilog_xnor5_1_v_13_1039 <= and(pad(_and_____verilog_xnor5_1_v_13_1038_Y, 1), asUInt(pad(xor3, 1)))
    _and_____verilog_xnor5_1_v_13_1040 <= and(pad(_and_____verilog_xnor5_1_v_13_1039_Y, 1), asUInt(pad(xor4, 1)))
    _not_____verilog_xnor5_1_v_10_1034 <= not(pad(_xor_____verilog_xnor5_1_v_10_1033_Y, 1))
    _not_____verilog_xnor5_1_v_11_1036 <= not(pad(_xor_____verilog_xnor5_1_v_11_1035_Y, 1))
    _not_____verilog_xnor5_1_v_7_1028 <= not(pad(_xor_____verilog_xnor5_1_v_7_1027_Y, 1))
    _not_____verilog_xnor5_1_v_8_1030 <= not(pad(_xor_____verilog_xnor5_1_v_8_1029_Y, 1))
    _not_____verilog_xnor5_1_v_9_1032 <= not(pad(_xor_____verilog_xnor5_1_v_9_1031_Y, 1))
    _xor_____verilog_xnor5_1_v_10_1033 <= xor(pad(bits(opcode, 3, 3), 1), asUInt(pad(bits(func, 3, 3), 1)))
    _xor_____verilog_xnor5_1_v_11_1035 <= xor(pad(bits(opcode, 4, 4), 1), asUInt(pad(bits(func, 4, 4), 1)))
    _xor_____verilog_xnor5_1_v_7_1027 <= xor(pad(bits(opcode, 0, 0), 1), asUInt(pad(bits(func, 0, 0), 1)))
    _xor_____verilog_xnor5_1_v_8_1029 <= xor(pad(bits(opcode, 1, 1), 1), asUInt(pad(bits(func, 1, 1), 1)))
    _xor_____verilog_xnor5_1_v_9_1031 <= xor(pad(bits(opcode, 2, 2), 1), asUInt(pad(bits(func, 2, 2), 1)))

    _and_____verilog_xnor5_1_v_13_1037_Y <= bits(_and_____verilog_xnor5_1_v_13_1037, 0, 0)
    _and_____verilog_xnor5_1_v_13_1038_Y <= bits(_and_____verilog_xnor5_1_v_13_1038, 0, 0)
    _and_____verilog_xnor5_1_v_13_1039_Y <= bits(_and_____verilog_xnor5_1_v_13_1039, 0, 0)
    _xor_____verilog_xnor5_1_v_10_1033_Y <= bits(_xor_____verilog_xnor5_1_v_10_1033, 0, 0)
    _xor_____verilog_xnor5_1_v_11_1035_Y <= bits(_xor_____verilog_xnor5_1_v_11_1035, 0, 0)
    _xor_____verilog_xnor5_1_v_7_1027_Y <= bits(_xor_____verilog_xnor5_1_v_7_1027, 0, 0)
    _xor_____verilog_xnor5_1_v_8_1029_Y <= bits(_xor_____verilog_xnor5_1_v_8_1029, 0, 0)
    _xor_____verilog_xnor5_1_v_9_1031_Y <= bits(_xor_____verilog_xnor5_1_v_9_1031, 0, 0)
    out <= bits(_and_____verilog_xnor5_1_v_13_1040, 0, 0)
    xor0 <= bits(_not_____verilog_xnor5_1_v_7_1028, 0, 0)
    xor1 <= bits(_not_____verilog_xnor5_1_v_8_1030, 0, 0)
    xor2 <= bits(_not_____verilog_xnor5_1_v_9_1032, 0, 0)
    xor3 <= bits(_not_____verilog_xnor5_1_v_10_1034, 0, 0)
    xor4 <= bits(_not_____verilog_xnor5_1_v_11_1036, 0, 0)
