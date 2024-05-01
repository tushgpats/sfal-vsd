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


<h1>Day 2 - Timing libs(QTMs/ETMs), hierarchical vs flat synthesis and efficient flop coding styles </h1>
 Let us first start by taking a look at lib files. If we see we see lot of terms such as sc, fd, tt. here tt refers to typical and the term 25C refers to the operating tempreture of the chips that can be designed with this technologyu lib. Libraries can be slow , fast as well as typical we are also concerned about the PVT Parameters ie Process, voltage and Tempreture. It also describes the technology, time unit, Voltage, Capacitance, Current and Power units (ns,V,mA,nW).Operating conditions talk about PVT Parameters which in this case are Typical,25 Degrees C and 1 Volt. 
<img width="944" alt="Screenshot 2024-04-30 at 3 59 54 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/73e961f8-a79b-48d7-aa16-4de26a87f2c0">
<img width="447" alt="Screenshot 2024-04-30 at 4 07 25 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/c5146658-4eb7-4efd-8b3c-d9e64973bf95">

Now let us take a closer look at the lib files. Let us consider the very first cell. It has the functionality of the first cell. a21110 means the first 2 inputs are AND and rest all are ORed. We can confirm this by taking a look at its Verilog Model. For every possible input combination it is imperative that we should know the value of delay as well as power. this information is mention for every input combination. We also see information such as area, Pins and various parameters associated with the pin such as Capacitance, delay, transition time. there can also be similar gates as in this instance 2 diffrent AND2 gates with diffrent areas.
<img width="767" alt="Screenshot 2024-04-30 at 4 19 52 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/7f29a998-ba13-4744-beba-51c1001ef8fa">
<img width="767" alt="Screenshot 2024-04-30 at 4 20 32 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/e8492719-4d8f-4d51-8662-879bfe60072e">
<img width="767" alt="Screenshot 2024-04-30 at 4 38 30 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/ceef8c8d-405f-4873-8f73-d2c0c1c69b41">
<img width="767" alt="Screenshot 2024-04-30 at 4 39 40 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/477f00a0-dc49-4a8b-b6be-91ddbacc7f31">
<img width="800" alt="Screenshot 2024-04-30 at 4 49 58 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/7a471a84-27bd-43a4-9678-fc6816cf7289">

Now let us talk about Hierarchial and Flat Synthesis.
Hierarchical synthesis organizes a design into a hierarchy of smaller blocks, enabling modular development and easier management of complex systems. In contrast, flatten synthesis combines all design elements into a single level, simplifying implementation but potentially sacrificing readability and reusability. The choice between the two depends on the project's size, complexity, and requirements for maintainability and performance.

<img width="471" alt="Screenshot 2024-04-30 at 4 53 46 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/54de9664-ada9-4ee0-a576-f01aee8bfaaa">
<img width="453" alt="Screenshot 2024-04-30 at 4 55 00 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/73c8dd53-93f7-4bd2-9096-f1cde7b91813">
<img width="453" alt="Screenshot 2024-04-30 at 4 57 20 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/ffb6332b-34bd-40de-82ac-6679a8471809">

We now talk about optimizing flop coding styles.

<img width="472" alt="Screenshot 2024-04-30 at 4 59 01 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/ddea0f6c-30d7-49cf-8ff3-3a9f6a4e0a56">
<img width="472" alt="Screenshot 2024-04-30 at 4 58 37 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/72bc56df-7bc4-4d07-b573-8160b6138ccb">
<img width="916" alt="Screenshot 2024-04-30 at 5 00 45 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/4bade418-16b8-4c8c-870b-4a36f9f71991">
<img width="937" alt="Screenshot 2024-04-30 at 5 02 02 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/3c47a78a-0472-4748-8dbe-6e74ce55a575">
<img width="722" alt="Screenshot 2024-04-30 at 5 03 00 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/5660720c-ab4e-4a0b-84ab-bc01aa02b893">

Now let us move to labs

