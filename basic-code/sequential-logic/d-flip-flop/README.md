# d-flip-flop example

_A positive edge d flip-flop with synchronous enable.
This selectively captures a digital value._

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## SCHEMATIC

_This figure was created using `LaTeX` in
[my-latex-graphs](https://github.com/JeffDeCola/my-latex-graphs/tree/master/mathematics/applied/electrical-engineering/logic/d-flip-flop)
repo._

<p align="center">
    <img src="svgs/d-flip-flop.svg"
    align="middle"
</p>

## TRUTH TABLE

| q_prev  | en     | d     | q      |
|:-------:|:------:|:-----:|:------:|
| 0       |  0     |  X    | 0      |
| 1       |  0     |  X    | 1      |
| X       |  1     |  0    | 0      |
| X       |  1     |  1    | 1      |

## VERILOG CODE

The main verilog code is,

```verilog
    assign q_bar = ~q;

    // D FLIP-FLOP WITH SYNC ENABLE
    always @ (posedge clk) begin
        if (en) begin
            q <= d;
        end else begin
            q <= q;
        end
    end
```

The entire code is
[d-flip-flop.v](d-flip-flop.v).

## RUN (SIMULATE)

I used my testbench
[d-flip-flop-tb.v](d-flip-flop-tb.v) with
[iverilog](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/iverilog-cheat-sheet)
to simulate and create a `.vcd` file.

```bash
sh run-test.sh
```

## CHECK WAVEFORM

Check you waveform using your `.vcd` file with a waveform viewer.

I used [GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
and launch it using
[launch-gtkwave.sh](launch-gtkwave.sh).

![d-flip-flop-waveform.jpg](../../../docs/pics/d-flip-flop-waveform.jpg)

## TESTED IN HARDWARE - BURNED TO A FPGA

To test my design in real hardware, the above code was synthesized using the
[Xilinx Vivado](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/synthesis/xilinx-vivado-cheat-sheet)
IDE software suite and burned to a FPGA development board.
