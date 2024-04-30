<h1>VSD Hardware Digital Program -Digital</h1>

<h2>Tool Installation</h2>

<h3>Yosys</h3>

```
$ git clone https://github.com/YosysHQ/yosys.git
$ cd yosys-master 
$ sudo apt install make 
$ sudo apt-get install yosys
```

![WhatsApp Image 2024-04-16 at 21 25 34](https://github.com/tushgpats/sfal-vsd/assets/47535296/0406329f-07c6-4ab3-9b15-3010b0528845)

<h3>Iverilog</h3>

```
$ sudo apt-get install iverilog
```

![WhatsApp Image 2024-04-16 at 21 49 33](https://github.com/tushgpats/sfal-vsd/assets/47535296/5af5dcc6-5366-4c45-bff2-00b590227747)

<h3>gtkwave</h3>

```
$ sudo apt install gtkwave
```

![WhatsApp Image 2024-04-16 at 21 33 36](https://github.com/tushgpats/sfal-vsd/assets/47535296/24bb3cf4-b11e-4687-8246-2227c6dd32ec)

<h1> Day 1 - Introduction to Verilog RTL design and Synthesis </h1>

We First run simulation on the good_mux using our testbench tb_good_mux in IVerilog

![WhatsApp Image 2024-04-23 at 16 03 25](https://github.com/tushgpats/sfal-vsd/assets/47535296/3d0e8105-a7d2-40da-b873-b0c0b42520c5)
![WhatsApp Image 2024-04-23 at 16 04 20](https://github.com/tushgpats/sfal-vsd/assets/47535296/3d1537ab-59b4-47c8-86e2-1c0a61649e51)

We now observe the waveforms with gtkwave

![WhatsApp Image 2024-04-23 at 16 01 01](https://github.com/tushgpats/sfal-vsd/assets/47535296/c73af362-67c3-4718-ad93-d0b943af40bb)

<h1> Day 4 - GLS, blocking vs non-blocking and Synthesis-Simulation mismatch</h1> 

GLS refers to running simulation on the netlist of a fiven RTL design. The idea behind this is than the netlist is logically same as that of the RTL code. 
We perform GLS to verify the logical correctness of the design.
The resons for this could be Improper sensitivity list or incorrect use of blocking statements.

<img width="1026" alt="Screenshot 2024-04-29 at 2 44 13 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/83cd7dd3-b8ea-4b5b-ac12-82abded46780">
<img width="1026" alt="Screenshot 2024-04-29 at 2 58 06 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/59f62df7-87e0-4c92-9125-e2b8cfb4ef47">
<img width="1026" alt="Screenshot 2024-04-29 at 3 13 30 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/40caaf52-9b5d-4eca-9ddb-d62d5f3554f4">
<img width="1026" alt="Screenshot 2024-04-29 at 3 23 43 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/0875fd54-40c7-49b6-9d44-5ab7c2609369">
<img width="958" alt="Screenshot 2024-04-29 at 4 04 05 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/050981f7-0447-41d3-977a-159b6cf74b37">
<img width="958" alt="Screenshot 2024-04-29 at 4 09 20 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/c6822970-afd2-417d-8012-a942d261030b">
<img width="965" alt="Screenshot 2024-04-29 at 4 12 40 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/457a1192-29eb-46dd-a9cd-4f7618aad03d">

Now let us take a look at lab outcomes. We first take a look at the outcomes for sensitivity list 
<img width="1439" alt="Screenshot 2024-04-29 at 4 31 09 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/c5fabce8-ec61-4295-8431-ef03bc717379">
<img width="658" alt="Screenshot 2024-04-29 at 4 33 58 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/68fae173-d881-4268-acad-c9c125c0c983">
<img width="658" alt="Screenshot 2024-04-29 at 4 35 23 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/be22bce3-10c8-4634-b22d-76ea40b0f1de">
<img width="608" alt="Screenshot 2024-04-29 at 4 36 00 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/89ae36f8-235c-4d8a-9fa5-ec9e1693ddc2">
<img width="1440" alt="Screenshot 2024-04-29 at 6 23 42 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/f54537bf-b6e2-452b-8875-fa930006d278">
<img width="1440" alt="Screenshot 2024-04-30 at 10 25 32 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/05ef46b4-5fb9-458e-96e2-af2fd3159d3e">
<img width="636" alt="Screenshot 2024-04-30 at 10 33 59 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/79baee17-aa99-4199-af83-7389a2f4f878">
<img width="636" alt="Screenshot 2024-04-30 at 10 34 54 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/1ebadc87-2151-4862-8feb-f48b8ee053cd">
<img width="636" alt="Screenshot 2024-04-30 at 10 38 30 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/63d395ce-1fcd-4bd9-80c3-0f02f0a05384">
<img width="1430" alt="Screenshot 2024-04-30 at 10 57 58 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/b2d0bc7c-bae2-464e-b7ed-705cd3b4a126">
<img width="1430" alt="Screenshot 2024-04-30 at 11 33 50 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/f9b2f190-7cc6-443a-8055-90acfe7b2f09">
<img width="609" alt="Screenshot 2024-04-30 at 11 52 48 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/6a8a18d0-3962-4baa-94af-5617ed774f41">
<img width="609" alt="Screenshot 2024-04-30 at 12 01 54 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/bdc1fb04-ae6a-4457-a254-d8c21d3b3a92">
<img width="1440" alt="Screenshot 2024-04-30 at 12 11 37 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/c5e9f2fb-9a55-4a39-9f4b-c3643f099a45">
<img width="944" alt="Screenshot 2024-04-30 at 12 12 52 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/3dc22062-6c48-4bbf-9a0c-9fcf0191d474">