<img width="732" alt="Screenshot 2024-04-27 at 10 56 36 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/e82f9d1b-77c3-4baa-9228-243c6dbb0777">
<img width="1430" alt="Screenshot 2024-04-27 at 10 58 16 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/505869a6-8cc4-4cb7-a154-d0fec099b1c5">
<img width="732" alt="Screenshot 2024-04-27 at 10 53 13 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/8b9d178f-4076-4bd6-b059-f77fe6e9cf3d">
<img width="732" alt="Screenshot 2024-04-27 at 10 56 19 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/9e964b31-e59c-4c16-a29b-fe47e820177c">
<img width="1432" alt="Screenshot 2024-04-25 at 10 36 43 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/0ba316f9-50cb-4795-a9f9-f49eb3c61706">
<img width="1432" alt="Screenshot 2024-04-25 at 10 34 01 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/4c4957be-0a38-4077-932e-25323281eb77">
<img width="1384" alt="Screenshot 2024-04-27 at 8 33 44 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/ee850a4d-a372-4c86-be17-67d399751c6d">
<img width="1415" alt="Screenshot 2024-04-27 at 8 32 11 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/712da9c7-1c29-444d-b444-fabe5cccbfec">
<img width="1346" alt="Screenshot 2024-04-27 at 8 21 34 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/874a362e-def2-4f33-b136-d03260328af1">
<img width="1415" alt="Screenshot 2024-04-27 at 8 26 01 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/368ab688-d0bc-4dc5-a9be-82575f966dbe">
<img width="782" alt="Screenshot 2024-04-27 at 8 18 23 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/1334b2a5-e9d5-4ef2-9d66-682c577daea3">
<img width="782" alt="Screenshot 2024-04-27 at 8 18 43 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/cc7c5b35-f0e6-4055-8429-4863ac1035de">
<img width="782" alt="Screenshot 2024-04-27 at 8 17 48 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/c46123c7-0436-4dc8-bbd2-0eab9307604c">
<img width="782" alt="Screenshot 2024-04-27 at 8 15 34 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/2da7b71b-37bd-4b0a-8464-ec6e6b67eed3">
<img width="715" alt="Screenshot 2024-04-27 at 11 18 17 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/467976b8-09c8-4d36-b979-f36d0466b523">
<img width="715" alt="Screenshot 2024-04-27 at 11 18 46 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/2db12593-0a0d-4230-add8-88be4bc7d8a5">
<img width="715" alt="Screenshot 2024-04-27 at 11 21 12 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/dfa3660b-c440-4ddd-bd48-7f66e6c808ea">
<img width="1327" alt="Screenshot 2024-04-27 at 11 22 01 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/1a7d6914-25dc-4377-9ea6-5539e69c515f">
<img width="714" alt="Screenshot 2024-04-27 at 12 23 33 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/090f6086-eb91-4fe3-91a6-b10385121e21">
<img width="1121" alt="Screenshot 2024-04-27 at 12 24 40 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/28178f01-2542-4d67-ac50-937f9e8634ba">
<img width="723" alt="Screenshot 2024-04-27 at 12 36 23 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/ccf171ee-e778-4348-8eb4-e60190637614">
<img width="1183" alt="Screenshot 2024-04-27 at 12 36 46 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/4f45acfb-8794-4a7c-974f-f3bed2a70057">
<img width="1183" alt="Screenshot 2024-04-27 at 12 53 22 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/aa9d14b9-939d-4c28-b795-8962c24f2917">
<img width="717" alt="Screenshot 2024-04-27 at 12 53 52 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/015bb213-1dd6-4855-93e4-ae74792954eb">
<img width="717" alt="Screenshot 2024-04-27 at 1 02 28 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/8107fe70-c0b6-4ff3-a3e1-3f401a1ff88d">
<img width="717" alt="Screenshot 2024-04-27 at 1 03 56 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/80176c43-143d-44a4-b665-be1344f9b6be">
<img width="717" alt="Screenshot 2024-04-27 at 1 05 35 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/4e0b2f8a-44b1-4f9e-9650-e45dced52608">
<img width="717" alt="Screenshot 2024-04-27 at 1 06 24 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/fb39ce26-49d3-41e3-92e5-0adf66035c03">
<img width="717" alt="Screenshot 2024-04-27 at 1 10 36 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/9116adea-216b-4551-9d8a-d5d9493854bd">
<img width="717" alt="Screenshot 2024-04-27 at 1 11 55 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/6178a90b-c315-446e-a88f-27006ca9b168">
<img width="717" alt="Screenshot 2024-04-27 at 1 12 49 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/b2860ab1-e201-4290-80c3-4f7f415d1b80">
<img width="717" alt="Screenshot 2024-04-27 at 1 16 27 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/3fd6b4cb-44e9-4d69-b728-4775efd92075">
<img width="717" alt="Screenshot 2024-04-27 at 1 17 26 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/4cf761b2-f5ca-4eea-afab-6bfbb749f3da">
<img width="717" alt="Screenshot 2024-04-27 at 1 18 05 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/b2805b27-6b93-4f34-a0d9-1aab6b3f0c83">
<img width="717" alt="Screenshot 2024-04-27 at 1 19 19 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/fcbfb2e4-d163-400f-adac-d88f7f0c36ca">

















<h1> Day 3 - Combinational and sequential optimizations </h1>


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
