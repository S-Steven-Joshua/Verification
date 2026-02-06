module alu_assertion(alu_interface vif);

    // always @(*) ensures we track any change in the combinational path
    always @(*) begin
        // Skip checking if any input is X/Z to avoid false errors at startup
        if (!$isunknown({vif.a, vif.b, vif.sel})) begin

            case (vif.sel)
                3'b000: begin // ADD
                    // Cast result to 20 bits to match vif.y width
                    assert #0 (vif.y === 20'(vif.a + vif.b))
                    else $error("ALU ADD FAIL: a=%0d b=%0d y=%0d exp=%0d", vif.a, vif.b, vif.y, 20'(vif.a + vif.b));
                end

                3'b001: begin // SUB
                    assert #0 (vif.y === 20'(vif.a - vif.b))
                    else $error("ALU SUB FAIL: a=%0d b=%0d y=%0d exp=%0d", vif.a, vif.b, vif.y, 20'(vif.a - vif.b));
                end

                3'b010: begin // MUL
                    assert #0 (vif.y === 20'(vif.a * vif.b))
                    else $error("ALU MUL FAIL: a=%0d b=%0d y=%0d exp=%0d", vif.a, vif.b, vif.y, 20'(vif.a * vif.b));
                end

                3'b011: begin // CMP
                    // Checking individual bits of the 20-bit result
                    assert #0 (vif.y[0] === (vif.a == vif.b) && 
                               vif.y[1] === (vif.a > vif.b)  && 
                               vif.y[2] === (vif.a < vif.b))
                    else $error("ALU CMP FAIL: a=%0d b=%0d y=%b", vif.a, vif.b, vif.y[2:0]);
                end

                3'b100: begin // AND
                    assert #0 (vif.y === 20'(vif.a & vif.b))
                    else $error("ALU AND FAIL: a=%b b=%b y=%b exp=%b", vif.a, vif.b, vif.y, 20'(vif.a & vif.b));
                end

                3'b101: begin // OR
                    assert #0 (vif.y === 20'(vif.a | vif.b))
                    else $error("ALU OR FAIL: a=%b b=%b y=%b exp=%b", vif.a, vif.b, vif.y, 20'(vif.a | vif.b));
                end

                3'b110: begin // SHL (Shift Left)
                    // Use 20 bit casting to ensure the shifted bit isn't lost before comparison
                    assert #0 (vif.y === 20'(vif.a << 1))
                    else $error("ALU SHL FAIL: a=%b y=%b exp=%b", vif.a, vif.y, 20'(vif.a << 1));
                end

                3'b111: begin // SHR (Shift Right)
                    assert #0 (vif.y === 20'(vif.a >> 1))
                    else $error("ALU SHR FAIL: a=%b y=%b exp=%b", vif.a, vif.y, 20'(vif.a >> 1));
                end
            endcase
        end
    end

endmodule