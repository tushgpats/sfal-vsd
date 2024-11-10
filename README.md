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
<img width="717" alt="Screenshot 2024-04-27 at 2 39 37 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/23bd5053-eb57-474e-bc63-15c6c52a0a65">
<img width="717" alt="Screenshot 2024-04-27 at 2 41 56 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/e3add5a4-7151-4a12-92f4-24ec3adc3835">
<img width="1059" alt="Screenshot 2024-04-27 at 2 42 44 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/a5aec497-6974-49e8-98ad-4c41cb081e54">
<img width="675" alt="Screenshot 2024-04-27 at 2 49 19 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/9dddeeaa-4001-4464-b9fc-fd4634605d88">
<img width="675" alt="Screenshot 2024-04-27 at 2 51 50 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/daebaaa2-3971-4885-aef9-ba6917d43d8c">
<img width="1437" alt="Screenshot 2024-04-27 at 2 56 01 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/b2c143c3-f72d-4986-b898-42edb3bcb737">
<img width="675" alt="Screenshot 2024-04-27 at 3 02 46 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/b693b99d-1fd9-40a6-9b8c-824f0760e889">
<img width="675" alt="Screenshot 2024-04-27 at 3 06 45 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/1f272aef-d8b5-44be-b92f-1f2c11b023eb">

<h1> Day 3 - Combinational and sequential optimizations </h1>

Combinational logic optimization is a critical aspect of digital circuit design aimed at reducing the complexity and improving the efficiency of combinational logic circuits.
<img width="925" alt="Screenshot 2024-04-30 at 6 00 22 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/3aa6f07b-f264-4057-bd21-298c77dc5b7a">
In Our Labs we are Primarily focused on Optimization usingConstant Propogation 
<img width="925" alt="Screenshot 2024-04-30 at 6 01 30 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/6177ba3b-1f08-4907-b445-ec2343c42083">

Boolean logic optimization is the process of simplifying Boolean expressions to achieve better performance, reduced complexity, and minimized resources. In this case 
<img width="925" alt="Screenshot 2024-04-30 at 6 02 45 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/7bcdd3a9-31c1-4ee6-9dd4-dba6ebbc1dde">

In Our Labs We have tried to Perform both Combinational Logic Optimizations as well as Sequential Logic Optimizations.

Using multiplexers (muxes) for combinational logic optimization involves selecting between multiple inputs based on control signals. Muxes can simplify complex logic functions, enable conditional execution, and facilitate data width conversion within a circuit.
<img width="455" alt="Screenshot 2024-04-30 at 6 12 48 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/d1adbb8b-b5aa-46b7-ba2d-8bdd6f0e2cd0">
<img width="455" alt="Screenshot 2024-04-30 at 6 18 38 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/f4b69447-e196-47ba-8280-76d261f55167">
Now For Sequential Logic Optimization,we focus on reducing the complexity and improving the performance of circuits that incorporate memory elements, such as flip-flops or latches. Techniques include minimizing the number of state variables, reducing the number of clock cycles required to complete operations, and optimizing the state transition logic.

<img width="925" alt="Screenshot 2024-04-30 at 6 04 17 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/0531b97b-d17e-4da9-8732-3c0b203c4a51">
<img width="952" alt="Screenshot 2024-04-30 at 6 11 35 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/d184a358-13d4-4c7c-add2-8fee1cfd2c07">
<img width="952" alt="Screenshot 2024-04-30 at 6 09 06 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/1c900a9a-5b92-41c9-861a-563afc708263">
<img width="954" alt="Screenshot 2024-04-30 at 6 50 53 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/6f2ed028-04ce-4e55-9e9b-453f12260cba">

Now Let us move to labs.

<img width="682" alt="Screenshot 2024-04-27 at 4 38 11 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/016f9515-fdec-47c3-8c53-e88bbf15bfe4">
<img width="1397" alt="Screenshot 2024-04-27 at 4 43 31 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/6812be97-79a6-46c4-9c65-ec821a7089d8">
<img width="678" alt="Screenshot 2024-04-27 at 4 58 50 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/0e31b5b1-a35a-4ee8-a25a-025ffac71f4d">
<img width="1434" alt="Screenshot 2024-04-27 at 5 00 17 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/f32d51c8-d66c-4cc6-857f-c75dbb78c3da">
<img width="716" alt="Screenshot 2024-04-27 at 5 02 33 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/27539824-99b8-425a-beda-e9188cc71ae1">
<img width="716" alt="Screenshot 2024-04-27 at 5 03 37 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/396073fb-b22b-4502-9a5a-f42b60103249">
<img width="1433" alt="Screenshot 2024-04-27 at 5 04 21 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/a2c3ad89-ebb9-4ad8-a20c-bc90c70756af">
<img width="1433" alt="Screenshot 2024-04-27 at 5 15 29 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/957e284b-2737-4196-8c7e-195ee6231658">
<img width="1433" alt="Screenshot 2024-04-27 at 5 40 23 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/efde9418-a681-456a-8ce8-8c5447dbfb6a">
<img width="1433" alt="Screenshot 2024-04-27 at 5 43 57 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/5791b3d2-fab9-473c-8303-6e2d91f3040a">
<img width="1433" alt="Screenshot 2024-04-27 at 5 53 09 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/9e3fab85-8d8e-48cf-a9bd-833f19241a7d">
<img width="1433" alt="Screenshot 2024-04-27 at 5 58 46 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/18593c91-98f0-40d2-ae64-b1137433514c">
<img width="1433" alt="Screenshot 2024-04-27 at 6 06 50 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/d1837ead-8e58-4fce-bd25-8c26b042dd4e">
<img width="1433" alt="Screenshot 2024-04-27 at 6 13 07 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/8cbaebe4-1071-4c65-bfb4-e0ee4b3c3722">
<img width="1433" alt="Screenshot 2024-04-27 at 6 15 16 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/79ce449d-b3ee-4918-938e-671bea1dc52f">
<img width="1433" alt="Screenshot 2024-04-27 at 6 20 15 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/d8d73d96-155e-42c3-a5ec-689f64da7fab">
<img width="1433" alt="Screenshot 2024-04-27 at 6 22 10 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/c8fd7d91-82d9-48e4-aee0-ec1e15dcf447">
<img width="1433" alt="Screenshot 2024-04-27 at 6 23 01 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/79ddcd58-81b7-4806-a575-40ef6656d1f1">
<img width="716" alt="Screenshot 2024-04-27 at 6 23 34 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/a927d4c8-451f-49fa-bbea-e8ede0302e09">
<img width="1434" alt="Screenshot 2024-04-27 at 6 24 15 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/2fdc6774-4063-4fdf-8a67-b7823d9f894c">
<img width="1434" alt="Screenshot 2024-04-27 at 6 27 13 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/c0874c35-9fba-40f4-beb8-6183e945c4e6">
<img width="718" alt="Screenshot 2024-04-27 at 6 31 05 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/ea6fc280-4b77-461a-9a29-cea224faad3d">
<img width="718" alt="Screenshot 2024-04-27 at 6 32 51 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/526af4c4-1ccf-43a5-ae81-2cfbe3c40510">
<img width="659" alt="Screenshot 2024-04-27 at 7 05 14 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/d7fff40b-37d4-4201-9c03-1ce387d3ca56">
<img width="1434" alt="Screenshot 2024-04-27 at 7 09 45 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/ff6a6836-9de7-4183-a312-1a885c27f70f">
<img width="595" alt="Screenshot 2024-04-29 at 2 02 00 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/236f3fe4-652c-4119-abd5-48dabe398d4c">
<img width="1422" alt="Screenshot 2024-04-29 at 2 04 23 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/6eccceef-177a-4c0e-b216-ded8979f18e4">


<h1> Day 4 - GLS, blocking vs non-blocking and Synthesis-Simulation mismatch</h1> 

GLS refers to running simulation on the netlist of a fiven RTL design. The idea behind this is than the netlist is logically same as that of the RTL code. 
We perform GLS to verify the logical correctness of the design.
The resons for this could be Improper sensitivity list or incorrect use of blocking statements.

<img width="1026" alt="Screenshot 2024-04-29 at 2 44 13 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/83cd7dd3-b8ea-4b5b-ac12-82abded46780">
<img width="1026" alt="Screenshot 2024-04-29 at 2 58 06 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/1f7f3660-80c1-41c0-9b18-7e3fdfdfab67">
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

<h1> Day-5 Introduction to DFT </h1>

There are various issues that one might encounter while manufacturing chips such as such as density issues, where increased miniaturization leads to a higher likelihood of design errors like wires touching or breaking. Software issues can also arise from bugs in the computer-aided design (CAD) tools used in the chip design process. Application-specific issues are critical in fields like healthcare and aerospace, where a single fault can have catastrophic consequences. Additionally, maintenance challenges become more complex with the reduction in PCB sizes and the shift towards system-on-chip (SoC) designs, making traditional testing methods less effective and repairs more costly. Lastly, business implications are significant, as the discovery of faults in chips can result in substantial financial losses and penalties for the manufacturing company. Detecting these faults early is essential to mitigate costs and ensure reliability in the production of chips.

<h2> Why Do We Do DFT? </h2>
DFT is implemented primarily to make testing feasible and efficient after a chip has been fabricated. It addresses several key needs:

Ease of Testing: DFT techniques simplify the detection and localization of manufacturing defects across various testing stages. This helps ensure that the chip meets the required quality and reliability standards before it is shipped.
<img width="1181" alt="Screenshot 2024-05-25 at 2 50 22 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/ce72583f-afb6-4ff5-b7ce-5c2565348742">

Economic Benefits: Implementing DFT reduces the cost associated with testing and repairing defective chips. Without DFT, identifying defects at the microscopic level would be more time-consuming and costly.

Market Needs: In a competitive market, reducing time-to-market is crucial. DFT helps in speeding up the testing phase, thereby allowing quicker market entry.

Levels of Testing:
DFT is essential across different levels of testing after a chip is fabricated:

Chip-Level or Die-Level Testing: This initial testing phase occurs at the foundry where the chip is manufactured. It ensures that the chip itself is free from defects before it is assembled onto boards.

Board-Level Testing: After the chips are mounted on boards, it’s necessary to test them in the context of other integrated modules. This ensures that the chip functions correctly within its intended environment.

System-Level Testing: This final stage of testing involves checking the complete systems, such as laptops or other devices, in which multiple boards are assembled. It confirms that all components work harmoniously.

Inclusion of DFT in ASIC Design Flow:
DFT is incorporated early in the ASIC design process to ensure that the design is testable and manufacturable:

<h2> When and Where is DFT Included </h2>
When is it included? - DFT is included at the very beginning of the ASIC design flow. It’s considered right from the initial stages to integrate testability seamlessly into the chip design.

Where is it included? - DFT is incorporated during the synthesis phase of the front-end design. This involves embedding test structures and methodologies into the chip's design to facilitate easier and more effective testing post-manufacture.

<h2> Pro's and Cons of DFT </h2>
<img width="1181" alt="Screenshot 2024-05-25 at 2 42 06 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/93a08559-f537-4b2a-884a-03b56e2fdc82">

<h2> Basic Terminologies </h2>
In DFT, controllability refers to the ability to set and observe each node in a circuit at both logic high and low states via scan chains. To improve controllability, additional elements like multiplexers (MUXes) might be added, allowing flexible test signal routing. However, while enhancing test coverage, this approach increases the chip's area, power consumption, and can impact timing, collectively affecting the Power, Performance, and Area (PPA) metrics.
For example, consider a situation where a specific node within a microprocessor design, let's call it Node1, is not directly accessible by standard test mechanisms due to its placement deep within a complex logic gate arrangement. To address this, a multiplexer (MUX) is added to the design to allow Node1 to be alternately connected to either the operational logic path or a scan chain. This MUX enables both '0' and '1' values to be driven to and observed from Node1 during testing, significantly improving the controllability of this node, albeit at the cost of slightly increased chip area and power consumption.
<img width="1181" alt="Screenshot 2024-05-25 at 3 12 23 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/56ffcffd-2ddb-41b5-86bb-b0499c5cb680">

Observability in DFT refers to the ability to detect and measure the state of a logic signal at specific nodes within a circuit during testing. A node is considered observable if its value can be captured and then shifted out through scan chains, allowing it to be examined via scan output patterns. For instance, to make Node1 observable in a given circuit design, a flip-flop could be added specifically for capturing the node's state during test modes. While this addition increases the area and power usage of the chip, it does not impact timing since the flip-flop is not on the critical signal path, ensuring that operational speeds are maintained.
<img width="1181" alt="Screenshot 2024-05-25 at 3 13 14 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/f4d624c9-d54f-45b0-b5ea-d90e26a6d80a">

Fault: A fault represents physical damage or a defect within a system, differing from its intended design. This physical anomaly does not necessarily lead to a system malfunction but has the potential to cause one.

Error: An error occurs when a fault influences the system, pushing it into an erroneous state. This is a direct consequence of a fault affecting the system's operational behavior.

Failure: A failure happens when the system ceases to deliver the expected service or functionality, typically observed when an error impacts critical system operations.

Fault Coverage: This is the metric used to express the percentage of all possible logical faults within a system that can be detected by a specific set of tests, denoted as test set T.

Defect Level: This measures the proportion of defective parts that are inadvertently shipped as functioning units. It reflects the number of faulty chips that were not detected during testing and were erroneously classified as good.

<h2> DFT Techniques </h2>
<img width="1188" alt="Screenshot 2024-05-25 at 3 41 29 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/cb1198e8-afda-48ca-a357-6cd627b6bda0">

The DFT compiler converts the flops to scan-enabled flops.
<img width="1188" alt="Screenshot 2024-05-25 at 3 49 04 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/ab41ec09-d7fd-45bb-a964-c2cbb106a170">
Scan Chain Techniques

Define the scan constraints
Establish scan ports and scan enable settings
Compile the Design for Test (DFT)
Determine the number of scan chains

<img width="1188" alt="Screenshot 2024-05-25 at 3 54 00 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/d6428808-282b-4eb2-a1fa-bda2b93b484c">

Scan flops are primarily used for two key purposes in testing manufactured devices:

Testing for Stuck-at Faults: Scan flops help in identifying stuck-at faults where a pin or a node in the device remains fixed at a high ('1') or low ('0') value and does not change as expected during circuit operation. This helps in ensuring that all parts of the circuit can correctly transition between states.

Testing Path Delays: They are used to verify that each path in the device operates at its functional frequency. This involves checking whether signals can travel through the circuit within the expected time limits without causing delays that could impact the device's performance.

<img width="1157" alt="Screenshot 2024-05-25 at 4 06 22 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/33642fa7-972c-4c00-89ac-c0f42d76c213">
<img width="1189" alt="Screenshot 2024-05-25 at 4 09 57 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/e5131e54-f69e-4240-a3d9-27ea254a3cd8">
 Why do we use APTG 
 <img width="1189" alt="Screenshot 2024-05-25 at 4 11 01 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/0e8ff408-5a39-466b-9483-88e0d1b7edb3">
<img width="1189" alt="Screenshot 2024-05-25 at 4 11 52 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/f7411368-8d3f-48cb-acf5-9a17c10fa959">
<img width="1189" alt="Screenshot 2024-05-25 at 4 21 17 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/9927e9f0-a6b1-494d-a062-b09dba6c11f5">

<h2> Synopsys DC </h2>
<img width="1440" alt="Screenshot 2024-04-30 at 7 37 10 PM gui start" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/7bfdf2e5-085d-4a92-b6d3-29904d8b47a6">
<img width="829" alt="Screenshot 2024-05-25 at 3 32 37 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/be930959-8f2d-42b0-a807-17020b761300">


<h1>Day-6 Introduction to Logic Synthesis</h1>

Now we link the design into the DC shell.
<img width="808" alt="Screenshot 2024-05-07 at 5 08 57 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/5baf4b1c-dca3-4035-b357-7fbab4677b28">

<img width="840" alt="Screenshot 2024-05-09 at 3 29 36 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/e01a3e27-77e7-498f-a626-0175dc8474b0">
this is the verilog file of the design 

<img width="1173" alt="Screenshot 2024-05-09 at 3 56 10 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/011efb96-e805-4441-99ed-01eb287e4d77">
The DC compliler infers a Memory device which overer here is a register.

we will now how to linkl the library files bcoz the dc compliler only understands the db format.
<img width="980" alt="Screenshot 2024-05-09 at 5 02 51 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/2901b0e4-63b0-46b1-8730-3dbd0f15c2e0">
<img width="1385" alt="Screenshot 2024-05-09 at 5 30 17 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/836b3df3-615c-482e-8aa9-37e5c5b0f8c3">

on compliling the design we get.
<img width="1173" alt="Screenshot 2024-05-09 at 3 58 36 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/718f2f16-4c9d-43fb-a57e-d42761605dc2">

We now write the ddc file so that we can view it in the DC compliler.
<img width="1173" alt="Screenshot 2024-05-09 at 4 45 56 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/86ae5f77-8b7a-492c-a672-ab64af147663">
<img width="1440" alt="Screenshot 2024-05-09 at 4 53 05 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/7fc8c39d-5ebc-4fdd-b957-6ab5bdd8dcbd">

We can now load the design and view it.
<img width="1175" alt="Screenshot 2024-05-09 at 4 56 54 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/c2c8d272-142d-457d-92e2-4cd577e0cf86">
<img width="1175" alt="Screenshot 2024-05-09 at 4 58 27 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/a9993689-5d37-45dc-af47-1cd57479cdc9">


Logic synthesis involves using TCL scripts to automate and control the synthesis process in digital design.

Let us start by some basics of tcl scripting with for loop.It is important to note that tcl is a strongly typed language.
<img width="736" alt="Screenshot 2024-05-10 at 6 34 26 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/7db3a653-8eb7-4981-9e00-0f53bf82bdc4">

now let us take a look at while loop in tcl
<img width="736" alt="Screenshot 2024-05-10 at 7 20 59 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/613f0585-be06-4cc9-b5f5-c0410f52af3a">

Now let us make a list and loop through the list.
<img width="736" alt="Screenshot 2024-05-10 at 7 42 57 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/0219ff50-9b81-4145-9ed4-bbebb1d30299">

Now we loop through all the lib cells. 

<img width="736" alt="Screenshot 2024-05-10 at 7 54 40 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/d661bd2b-a051-4c56-9bd2-01c8ee0194ca">
<img width="736" alt="Screenshot 2024-05-10 at 8 02 14 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/b8951f33-232c-48d0-8476-23266b72772f">

We now try print the multiplication table to get idea of loop nested while inside a foreach which will be useful for later labs.

<img width="1293" alt="Screenshot 2024-05-10 at 8 32 44 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/b47e4a23-f425-418b-9dfd-d18d069b789a">

<h1> Day-7 - Basics of STA </h1> 

In this Lab we will be diving deeper into Timing Dot libs. timing dot libs contain information on various aspects of cells such as functionality, input pins, output pins, area, leakage current etc.

First let us know some basic commands to get lib cells namely "get_lib_cells"

<img width="1174" alt="Screenshot 2024-05-12 at 9 10 15 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/af7aeba7-d0a1-4088-ba93-8cdec1ff1cab">

We now observe a pos-latch and a neg-latch. For pos-latch, the setup time is wrt to falling edge while for neg-latch setup-time is wrt to rising edge.
<img width="642" alt="Screenshot 2024-05-12 at 9 37 20 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/3d985e54-d900-48bd-a574-e60ac15507c2">
<img width="642" alt="Screenshot 2024-05-12 at 9 37 01 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/1c0d69f4-06bc-4cad-ab27-a521bf9dc643">

We will now loop over all the and cells present in the library 
<img width="1159" alt="Screenshot 2024-05-21 at 4 00 06 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/97d10e95-d18e-4794-9bb6-1b18ae2b1f5b">

We now try getting attribute name of the cells

<img width="1159" alt="Screenshot 2024-05-21 at 4 00 06 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/691b5733-9887-4d35-9206-799060772301">

We will now write this tcl script into a file and try to source it

<img width="1005" alt="Screenshot 2024-05-21 at 1 54 54 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/0c640b81-5d65-4711-90ec-7cbaf9621132">

<img width="1121" alt="Screenshot 2024-05-21 at 2 09 08 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/ab99f86a-446a-481a-91c3-096469dc9392">

We now try to find out various atributes of cells such as area, capacitance , clock etc.

<img width="1121" alt="Screenshot 2024-05-21 at 2 18 36 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/6c9c1d39-d8d5-4b5f-a10f-09395b8aae02">

<img width="1121" alt="Screenshot 2024-05-21 at 4 51 41 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/79741573-feac-40ad-8600-1fdb63cbf53d">

<img width="1331" alt="Screenshot 2024-05-21 at 4 53 33 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/1a6f548f-c303-418b-83ad-6cef0230d0ab">

<h1> Day-8 - Advanced SDC Constraints </h1>

Now we will take a look at how to load design, get cells, ports and nets. 
<img width="684" alt="Screenshot 2024-05-21 at 1 38 07 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/712048c9-ed3b-48d9-a217-a4e5d6cee80b">
<img width="1005" alt="Screenshot 2024-05-21 at 1 54 54 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/f2fe7a24-cd8d-4f0b-8db1-3e240273e621">
<img width="1121" alt="Screenshot 2024-05-21 at 2 09 08 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/4796e635-580f-4c53-87dc-1ac06b7d0c8d">
<img width="1168" alt="Screenshot 2024-05-21 at 3 19 52 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/a225b697-9d58-436d-9f81-03e4188742be">
<img width="1159" alt="Screenshot 2024-05-21 at 3 45 24 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/acbf1d59-30a7-4bf9-ba59-efd592f0a1e4">

getting pins
<img width="1159" alt="Screenshot 2024-05-21 at 4 10 02 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/1d3e85c4-9510-464c-8493-e9fa7fafdea0">
<img width="1159" alt="Screenshot 2024-05-21 at 4 35 55 AM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/97a2c730-fc1b-4de7-96d0-931d6c4a84d9">

getting various attributes of pins 
<img width="1121" alt="Screenshot 2024-05-21 at 4 51 41 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/40f86452-f06a-45a6-8379-88c8649fafc2">
<img width="1331" alt="Screenshot 2024-05-21 at 4 53 33 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/958d9da8-cd5e-48e2-b6a9-91f3ec5dcae1">

linking the design in DC shell
<img width="1120" alt="Screenshot 2024-05-21 at 5 33 08 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/79053fb2-080a-466e-8eb9-18956be9fd4d">
<img width="1120" alt="Screenshot 2024-05-21 at 5 35 43 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/68ff123e-bebe-4714-8919-68a7ea1b85f7">
<img width="1120" alt="Screenshot 2024-05-21 at 5 40 37 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/784d5c4e-d7a9-4645-b188-32eee8421345">

getting ports
<img width="1120" alt="Screenshot 2024-05-21 at 6 06 28 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/921bd1c4-9c67-432e-bcee-27e6b5d4b24a">
<img width="1371" alt="Screenshot 2024-05-23 at 4 56 27 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/6f5805ff-e0ed-46cf-9d7a-996a2b940d1d">

Getting pins and their attributes
<img width="903" alt="Screenshot 2024-05-23 at 4 57 20 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/5d2b3aab-35be-4de5-8970-72db7f810722">
<img width="1317" alt="Screenshot 2024-05-23 at 5 10 45 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/d80b81bf-ad35-4546-887d-e548c6e8f7ca">
<img width="1321" alt="Screenshot 2024-05-23 at 5 38 53 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/0358ff48-c557-4db3-8ba0-153c93f0302c">
<img width="1106" alt="Screenshot 2024-05-23 at 5 50 27 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/80c894bd-6520-40c6-891a-0c3d3b80e967">
<img width="1106" alt="Screenshot 2024-05-23 at 6 07 01 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/1baf10c3-446d-4c7b-82ee-cff649ac64a5">
<img width="1106" alt="Screenshot 2024-05-23 at 6 21 42 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/3ef0558d-5609-497d-91ad-a167b68197e4">
Screenshot 2024-05-23 at 6.39.38 PM

We now take a look at how to create clocks
<img width="755" alt="Screenshot 2024-05-23 at 10 57 50 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/f5da5b9d-a872-4776-af5d-75e1ac432335">
<img width="915" alt="Screenshot 2024-05-23 at 11 33 01 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/3249943f-318a-412b-b048-3b4d1facf959">
<img width="915" alt="Screenshot 2024-05-23 at 11 43 01 PM" src="https://github.com/tushgpats/sfal-vsd/assets/47535296/045f961d-7f29-4262-93e8-f85681918cf5">

We will now dive deep into Clock network modellling and IO Delays.



<h1> Day 13 Post-Synthesis Simulation (GLS) of BabySoC </h1>
<h2> Presynthesis Simulation </h2>
Pre-synthesis simulation ensures that the designed logic performs the intended functionality. It allows designers to check if the design meets the initial specifications and behavioral expectations before any optimization or modification by synthesis tools.It helps in identifying and correcting logic errors, coding mistakes, and functional mismatches early in the design cycle, reducing the risk of propagating these errors to later stages.

<h2>Why Not Just Do Post-Synthesis Simulation?</h2>
Post-synthesis simulations are significantly slower because they include detailed gate-level modeling and timing information.Debugging at the gate level is more complex and time-consuming compared to the RTL level. Thus, Identifying the root cause of functional mismatches or timing violations can be more challenging.Post-synthesis simulation focuses on verifying both functionality and timing, which can be too late to catch some high-level functional bugs that could have been detected earlier in the design cycle.

<h2> Gate Level Simulation </h2>
Gate-Level Simulation (GLS) refers to the simulation of a digital circuit at the gate level, using a netlist view that is typically generated after logic synthesis. This netlist is a detailed representation of the circuit, comprising gates and IP models with full functional and timing behavior.Gate-Level Simulation is a critical step in the digital design verification process. By providing a detailed and realistic view of the circuit post-synthesis, GLS helps verify both the functional and timing behavior of the design. It complements RTL simulation and static timing analysis, capturing dynamic behaviors and ensuring the synthesized netlist faithfully implements the intended design. 

<h2> Synthesizing BabySoC </h2>
First we need to convert .lib files for PLL and DAC to .db files using lc_shell
```
$cd /home/subhasis/VSDBabySoC/src/lib
$read_lib sky130_fd_sc_hd__tt_025C_1v80.lib
$write_lib -format db sky130_fd_sc_hd__tt_025C_1v80 -output sky130_fd_sc_hd__tt_025C_1v80.db
```
![WhatsApp Image 2024-06-04 at 5 53 41 PM](https://github.com/user-attachments/assets/7ed2b16f-3e8a-40d7-b187-59848e7cdc22)
the following commands are used to synthesize BabySoC.
<img width="1413" alt="Screenshot 2024-06-05 at 3 45 37 PM" src="https://github.com/user-attachments/assets/1f7e88f6-ee4d-4650-90f5-96fe08a8bf71">
<img width="1413" alt="Screenshot 2024-06-05 at 11 32 24 PM" src="https://github.com/user-attachments/assets/9897598d-2846-4c9c-bd77-97bebc630ccd">

We now perform Post synthesis simulation
```
$iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 -o ./output/post_synth_sim.out ./src/gls_model/primitives.v ./src/gls_model/sky130_fd_sc_hd.v ./output/vsdbabysoc_net.v $./src/module/avsdpll.v 
$  ./src/module/avsddac.v ./src/module/testbench.v
$
$  cd output
$  ./post_synth_sim.out
$  gtkwave dump.vcd
```
<img width="1372" alt="Screenshot 2024-06-22 at 3 45 16 PM" src="https://github.com/user-attachments/assets/fba0d004-2174-4b5f-b2d8-d801f96c1ce3">

<h1> Day 14 PVT Corners: Synthesis and Timing Analysis </h1>

The Term PVT Stands for Process Voltage and Tempreture. PVT (Process, Voltage, and Temperature) variations significantly impact the delay and overall performance of semiconductor devices. In order to ensure that out chip to works after fabrication in all the possible conditions, we run simulations at different corners of process, voltage, and temperature. 

Process Variations: Process variations arise from the inherent imperfections and variations in the semiconductor fabrication process. These variations can lead to differences in the physical dimensions and electrical characteristics of transistors, such as threshold voltage, channel length, and oxide thickness. The impact on delay can be summarized as follows:
Fast-Fast (FF) Corner: Transistors are faster due to lower threshold voltages and shorter channel lengths, leading to reduced delay.
Slow-Slow (SS) Corner: Transistors are slower due to higher threshold voltages and longer channel lengths, resulting in increased delay.
Typical-Typical (TT) Corner: Represents nominal process conditions and serves as a reference point.

Voltage Variations
Voltage variations refer to changes in the supply voltage, which can occur due to power supply fluctuations, voltage drops, or intentional design choices. The impact on delay is as follows:
High Voltage (Vmax): Higher supply voltage increases the drive strength of transistors, reducing delay but potentially increasing power consumption.
Low Voltage (Vmin): Lower supply voltage decreases the drive strength of transistors, increasing delay but potentially reducing power consumption.

Temperature Variations
Temperature variations can occur due to changes in the operating environment or self-heating effects within the chip. The impact on delay is as follows:
High Temperature (Thigh): Higher temperatures increase carrier scattering, reducing mobility and increasing delay.
Low Temperature (Tlow): Lower temperatures reduce carrier scattering, increasing mobility and reducing delay.

Simulating a chip design at different PVT corners is critical for several reasons:
1. It Ensures that the chip will operate correctly under a wide range of conditions.
2. It Verifies that the chip meets timing requirements across all PVT variations.
3. It Helps in analyzing the trade-offs between power consumption and performance under different conditions.

<h2> Lab </h2>
We will now synthesize BabySoC design utilizing different PVT Corner library files (.lib/.db). We will then tabulate Worst Negative/Setup Slack (WNS) & Worst Hold Slack (WHS) values 
First We Do this for a single Corner.
First we download the Skywater 130nm PDK timing libraries for different PVTs  to the path /home/ganesh/VSDBabySoC/src/timing_libs

Now to convert all the .lib  file formats to .db format execute the following steps :
cd /home/ganesh/VSDBabySoC/src/timing_libs
lc_shell # Invoke lc_shell tool
We use the following script to convert all .lib to .db file format within timing_libs directory. 

```
$ set libs [glob *.lib]
$  set m1 ""
$  set library_name ""
$  foreach lib_name $libs {
$   
$  regexp {(.*)\.lib} $lib_name m1 library_name
$  
$  read_lib $lib_name
$  write_lib $library_name -format db -output ${library_name}.db
$  }

```
We now Synthesize the BabySoC Design for different PVT Corners 
We create a sta_mul_pvt.tcl file and put the following script to synthesize the BabySoC design with different PVT Corners and also report the corresponding Worst Negative/Setup Slack (WNS) & Worst Hold  Slack (WHS) into a .rpt file.
```
$   set m1 ""
$   set pvt ""
$   set FH [open report_timing.rpt w]
$   puts $FH "PVT_Corner\tWNS\tWHS"
$   
$   set lib_files [glob -directory /home/subhasis/VSDBabySoC/src/timing_libs/ -type f *.db]
$   
$   foreach lib_file_paths $lib_files   
$   regexp {.*\/sky130_fd_sc_hd__(.*)\.db$} $lib_file_paths m1 pvt
$   
$   set timing_report_fast_mode true
$   
$   
$   set target_library $lib_file_paths
$   set link_library {* /home/subhasis/VSDBabySoC/src/lib/avsdpll.db /home/subhasis/VSDBabySoC/src/lib/avsddac.db}
$   lappend link_library $target_library
$   set search_path {/home/subhasis/VSDBabySoC/src/include /home/subhasis/VSDBabySoC/src/module}
$   read_file {sandpiper_gen.vh  sandpiper.vh  sp_default.vh  sp_verilog.vh clk_gate.v rvmyth.v rvmyth_gen.v vsdbabysoc.v} -autoread -top vsdbabysoc
$   source /home/subhasis/VSDBabySoC/src/sdc/vsdbabysoc_synthesis.sdc
$   link
$   compile_ultra
$   
$   set wns [get_attribute [get_timing_paths -delay_type max -max_paths 1] slack]
$   set whs [get_attribute [get_timing_paths -delay_type min -max_paths 1] slack]
$   
$   puts $FH "$pvt\t$wns\t$whs"
$   
$   reset_design
$   }
$   
$   close $FH
```
<h2> PVT Corners in Tablular Form </h2>
<img width="763" alt="Screenshot 2024-07-12 at 4 26 19 PM" src="https://github.com/user-attachments/assets/3e9ba184-b95c-4575-b2cb-e2acf40cf420">
![Worst Hold Slack (WHS) across PVT Corners](https://github.com/user-attachments/assets/9a815207-4d30-4323-955e-5beefda71a6e)
![Worst Negative Slack (WNS) across PVT Corners](https://github.com/user-attachments/assets/191549e3-74dc-49c8-af7d-5210f7c78f03)
<details>
<summary> <h1> Pre-requisites for Floorplanning, P&R : PD Basic concepts </h1> </summary> 

<h2> SOC </h2>
A System on Chip (SoC) integrates various components and functionalities of a complete system, including processors, memory, peripherals, and interconnects, onto a single chip. This integration enables the development of compact, efficient, and high-performance systems.

<h2> SOC Design Flow </h2>
<img width="791" alt="Screenshot 2024-07-27 at 5 39 23 PM" src="https://github.com/user-attachments/assets/a8b89428-b3d1-401b-b587-f12365897644">
Creating the specifications is the first step in the process, which then progresses to the RTL design stage, which integrates numerous IP cores (soft IP). After that, the design advances to the SoC Integrator step, where a gate-level netlist is produced using synthesis and Design for Test (DFT). In this phase, firm IP cores are merged. Hard IP cores are implemented throughout the layout and Static Timing Analysis (STA) phases of the design. The design is then prepared for manufacture by being transferred into GDSII format.
https://vlsiuniverse.com/soc-design-life-cycle-vlsi-chip-2021/#google_vignette 

<h2> Openlane </h2>

![image](https://github.com/user-attachments/assets/4d050a9a-58e2-48d3-934b-a065bf6cb189)
OpenLane is a powerful and versatile infrastructure library that enables the construction of digital ASIC physical implementation flows based on open-source and commercial EDA tools. It includes a reference flow (Classic) that is constructed entirely using open-source EDA tools –abstracting their behavior and allowing the user to configure them using a single file (See Figure 1). OpenLane also supports extending or modifying flows using Python scripts and utilities. Here are some of the key benefits of using OpenLane:

Flexibility and extensibility: OpenLane is designed to be flexible and extensible, allowing designers to customize the flow to meet their specific needs by developing Python scripts (plugins) and utilities or by modifying the existing configuration file.
Open source: OpenLane is an open-source project that is freely available to use and modify, which makes it a good choice for designers looking for a transparent, cost-effective solution.
Community support: OpenLane capitalizes on OpenLane’s existing community of users and contributors, which means that a wealth of resources is available to help designers get started and troubleshoot any problems they encounter.
https://openlane2.readthedocs.io/en/latest/getting_started/newcomers/index.html#newcomers

<h2> Run Synthesis on picorv32a design using openlane flow, generate output and analyse results by determining flop ratio </h2>

 Change directory to /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane
 set alias docker='docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u
 Invoke Openlane using 'docker' command
 Run Openlane flow in interactive mode using following command: ./flow.tcl -interactive
<img width="583" alt="Screenshot 2024-07-19 194312" src="https://github.com/user-attachments/assets/6bf20e7d-1d72-46b0-9a62-e79a2b9f7d53">

<img width="762" alt="Screenshot 2024-07-19 210635" src="https://github.com/user-attachments/assets/37aa3685-230f-4b82-bb8c-09f1755e42da">
Input required package for openlane flow, prep the design and then run synthesis
package require openlane 0.9 #inputs required package for openlane flow
prep -design picorv32a #prepares the picorv32a design for openlane flow
run_synthesis #run synthesis for the prepared design
<img width="763" alt="Screenshot 2024-07-19 214230" src="https://github.com/user-attachments/assets/cfed245c-a799-40ce-a6ea-e24aa2371a05">

<img width="767" alt="Screenshot 2024-07-19 220251" src="https://github.com/user-attachments/assets/e3736336-2a62-4e5e-9a52-0aefb7fa3b37">
We now Chartacterize the synthesis results
<img width="770" alt="Screenshot 2024-07-19 225454" src="https://github.com/user-attachments/assets/d0252552-37ab-4fa4-bad9-231421de1567">
Flop Ratio = (Total no.of DFF’s)/(Total no.of Standard Cells)=1613/14876=0.10843

<h2> Running Floorplan P&R for the synthesized design </h2>

After synthesis of 'picorv32a' design is completed we edit "/home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/sky130A_sky130_fd_sc_hd_config.tcl" and add your desired floorplan options regarding values of core utilization,aspect ratio,IO metal layer used,core to die offset margin etc.,which would override the default values present in "/home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/configuration/floorplan.tcl". The description of different variables used in the flow at different stages is present "/home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/configuration/README.md" file
README.md file describing variables used in flow:
<img width="764" alt="Screenshot 2024-07-20 151354_day2" src="https://github.com/user-attachments/assets/f539082a-3fea-49db-8231-5d34cedb5e9e">

floorplan.tcl file
<img width="762" alt="Screenshot 2024-07-20 155106_day2" src="https://github.com/user-attachments/assets/20a656ee-54cc-4ab3-b0c7-253dfa9a3816">
floorplan values for current design
<img width="762" alt="Screenshot 2024-07-20 155555_day2" src="https://github.com/user-attachments/assets/ca8cb0b0-55e4-495a-b6e2-50d347a00858">
run_floorplan # runs floorplan for current synthesized design,with floorplan values set in config.tcl file for the current design
<img width="765" alt="Screenshot 2024-07-20 155908_day2" src="https://github.com/user-attachments/assets/91b107cf-1ea6-46cd-9216-b8ca6d2cebab">
Calculating Die Area
<img width="764" alt="Screenshot 2024-07-22 140736_day2" src="https://github.com/user-attachments/assets/3050f9b3-37d6-48cd-ab8a-cfa38d4444b2">
Die Area in µm^2 = (507.125 * 517.935) µm^2 = 262657.786 µm^2 according to the given def file

Loading generated floorplan.def in magic tool and exploring it
<img width="662" alt="Screenshot 2024-07-22 235923_day2" src="https://github.com/user-attachments/assets/14151852-edee-44ba-87ff-a6083b87941c">
Equidistant placement of ports
<img width="704" alt="Screenshot 2024-07-23 000436_day2" src="https://github.com/user-attachments/assets/0cbc32df-6482-4a30-ba76-e663da2c80f7">
Port layers
<img width="712" alt="Screenshot 2024-07-23 001305_day2" src="https://github.com/user-attachments/assets/be983ae5-13f4-4de5-8b2b-168a7a5e6c94">
Decap cell locations at end of rows
<img width="706" alt="Screenshot 2024-07-23 002523_day2" src="https://github.com/user-attachments/assets/f65f5114-3c8d-4699-adff-8fb3c7eea889">
diagonally equidistant Tap cells
<img width="739" alt="Screenshot 2024-07-23 002623_day2" src="https://github.com/user-attachments/assets/53f16db3-d57a-4bc0-b6f8-6350a09797ab">

<img width="710" alt="Screenshot 2024-07-23 002706_day2" src="https://github.com/user-attachments/assets/0876792c-a075-4c59-88e2-d98978d2cca9">
Unplaced standard cells present at origin
<img width="704" alt="Screenshot 2024-07-23 005246_day2" src="https://github.com/user-attachments/assets/cd180e88-360d-4f05-a21a-41cdb3656c75">
Running Congestion aware Placement
<img width="764" alt="Screenshot 2024-07-23 011626_day2" src="https://github.com/user-attachments/assets/b60c3b34-f726-4da3-9a3f-714b2b8fcd8b">
Loading generated placement.def in magic tool
<img width="708" alt="Screenshot 2024-07-23 012157_day2" src="https://github.com/user-attachments/assets/be965058-3308-4647-a9aa-59371566677e">
Legally Placed Standard Cells
<img width="704" alt="Screenshot 2024-07-23 013255_day2" src="https://github.com/user-attachments/assets/19553d9e-cb99-4035-b51b-f714de9a81ae">

<h2> Design of Library Cell using Magic Layout and performing spice characterization </h2>

<img width="675" alt="Screenshot 2024-07-26 232057_day3" src="https://github.com/user-attachments/assets/3190c1da-489b-4b9f-bed9-d7fcd333cb48">

<img width="677" alt="Screenshot 2024-07-26 233834_day3" src="https://github.com/user-attachments/assets/52af8b12-d99a-4c05-9219-5b40578de20e">

<img width="694" alt="Screenshot 2024-07-27 123135_day3" src="https://github.com/user-attachments/assets/32d23574-3cfc-4b6f-83dc-040017bd7577">

<img width="716" alt="Screenshot 2024-07-27 123241_day3" src="https://github.com/user-attachments/assets/5120b40e-396b-43ea-9a0b-fbb71b8fac18">

<img width="673" alt="Screenshot 2024-07-27 132851_day3" src="https://github.com/user-attachments/assets/5638b558-52ca-4c59-9160-1bc1d5b2e1d7">

<img width="697" alt="Screenshot 2024-07-27 131306_day3" src="https://github.com/user-attachments/assets/a6ca3d7c-bd87-49cd-8d95-afac22a08489">

<img width="680" alt="Screenshot 2024-07-27 144314_day3" src="https://github.com/user-attachments/assets/0f2a480f-cac1-4f16-85f1-1152e5291abd">

<h2> Day 4 : Pre-layout timing analysis and importance of good clock tree </h2>

In order to ensure that a custom inverter cell is ready for insertion into the OpenLane flow, we verify the following conditions: The input and output ports of the standard cell must be aligned with the intersections of the vertical and horizontal tracks. Additionally, the width of the cell should be an odd multiple of the horizontal track pitch, while the height should be an even multiple of the vertical track pitch. Checking these alignments and measurements ensures that the cell meets the required design specifications for integration.

<img width="500" alt="Screenshot 2024-08-14 122844_day4" src="https://github.com/user-attachments/assets/588727d2-c8b6-4205-829a-5f6f49136353">

```
$ cd /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/vsdstdcelldesign

$ magic -T sky130A.tech sky130_inv.mag & 

$ help grid 

$ grid 0.46um 0.34um 0.23um 0.17um 
```
<img width="851" alt="Screenshot 2024-08-14 125609_day4" src="https://github.com/user-attachments/assets/5e08b95c-ddd0-4967-bd50-537d268be38d">

<img width="673" alt="Screenshot 2024-08-14 170629_day4" src="https://github.com/user-attachments/assets/e6573b9b-a350-4fc7-bd7d-79b0e9b2a575">

<img width="672" alt="Screenshot 2024-08-14 171312_day4" src="https://github.com/user-attachments/assets/31fb5fb4-cf3b-4bf9-8bb7-85493256310b">

<img width="808" alt="Screenshot 2024-08-14 171838_day4" src="https://github.com/user-attachments/assets/6228e4c5-51e2-495d-bbda-e1266687e3ce">

We now save custom inverter layout with a name and generate its corresponding lef

```
$ save sky130_vsdinv.mag

$ magic -T sky130A.tech sky130_tusharinv.mag &

$ lef write 
```
<img width="677" alt="Screenshot 2024-08-16 112101_day4" src="https://github.com/user-attachments/assets/c83fe446-dfef-4661-ab3d-1979419a832e">

<img width="689" alt="Screenshot 2024-08-16 112918_day4" src="https://github.com/user-attachments/assets/727ba809-bde3-4a89-af5a-090968fcf0b8">

Newly generated lef.

<img width="490" alt="Screenshot 2024-08-16 120925_day4" src="https://github.com/user-attachments/assets/a61dd7cd-7b2b-4f2b-9b2c-342c92a96a26">

We now copy the newly generated lef and associated required lib files to 'picorv32a' design 'src' directory

```
$ cp sky130_tusharinv.lef ~/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/src/

$ cp libs/sky130_fd_sc_hd__* ~/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/src/ 
```
We now Edit 'config.tcl' to change lib file and add the new extra lef into the openlane flow:

<img width="497" alt="Screenshot 2024-08-16 133637_day4" src="https://github.com/user-attachments/assets/87d145a7-b74d-4ac7-8eb0-e2f01620c514">

We now Perform openlane flow synthesis with newly inserted custom inverter cell:

```
$ cd ~/Desktop/work/tools/openlane_working_dir/openlane

$ docker

$ ./flow.tcl -interactive 

$ package require openlane 0.9 

$ prep -design picorv32a 

$ run_synthesis 
```
<img width="489" alt="Screenshot 2024-08-28 045953_Day4synthesisrerunflowtillpostcts" src="https://github.com/user-attachments/assets/46844128-4c82-4d93-9aae-4fe5839d4e81">

<img width="592" alt="Screenshot 2024-08-20 061426_day4" src="https://github.com/user-attachments/assets/dbd68b41-6a2e-4a04-a54f-9292640d1547">

```
$ prep -design picorv32a -tag 09-04_13-19 -overwrite 

$ set lefs [glob $::env(DESIGN_DIR)/src/*.lef] 

$ add_lefs -src $lefs # Addiitional commands to include newly added lef to openlane flow merged.lef

$ echo $::env(SYNTH_STRATEGY) # Command to display current value of variable SYNTH_STRATEGY

$ set ::env(SYNTH_STRATEGY) "DELAY 3" # Command to set new value for SYNTH_STRATEGY

$ echo $::env(SYNTH_BUFFERING) # Command to display current value of variable SYNTH_BUFFERING to check whether it's enabled

$ echo $::env(SYNTH_SIZING) # Command to display current value of variable SYNTH_SIZING

$ set ::env(SYNTH_SIZING) 1 # Command to set new value for SYNTH_SIZING

$ echo $::env(SYNTH_DRIVING_CELL) # Command to display current value of variable SYNTH_DRIVING_CELL to check whether it's the proper cell or not

$ run_synthesis # Now that the design is prepped and ready, we can run synthesis again
```
<img width="592" alt="Screenshot 2024-08-17 133549_day4" src="https://github.com/user-attachments/assets/16cfae1d-dc50-4eed-b52a-bdb9aa4c4092">

<img width="592" alt="Screenshot 2024-08-17 135116_day4" src="https://github.com/user-attachments/assets/1ef30071-a0a5-4fba-90cb-d4a192240a58">

<img width="593" alt="Screenshot 2024-08-17 135411_day4" src="https://github.com/user-attachments/assets/4f8f4c35-dd4f-4006-bf58-b802fb068bf3">

<img width="530" alt="Screenshot 2024-08-20 061150_day4" src="https://github.com/user-attachments/assets/d3e043ef-b482-40b6-8924-0851fd5bb1e1">

<img width="592" alt="Screenshot 2024-08-17 140300_day4" src="https://github.com/user-attachments/assets/e56a53d2-3e16-46c9-b899-8e51cf4da8b0">

We now Run Floorplan and Placement and verify whether custom cell is accepted in PnR flow.

<img width="593" alt="Screenshot 2024-08-20 061922_day4" src="https://github.com/user-attachments/assets/f24d4328-9672-4c81-a3d8-5e8087fb5523">

As run_floorplan command fails, We runfloorplan in three descrete steps.

<img width="592" alt="Screenshot 2024-08-17 140837_day4" src="https://github.com/user-attachments/assets/69d87973-24c7-4e7b-844a-6ea8a06aad5c">

<img width="591" alt="Screenshot 2024-08-17 140940_day4" src="https://github.com/user-attachments/assets/65e48b67-ecd1-4308-9010-7b5d6f537723">

<img width="590" alt="Screenshot 2024-08-17 141117_day4" src="https://github.com/user-attachments/assets/b24d9aa6-110b-4492-9b90-3cad2557b5e6">

We now run placement. The command for the same is :
```
$ run_placement
```

<img width="593" alt="Screenshot 2024-08-17 141343_day4" src="https://github.com/user-attachments/assets/490551c4-3246-423a-8f9d-11040f4fd32b">

We now Load placement def in magic tool:

```
$ cd /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/09-04_13-19/results/placement/ 

$ magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.placement.def & 
```
<img width="667" alt="Screenshot 2024-08-17 142005_day4" src="https://github.com/user-attachments/assets/3b90e2f7-e570-4b5c-a814-5c513e885dc8">

Screensjot of Custom Layout sky130_tusharinv highlighted in the newly placed design

<img width="890" alt="Screenshot 2024-08-22 114943_day4" src="https://github.com/user-attachments/assets/66748d02-c65d-4a2a-951f-c39af5c2ac78">

Abutment of power pins of custom inverter with other library cells:

<img width="895" alt="Screenshot 2024-08-22 115902_day4" src="https://github.com/user-attachments/assets/d7c63a90-8574-451b-bad6-60e811829421">

We now Perform Post synthesis Static Timing Analysis with OpenSTA tool and Rerun synthesis without adding any parameters to improve timing.

```
$ cd ~/Desktop/work/tools/openlane_working_dir/openlane 

$ docker

$ ./flow.tcl -interactive 

$ package require openlane 0.9 

$ prep -design picorv32a #prepares the picorv32a design for openlane flow

$ set lefs [glob $::env(DESIGN_DIR)/src/*.lef] 

$ add_lefs -src $lefs # Addiitional commands to include newly added lef to openlane flow merged.lef

$ set ::env(SYNTH_SIZING) 1 # Command to set new value for SYNTH_SIZING

$ run_synthesis #run synthesis for the prepared design
```
We now run syntheis sucessfully
<img width="492" alt="Screenshot 2024-08-22 121058_day4_Postplacement" src="https://github.com/user-attachments/assets/75a2d145-31b6-48e5-bc5d-47f5d09078f8">

We now create my_base.sdc in "/home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/src/my_base.sdc"
<img width="449" alt="Screenshot 2024-08-23 041444_day4_stasdc" src="https://github.com/user-attachments/assets/2bb5b0d0-b559-4304-bfd5-a92a3d5b53c5">

<img width="443" alt="Screenshot 2024-08-22 124441_day4_staconf" src="https://github.com/user-attachments/assets/1a70bd5e-20ff-4e19-9850-29d1fc85d006">

We now run STA in another terminal using the command

```
$ sta pre_sta.conf
```
<img width="497" alt="Screenshot 2024-08-23 042722_day4pre_sta1" src="https://github.com/user-attachments/assets/e9a6a36f-63aa-48a9-9f44-f485440f2c26">

<img width="497" alt="Screenshot 2024-08-23 042839_day4_presta_2" src="https://github.com/user-attachments/assets/62dfd56f-c471-43a9-9b49-9d99479dd570">

<img width="497" alt="Screenshot 2024-08-24 151356_day4_preconf1" src="https://github.com/user-attachments/assets/d9fc20fc-288d-4d68-a937-5a274bfcde93">

<img width="497" alt="Screenshot 2024-08-24 151432_Day4_preconf2" src="https://github.com/user-attachments/assets/a178eb20-2689-45ce-baf9-3f222c6e56ac">

<img width="496" alt="Screenshot 2024-08-24 151557_Day4_preconf" src="https://github.com/user-attachments/assets/7ffb15db-bf46-49af-90bb-6f1f22dec313">

We Carry out EECO fixes to reduce timing violations:

<img width="497" alt="Screenshot 2024-08-24 170508_day4_preconfstabeforeEECOfixes4" src="https://github.com/user-attachments/assets/45d48a60-c60d-4c09-90ca-4b43f2d12a39">

Run synthesis with constraint on max fanout
<img width="491" alt="Screenshot 2024-08-26 171418_day4" src="https://github.com/user-attachments/assets/e274405b-a4f1-47a1-abf1-aa24427b8b7c">

<img width="491" alt="Screenshot 2024-08-27 125611_day4_orgatedrivstr2fanout4" src="https://github.com/user-attachments/assets/2121548b-e4fe-4128-a56a-ba867591b096">

<img width="493" alt="Screenshot 2024-08-27 130012_day4_orgate1reportnet" src="https://github.com/user-attachments/assets/7bc6decc-f378-45b2-ac44-759a2582a574">

<img width="494" alt="Screenshot 2024-08-27 130847_day4_orgatefo4commands" src="https://github.com/user-attachments/assets/6886556c-6a27-4cad-94a0-afa5221b4347">

<img width="491" alt="Screenshot 2024-08-27 130954_day4_orgatefo4slackreduced1" src="https://github.com/user-attachments/assets/09ba71ae-d1f8-45d2-8c23-c803332b48b9">

<img width="490" alt="Screenshot 2024-08-27 131320_day4_orgatefo4slavkreduced2" src="https://github.com/user-attachments/assets/1a3d39b9-92d7-4bca-ae3d-c59a9a0077ea">

<img width="490" alt="Screenshot 2024-08-27 131541_day4orgatef4ss" src="https://github.com/user-attachments/assets/b30dda6f-a767-4091-917e-1388505629c3">

<img width="491" alt="Screenshot 2024-08-27 132119_day4_orgatefo4_2_commands" src="https://github.com/user-attachments/assets/1b1604d9-cda4-4a7b-83fa-ad16a6141bdc">

<img width="488" alt="Screenshot 2024-08-27 132427_day4orgateslackreduced2nditer" src="https://github.com/user-attachments/assets/b2e6b081-303a-4e22-98af-7b76ffd9a6c4">

<img width="492" alt="Screenshot 2024-08-27 132610_Day4_orgatedrivestr2largedelay" src="https://github.com/user-attachments/assets/2250bd3c-070a-4195-9ef8-a0593c0e791c">

<img width="492" alt="Screenshot 2024-08-27 133231_day4_orgatedrivestr2largedelaycommands" src="https://github.com/user-attachments/assets/ea4014a9-e2fc-489e-9393-13c4f486ca2e">

<img width="493" alt="Screenshot 2024-08-27 133423_Day4_orgatedrivestr2largedelayslackredjuced" src="https://github.com/user-attachments/assets/170cbc22-c045-49cb-9433-fe5810dca708">

<img width="491" alt="Screenshot 2024-08-27 135508_Day4drivingstr2dealyhighslackreduced" src="https://github.com/user-attachments/assets/3d16c169-43c5-4358-b8d4-78e701fd7f9c">

<img width="493" alt="Screenshot 2024-08-27 140103_day4_orgateoagatemoredelay" src="https://github.com/user-attachments/assets/d099c784-6310-4da1-bf17-e3df54299cd4">

<img width="491" alt="Screenshot 2024-08-27 140830_Day4_orgatedrivingoahighdelaycommands" src="https://github.com/user-attachments/assets/94a1a485-f475-46a6-9062-9a9739538786">

<img width="493" alt="Screenshot 2024-08-27 141012_Day4orgatedrivingoaslackreduced" src="https://github.com/user-attachments/assets/b0a95ff5-e117-41f7-a9ba-5805698dc652">

<img width="494" alt="Screenshot 2024-08-27 141232_day4Customtimimgreport" src="https://github.com/user-attachments/assets/1a15e4e6-f354-4a77-93a1-ea1a2b783878">

<img width="494" alt="Screenshot 2024-08-27 141315_Day4customreportslackreduced2" src="https://github.com/user-attachments/assets/e0a3ca1b-727e-4ec0-8dfb-672a5e1cf9de">

We now Replace the old netlist with the new netlist generated after timing ECO fix , and implementing the floorplan, placement and cts:
we first make copy of old netlist:

<img width="492" alt="Screenshot 2024-08-27 171846_day4" src="https://github.com/user-attachments/assets/1e93ea39-30a6-44c3-8de5-7ae726a12e36">

<img width="492" alt="Screenshot 2024-08-27 171846_day4" src="https://github.com/user-attachments/assets/3a376743-ff5b-4de2-9648-cc6a5e29b3ee">

We Verify if the instance 14506 is replaced with sky130_fd_sc_hd__or4_4 
<img width="440" alt="Screenshot 2024-08-27 173005_Day4_verifyoverwrittennetlist" src="https://github.com/user-attachments/assets/1b03f216-36c7-458f-ad90-2298cdf2ee89">

We now Rerun synthesis,floorplan,and placement and CTS in the netlist with no timing violations
<img width="493" alt="Screenshot 2024-08-27 180718_Day4_prectssynthesis" src="https://github.com/user-attachments/assets/ab1655f8-f93f-4edd-ab94-7262c2ede059">

<img width="492" alt="Screenshot 2024-08-27 180817_day4_prectsfloorplan1" src="https://github.com/user-attachments/assets/2a287774-732b-4da7-b565-48d672167d2c">

<img width="492" alt="Screenshot 2024-08-27 180925_Day4_prectsfloorplan2" src="https://github.com/user-attachments/assets/99985f5a-e1cf-45c0-81d4-9d43fb7527f6">

<img width="491" alt="Screenshot 2024-08-27 181344_Day4prectsfloorplan3" src="https://github.com/user-attachments/assets/d482bca8-029c-4b30-a855-47393f0d2c03">

<img width="503" alt="Screenshot 2024-08-27 181546_Day4prectsfloorplan4" src="https://github.com/user-attachments/assets/cee364de-0404-4c9e-90d5-a0a1edc9adbe">

<img width="500" alt="Screenshot 2024-08-27 181800_Day4_runcts1" src="https://github.com/user-attachments/assets/cd58f0e5-57b6-4229-a9b6-09b77cf960be">

<img width="502" alt="Screenshot 2024-08-27 185309_Day4_cts2" src="https://github.com/user-attachments/assets/110e4359-be9e-406d-bc00-8d3c3904d347">

<img width="507" alt="Screenshot 2024-08-27 191916_Day4_postctsopenroadtimimganal1" src="https://github.com/user-attachments/assets/a46afd2b-f833-48e5-969f-1723ad67d6da">

<img width="506" alt="Screenshot 2024-08-27 192322_Day4_postctstimimganalysis2" src="https://github.com/user-attachments/assets/8e74a8cb-2b03-4241-a921-792920a798c4">

<img width="506" alt="Screenshot 2024-08-27 192604_Day4postctstiminganal3" src="https://github.com/user-attachments/assets/82a1707c-3052-42ca-9247-ede12e1355dc">

<img width="488" alt="Screenshot 2024-08-27 192846_Day4_postctstiminganal4" src="https://github.com/user-attachments/assets/f13d8eb2-8e9c-4f56-a928-d84afd8b383d">

<img width="489" alt="Screenshot 2024-08-28 045953_Day4synthesisrerunflowtillpostcts" src="https://github.com/user-attachments/assets/3732af0e-40e5-4d46-baff-0e4db9730126">



<h2> Day 5 : Final Steps for RTL2GDS using Tritionroute </h2>
Now as CTS has been Performed, We Can Proceed to Routing using Triton 
The Command for this is 
```
$ gen_pdn
```
<img width="485" alt="Screenshot 2024-08-28 063359_Day4_runfullflowtillpostcts18" src="https://github.com/user-attachments/assets/2542be18-6fde-46a2-a74f-97f5063379cb">

```
$ cd /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/26-08_11-52/tmp/floorplan/ #change directory containing PDN def

$ magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read 17-pdn.def & #Command to open PDN def in magic tool
```
<img width="488" alt="Screenshot 2024-08-28 063549_Day5_pdn" src="https://github.com/user-attachments/assets/df34cd81-4827-46a1-b23b-1b6a0640855d">

Below is the PDN Screenshot
<img width="710" alt="Screenshot 2024-08-28 064236_Day5_pdn17layoutmag" src="https://github.com/user-attachments/assets/aa7cb7de-b3b1-4d74-bdf5-2f2bb41dda74">

<img width="709" alt="Screenshot 2024-08-28 064803_Day5_pdnlayoutexpanded" src="https://github.com/user-attachments/assets/eaae13e8-055e-428a-8931-182bad1c41bd">

We now perform detailed routing using TritonRoute and explore the routed layout:

```
$ echo $::env(CURRENT_DEF) # Check value of 'CURRENT_DEF'

$ echo $::env(GLOBAL_ROUTER) #Specifies which global router to use. Values: `fastroute` or `cugr`,(Default: `fastroute`) 

$ echo $::env(DETAILED_ROUTER) # Specifies which detailed router to use. Values: `tritonroute`, `tritonroute_or`, or `drcu`. <br> (Default: `tritonroute`)

$ echo $::env(ROUTING_OPT_ITERS) # Specifies the maximum number of optimization iterations during Detailed Routing in TritonRoute (Default: `64`)
```

<img width="491" alt="Screenshot 2024-08-28 065520_Day5_echo" src="https://github.com/user-attachments/assets/43a7810b-acf8-4052-8498-109f13e255c2">

We now run Routing using the command 

```
$ run_routing
```

Below are the routing screenshots.

<img width="487" alt="Screenshot 2024-08-28 065811_Day5_runrout1" src="https://github.com/user-attachments/assets/d965bdd0-90f1-4cfb-97bf-039cb1bbbe9e">

<img width="488" alt="Screenshot 2024-08-28 070457_Day4_runroute2" src="https://github.com/user-attachments/assets/e90a892f-4e65-4938-bf5c-704d1adb4692">

<img width="491" alt="Screenshot 2024-08-28 070547_day5_runroute3" src="https://github.com/user-attachments/assets/b72b5b51-328e-440c-a04a-f12d90fb7f2a">

<img width="489" alt="Screenshot 2024-08-28 070626_Day5_runroute4" src="https://github.com/user-attachments/assets/280485b3-509c-40c8-9ee3-aa0feac3dd3f">

```
$ cd /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/26-08_11-52/results/routing/ # Change directory to path containing routed def

$ magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.def & 
```

Routed def Screenshots.

<img width="710" alt="Screenshot 2024-08-28 072403_Day5routedlayout" src="https://github.com/user-attachments/assets/e4af5bb8-3cd9-4fe6-ae6e-e20c07957810">

<img width="712" alt="Screenshot 2024-08-28 072835_Day5_routedlayoutexpanded" src="https://github.com/user-attachments/assets/15389198-67d8-40e9-8d88-bbc07bce0fb4">

Post-route STA analysis:

path of SPEF file post route: /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/26-08_11-52/results/routing/picorv32a.spef

To perform Static Timing Analysis (STA) in the OpenROAD flow within OpenLane after post-routing, you need to follow a structured process.

First, you need to create a new database for STA because the design database (db) has changed from the Clock Tree Synthesis (CTS) phase to the routing phase. This updated database will reflect the new connectivity and routing information, which is crucial for accurate timing analysis.

Next, ensure that you are using the post-route netlist for the analysis. This netlist incorporates the routing information, which is essential for assessing the timing of your design accurately.  The netlist should be the one generated after the routing phase.

A critical step in the process involves incorporating parasitic capacitance data from the SPEF (Standard Parasitic Exchange Format) file. This file contains information about the parasitic capacitance of the nets, which significantly impacts timing analysis.You need to read this SPEF file before generating the custom timing report. 

We Finally, generate a custom timing report using the appropriate STA tool. 

</details>


<h2> Congestion-Aware DRC-Compliant Mixed-Signal SoC Design Incorporating RISC-V Processor and Dual Analog IPs </h2>

Abstract - The project aims to design and analyze a mixed-signal System-on-Chip (SoC) that integrates a RISC-V processor with two custom analog IPs. It focuses on overcoming design challenges like congestion and Design Rule Check (DRC) violations to ensure an optimized layout. The analog IPs could involve components such as ADCs, PLLs, or comparators, interfacing seamlessly with the digital RISC-V core. Special attention will be given to the interaction between digital and analog blocks, ensuring noise isolation and minimal coupling, while maintaining adherence to PDK constraints.

<h3> Congestion-Aware DRC-Compliant Mixed-Signal SoC Design Incorporating RISC-V Processor and Dual Analog IPs : Initial Flow Setup  </h3>

Abstract - The project aims to design and analyze a mixed-signal System-on-Chip (SoC) that integrates a RISC-V processor with two custom analog IPs. It focuses on overcoming design challenges like congestion and Design Rule Check (DRC) violations to ensure an optimized layout. The analog IPs could involve components such as ADCs, PLLs, or comparators, interfacing seamlessly with the digital RISC-V core. Special attention will be given to the interaction between digital and analog blocks, ensuring noise isolation and minimal coupling, while maintaining adherence to PDK constraints.

Physical Design Flow refers to the process of converting a synthesized netlist and standard library into a layout based on design rules provided by the foundry, ultimately leading to chip creation. It aims to optimize wire length, area, and power.


The key steps in the flow include:
a. Partitioning makes it easier to create and evaluate the circuit by breaking it up into smaller sub-modules.

b. Chip planning includes both power planning (distributing power and ground nets) and floor planning (specifying block dimensions and location).

c. Placement: Ascertains where each cell is physically located inside a block.

d. Clock Network Synthesis: Creates a clock signal distribution that satisfies latency and skew specifications.

e. Routing is divided into two categories: detailed routing (assigning routes to metal layers and tracks) and global routing (allocating resources for connections).

f. Timing closure: guarantees ideal routing and location for enhanced circuit performance.

Floorplanning is a crucial step in the Physical Design Flow, responsible for determining the physical layout of the functional blocks within a chip. This step directly influences the chip's performance, area, and power consumption, making it one of the most critical stages in the design process.
Block dimension computation is one of the first steps in floorplanning, when each functional block is given a specified area based on how it functions and how many standard cells it contains. This stage makes sure that every block's height and width are optimal for the chip's total area, striking a balance between usefulness and effective use of available space. Following dimension assignment, the positioning of blocks is critical. In order to reduce routing congestion, highly connected blocks are positioned close to one another to minimize cable length and exchange significant amounts of data or signals. By reducing delays and power consumption, its strategic positioning aids in performance optimization.

To manage congestion, floorplanning reserves specific areas for routing channels, preventing overcrowded regions and ensuring efficient signal routing between blocks. Additionally, it handles aspect ratio and core alignment, maintaining a balanced height-to-width ratio of blocks for uniformity and proper chip structure. Buffer and repeater insertion are also incorporated into the design to manage signal integrity, particularly for long wires or high-frequency designs. Macro placement is another critical aspect, as large blocks like memory or IP cores must be placed first due to their fixed dimensions, which influence the overall floorplan. 

 Floorplanning is an iterative process that requires continuous feedback and adjustment. After the initial layout, performance metrics such as wire length, congestion, and timing are analyzed. Based on this analysis, the floorplan is refined and optimized to ensure the best possible performance. This feedback loop ensures that each iteration improves upon the previous layout. In timing-driven designs, floorplanning prioritizes the reduction of timing delays by focusing on critical timing paths. These timing-sensitive blocks are placed closer together to minimize path lengths, which is crucial in high-frequency designs where timing precision directly impacts the overall performance of the chip.


Essential files:

top.tcl

<img width="1038" alt="Screenshot 2024-09-24 at 4 18 35 PM" src="https://github.com/user-attachments/assets/c3ccb716-8f01-4a37-b817-cab9e9dee40c">
<img width="1038" alt="Screenshot 2024-09-24 at 4 19 21 PM" src="https://github.com/user-attachments/assets/109f6921-52f6-4f4c-9b2d-5486604dc25b">
<img width="1038" alt="Screenshot 2024-09-24 at 4 19 57 PM" src="https://github.com/user-attachments/assets/bbb6719a-54f2-4d43-88b6-4053c1d733db">
<img width="1038" alt="Screenshot 2024-09-24 at 4 22 57 PM" src="https://github.com/user-attachments/assets/265579af-9a03-45e0-94bd-2126a10b251c">
<img width="1038" alt="Screenshot 2024-09-24 at 4 27 26 PM" src="https://github.com/user-attachments/assets/d55a1579-d143-4f11-ab4e-c066db364f30">
<img width="1038" alt="Screenshot 2024-09-24 at 4 29 08 PM" src="https://github.com/user-attachments/assets/e7401e85-8d73-4a0d-a5d5-b27f0d3dff5b">


icc2_common_setup.tcl

<img width="1038" alt="Screenshot 2024-09-24 at 4 32 33 PM" src="https://github.com/user-attachments/assets/90cb4d19-f57b-4325-a3cc-aaa607e617f3">
<img width="1038" alt="Screenshot 2024-09-24 at 4 36 12 PM" src="https://github.com/user-attachments/assets/f748bacf-2b2a-4d1a-9c48-63f3c32de10f">
<img width="1038" alt="Screenshot 2024-09-24 at 4 38 25 PM" src="https://github.com/user-attachments/assets/f63e0569-413b-4a72-91ca-142db3561918">
<img width="1038" alt="Screenshot 2024-09-24 at 5 12 22 PM" src="https://github.com/user-attachments/assets/58e18fb4-428a-4a34-b349-170e72e25b4b">
<img width="1038" alt="Screenshot 2024-09-24 at 5 13 30 PM" src="https://github.com/user-attachments/assets/7d09dd07-c467-4ed7-b53b-3be43564c68e">

icc2_dp_setup.tcl

<img width="1038" alt="Screenshot 2024-09-24 at 5 37 06 PM" src="https://github.com/user-attachments/assets/a4df3883-c3d4-42c7-97de-3b45fff99a5e">
<img width="1038" alt="Screenshot 2024-09-24 at 5 39 14 PM" src="https://github.com/user-attachments/assets/192108fd-75d5-412e-8d87-fcb01c4e5a40">


init_design.read-parasitic_tech_example.tcl

<img width="1038" alt="Screenshot 2024-09-25 at 4 53 33 PM" src="https://github.com/user-attachments/assets/3060a7fd-629e-40b8-8f44-8409baec5bbd">


init_design.mcmm_example.auto-expanded.tcl

<img width="1038" alt="Screenshot 2024-09-25 at 5 26 37 PM" src="https://github.com/user-attachments/assets/7ae1639c-f686-45e6-a0ba-14b4224e7704">

<h2>Issues Faced </h2>

We might face issues when setting routing layer. One way to solve this is to ensure that we use correct names for the metal layers as present in .tf files.

![WhatsApp Image 2024-09-14 at 4 43 54 PM](https://github.com/user-attachments/assets/415f7577-0928-462a-aacc-a54a7ec12617)
![WhatsApp Image 2024-09-14 at 4 47 08 PM](https://github.com/user-attachments/assets/74eae385-fa4d-448e-a7be-9de22f3a096a)
![stackup](https://github.com/user-attachments/assets/52987717-ac24-4a29-9f66-0e8551186cf2)
![WhatsApp Image 2024-09-14 at 4 47 07 PM](https://github.com/user-attachments/assets/d25defd3-6a61-4c11-bb30-3a080279396c)


Another issue that we might face is Design linking issues which can lead to a wierd problem where area of the core is zero.
The way to deal with it is to first verify if you have set the paths correctly for the lef, tf and lib files.
see if the design is properly loaded utilizing echo commands.
Another issue can be unresolved references from the design which cannot match with any of the cells in the lib or lef files.

![WhatsApp Image 2024-09-21 at 9 32 37 PM](https://github.com/user-attachments/assets/4b967dc2-ca7a-4064-a8e5-7c5e5835753e)

Once all the Issues regarding the files are resolved, things should run smoothly. The Output looks as follows.

Full Chip:

<img width="1437" alt="Screenshot 2024-10-06 at 5 44 55 PM" src="https://github.com/user-attachments/assets/58559f47-a409-4ba1-8150-a119005410b6">

PLL:

<img width="1235" alt="Screenshot 2024-10-08 at 4 24 05 PM" src="https://github.com/user-attachments/assets/cf74d7d7-4967-4b04-b8d4-39422bc6febe">

post-route design with metal layers connecting standard cell routes/connections :

<img width="1440" alt="Screenshot 2024-10-09 at 5 07 44 AM" src="https://github.com/user-attachments/assets/1f968e6a-6311-46e4-b00a-7931f61381e8">


Proper Filler Cells used :

<img width="1439" alt="Screenshot 2024-10-06 at 4 11 04 PM" src="https://github.com/user-attachments/assets/a97a9559-b3ad-47ef-978a-65350b5ad54d">


<h3>Congestion-Aware DRC-Compliant Mixed-Signal SoC Design Incorporating RISC-V Processor and Dual Analog IPs : DRC Compliant Placement and Routing   </h3>

Min & Max Routing Layer,set up in icc2_common_setup.tcl & top.tcl :

<img width="1064" alt="Screenshot 2024-10-09 at 6 05 40 AM" src="https://github.com/user-attachments/assets/b84d6a90-d214-48ae-9d21-2a2f02301fa3">
<img width="1064" alt="Screenshot 2024-10-09 at 6 05 51 AM" src="https://github.com/user-attachments/assets/13b3a85b-4956-4c8d-b157-7803c9f07f45">

We can check for DRC Violations using the check_routes:

```
DRC-SUMMARY:
	@@@@@@@ TOTAL VIOLATIONS =	63
	Diff net spacing : 3
	Diff net via-cut spacing : 18
	Short : 42


 Total Wire Length =                    109143 micron
 Total Number of Contacts =             27934
 Total Number of Wires =                24346
 Total Number of PtConns =              241
 Total Number of Routed Wires =       24346
 Total Routed Wire Length =           109020 micron
 Total Number of Routed Contacts =       27934
	Layer          li1 :         60 micron
	Layer         met1 :      17902 micron
	Layer         met2 :      47346 micron
	Layer         met3 :      35012 micron
	Layer         met4 :       6331 micron
	Layer         met5 :       2492 micron
	Via        M4M5_PR :        443
	Via        M3M4_PR :       1421
	Via      M3M4_PR_C :         12
	Via        M2M3_PR :       5475
	Via   M2M3_PR(rot) :         23
	Via        M1M2_PR :      10771
	Via   M1M2_PR(rot) :         13
	Via        L1M1_PR :       8622
	Via   L1M1_PR(rot) :       1113
	Via      L1M1_PR_C :         41
```

Now We have to figure out a way to resolve these DRCs.
 We can try tweaking various factors such as Core Utilization, trying to make placement Congestion aware ; trying to optimize routing as well as making it density aware.
 Finally when DRC's are Considerably lower say 10-13 We can try other commands to clean drc.

 I tried Multiple things with varying degrees of sucess. The First thing that i tried to tweak was the Core Utilization. The Core Utilization was varied from 0.42 to 0.47. The numbar of DRCs were low for 0.43 and 0.45 with 0.45 giving the best DRC count of 13. 
 
<img width="1440" alt="Screenshot 2024-10-15 at 2 28 40 PM" src="https://github.com/user-attachments/assets/ff9cd58a-d0ab-4760-8c30-f1be7322f878">

![WhatsApp Image 2024-10-16 at 09 51 31](https://github.com/user-attachments/assets/377fa839-685b-4453-8aa1-23bbd72b5ba1)

<img width="935" alt="Screenshot 2024-10-14 at 10 51 17 PM" src="https://github.com/user-attachments/assets/af99b5a2-daaa-4f12-8901-dca5af2503e6">


Here's a brief analysis of each chart showing how Core Utilization at floorplan affects different metrics, particularly focusing on DRC (Design Rule Check) violations and routing congestion:
1. Total DRC Violations vs Core Utilization
•	As Core Utilization increases, total DRC violations fluctuate.
•	Higher utilization can increase pressure on routing resources and spacing, leading to more DRC violations. However, small dips at certain points indicate efficient floorplanning can help reduce violations.
2. Diff Net Spacing vs Core Utilization
•	Diff Net Spacing increases with core utilization.
•	As utilization approaches 0.46 and 0.47, spacing issues arise. Congested floorplans with higher utilization limit the room available for differential nets, leading to spacing-related DRC violations.
3. Diff Net Via-Cut Spacing vs Core Utilization
•	Via-cut spacing violations show spikes at higher utilization (0.47).
•	With dense cores, maintaining proper via spacing becomes harder, creating via-related violations, which impacts manufacturability and reliability of chip connections.
4. Shorts vs Core Utilization
•	Shorts tend to increase with higher utilization (e.g., peaks at 0.44 and 0.47).
•	As routing resources become scarce, nets run closer, increasing the chance of short-circuit violations. Optimized floorplans can keep short violations under control.
5. Both Directions Overflow Total vs Core Utilization
•	Overflow increases at 0.44, 0.45, and 0.47, suggesting that higher utilization congests both horizontal and vertical routing layers.
•	When overflow totals are high, it indicates routing congestion, forcing paths to detour and creating potential DRC violations.
6. Both Directions Max Overflow vs Core Utilization
•	The max overflow remains consistent but increases slightly at higher utilizations.
•	Persistent max overflow indicates tight floorplans where some sections exceed capacity in both directions, stressing routing and violating DRC rules.
7. H Routing Overflow Total vs Core Utilization
•	Horizontal overflow worsens as utilization increases to 0.45 and 0.47.
•	This suggests that horizontal routing resources are more stressed under higher utilization, contributing to routing bottlenecks and potential DRC violations.
8. H Routing Max Overflow vs Core Utilization
•	Similar to the total horizontal overflow trend, max overflow peaks multiple times, especially at higher utilizations (e.g., 0.47).
•	This implies that high utilization leads to local congestion points where horizontal routes are over-utilized.
9. V Routing Overflow Total vs Core Utilization
•	Vertical routing overflow also increases, though the trend is less pronounced than horizontal routing.
•	High vertical overflow indicates limited via layers or inefficient floorplan design, which forces signals to compete for routing resources.
10. V Routing Max Overflow vs Core Utilization
•	Vertical max overflow shows sharp peaks at 0.44, 0.45, and 0.47, suggesting significant congestion at those utilization points.
•	This reflects issues with layer resources or design constraints that prevent vertical routing from functioning efficiently, leading to violations.
Summary:
•	Higher Core Utilization (beyond 0.45) leads to:
o	Increased DRC violations related to spacing, shorts, and via-cuts.
o	Routing congestion increases as overflow worsens, especially in horizontal routes.
o	Efficient floorplanning and careful resource management are crucial to limit violations and manage congestion.
These charts highlight the trade-off between maximizing core utilization and managing DRCs and routing congestion—critical aspects in VLSI design that directly impact manufacturability and chip performance.

The research indicates that more DRC violations are typically caused by higher levels of congestion. The highest congestion, with 317 total overflows, is associated with the highest DRC count of 40 for core usage of 0.47. Likewise, the DRC count decreases to 29 when core usage is at 0.42 and congestion is smaller (200 overflows). This pattern highlights the necessity of attentive congestion management to lower DRC counts by showing a clear correlation between rising congestion and an increase in DRC violations.

There are also instances, nevertheless, in which there is a different direct association between congestion and DRC infractions. For example, at 0.44 core utilization, the DRC count is surprisingly higher at 30 compared to lower congestion at 0.46 utilization with 21 violations, even though there is more congestion with 265 overflows. These differences imply that DRC counts may be significantly influenced by variables other than congestion levels, such as cable length, routing quality, or particular design limitations.


Now that we have hit the zone of stalled improvement where the DRCs just dont seem to resolve we now have to 
intervene manually to get this DRC issue sorted. The command for this is 
 
```
route_auto -max_detail_route_iterations 6 
```

 I then made the placement setting desity aware as well which drastically reduced DRC's to 10.

```
set_app_options -name place.coarse.auto_density_control -value true
```

 However it did make congestion Worse so i set the placement setting to both the previouscontinue_on_missing_scandef as well as density aware place.coarse.auto_density_control  which gave a decent outcome of 12 DRCs balanced output.
 
  
<img width="935" alt="Screenshot 2024-10-14 at 10 51 17 PM" src="https://github.com/user-attachments/assets/87eda856-c67c-4144-abf6-c9c27092e76f">


Now that we have hit the zone of stalled improvement where the DRCs just dont seem to resolve we now have to 
intervene manually to get this DRC issue sorted. The command for this is 

```
route_detail -initial_drc_from_input true
```

The -initial_drc_from_input true | false option determines whether the router uses pre-existing DRC information stored in the block or performs a fresh check. 
By default, the router checks the entire block for design rule violations and fixes them. When set to true, the router tries to correct violations using the DRC data that is stored in the block, bypassing the DRC check. Use this option sparingly and only if you are positive that the DRC data you have stored is correct and current.

Before:

```
DRC-SUMMARY:
	@@@@@@@ TOTAL VIOLATIONS =	12
	Diff net spacing : 3
	Diff net via-cut spacing : 1
	Short : 8


Total Wire Length =                    106696 micron
Total Number of Contacts =             27331
Total Number of Wires =                23579
Total Number of PtConns =              235
Total Number of Routed Wires =       23579
Total Routed Wire Length =           106584 micron
Total Number of Routed Contacts =       27331
	Layer          li1 :         41 micron
	Layer         met1 :      17842 micron
	Layer         met2 :      46132 micron
	Layer         met3 :      34262 micron
	Layer         met4 :       5973 micron
	Layer         met5 :       2446 micron
	Via        M4M5_PR :        424
	Via        M3M4_PR :       1328
	Via        M2M3_PR :       5268
	Via        M1M2_PR :      10563
	Via   M1M2_PR(rot) :          5
	Via        L1M1_PR :       8490
	Via   L1M1_PR(rot) :       1210
	Via      L1M1_PR_C :         43

```

After:

```
DRC-SUMMARY:
	@@@@@@@ TOTAL VIOLATIONS =	0


Total Wire Length =                    106709 micron
Total Number of Contacts =             27336
Total Number of Wires =                23580
Total Number of PtConns =              236
Total Number of Routed Wires =       23580
Total Routed Wire Length =           106596 micron
Total Number of Routed Contacts =       27336
	Layer          li1 :         37 micron
	Layer         met1 :      17845 micron
	Layer         met2 :      46134 micron
	Layer         met3 :      34263 micron
	Layer         met4 :       5985 micron
	Layer         met5 :       2446 micron
	Via        M4M5_PR :        424
	Via        M3M4_PR :       1330
	Via        M2M3_PR :       5268
	Via        M1M2_PR :      10566
	Via   M1M2_PR(rot) :          5
	Via        L1M1_PR :       8490
	Via   L1M1_PR(rot) :       1210
	Via      L1M1_PR_C :         43
```

![WhatsApp Image 2024-10-16 at 21 06 52](https://github.com/user-attachments/assets/091a9967-43ab-4caa-89fe-9d97ba4a7225)

![WhatsApp Image 2024-10-16 at 21 06 59](https://github.com/user-attachments/assets/bc57cfc5-5de2-4993-bcdb-21fc76fa657d)

![WhatsApp Image 2024-10-16 at 21 07 07](https://github.com/user-attachments/assets/1cbcba12-ea84-40c1-86b8-e744933fe7c4)

![WhatsApp Image 2024-10-16 at 21 07 24](https://github.com/user-attachments/assets/3e720ca2-4c4b-40ca-8c1a-8baebedb7419)

![WhatsApp Image 2024-10-16 at 21 07 35](https://github.com/user-attachments/assets/85da81ac-67ec-4599-86f6-e07d381312c7)

![WhatsApp Image 2024-10-16 at 21 07 43](https://github.com/user-attachments/assets/e9b38ca3-4a4f-44e3-ac1a-cc5de49ef8d0)

![WhatsApp Image 2024-10-16 at 21 07 53](https://github.com/user-attachments/assets/1b7425e7-8677-4a4c-b26b-37641333f797)


The number of DRCs decreases significantly when the route_auto -max_detail_route_iterations 6 setting is applied, indicating that optimizing the routing iterations is effective.
However, with higher placement effort (medium and high), the DRCs start increasing, showing diminishing returns with additional effort.
While the value remains mostly constant, the overflow drops drastically with high placement effort. This could indicate that congestion-aware placement strategies manage routing paths effectively. horizontal routing shows minimal variation except for the high placement effort, where the overflow drops to zero. 
Vertical routing shows similar trends as horizontal routing, with the highest overflow consistency across different settings. However, advanced placement strategies momentarily reduce congestion here as well.

The investigation demonstrates that optimal routing iterations result in the largest DRC decrease, particularly with no placement assistance. Advanced placement techniques (such as high effort) don't always translate into fewer DRCs, even though they might lessen congestion. This emphasizes that in order to accomplish both congestion control and minimal DRCs, routing iterations and placement configurations must be balanced.


![WhatsApp Image 2024-10-16 at 20 41 12](https://github.com/user-attachments/assets/5b8c18bc-7ca5-49a2-aa6c-71417ada8e38)

Observations and Possible Reasons:

<img width="734" alt="Screenshot 2024-10-20 at 5 26 51 AM" src="https://github.com/user-attachments/assets/73ab1d93-83c1-4d75-8590-c26ddde30329">


The Total Wire length and the number of Contacts have increased Slightly after running the route_detail command; eliminating all DRCs in the design.
This suggests that the routing tool adjusted some wire paths and vias, possibly rerouting or optimizing certain connections to resolve DRCs.
The increased length of wires, number of contacts, and minor adjustments to certain layers' wire lengths seems to have enabled the router to refine its routing and address spacing violations and shorts.

```
****************************************
Report : qor
Design : vsdbabysoc
Version: T-2022.03-SP5
Date   : Mon Oct 14 07:27:58 2024
****************************************


Scenario           'func1::estimated_corner'
Timing Path Group  'default'
----------------------------------------
Levels of Logic:                      1
Critical Path Length:              0.08
Critical Path Slack:               9.92
Critical Path Clk Period:            --
Total Negative Slack:              0.00
No. of Violating Paths:               0
----------------------------------------

Scenario           'func1::estimated_corner'
Timing Path Group  'clk'
----------------------------------------
Levels of Logic:                     40
Critical Path Length:              9.25
Critical Path Slack:               0.18
Critical Path Clk Period:         10.00
Total Negative Slack:              0.00
No. of Violating Paths:               0
----------------------------------------


Cell Count
----------------------------------------
Hierarchical Cell Count:              1
Hierarchical Port Count:             14
Leaf Cell Count:                   2743
Buf/Inv Cell Count:                 578
Buf Cell Count:                       2
Inv Cell Count:                     576
CT Buf/Inv Cell Count:                0
Combinational Cell Count:          2067
   Single-bit Isolation Cell Count:                        0
   Multi-bit Isolation Cell Count:                         0
   Isolation Cell Banking Ratio:                           0.00%
   Single-bit Level Shifter Cell Count:                    0
   Multi-bit Level Shifter Cell Count:                     0
   Level Shifter Cell Banking Ratio:                       0.00%
   Single-bit ELS Cell Count:                              0
   Multi-bit ELS Cell Count:                               0
   ELS Cell Banking Ratio:                                 0.00%
Sequential Cell Count:              676
   Integrated Clock-Gating Cell Count:                     0
   Sequential Macro Cell Count:                            0
   Single-bit Sequential Cell Count:                       676
   Multi-bit Sequential Cell Count:                        0
   Sequential Cell Banking Ratio:                          0.00%
   BitsPerflop:                                            1.00
Macro Count:                          2
----------------------------------------
Area
----------------------------------------
Combinational Area:            11407.19
Noncombinational Area:         13532.98
Buf/Inv Area:                   2169.58
Total Buffer Area:                 7.51
Total Inverter Area:            2162.07
Macro/Black Box Area:         671652.37
Net Area:                             0
Net XLength:                   50313.72
Net YLength:                   48865.19
----------------------------------------
Cell Area (netlist):                         696592.54
Cell Area (netlist and physical only):       696592.55
Net Length:                    99178.91


Design Rules
----------------------------------------
Total Number of Nets:              2993
Nets with Violations:                42
Max Trans Violations:                29
Max Cap Violations:                  42
----------------------------------------
```
<h2> Congestion-Aware DRC-Compliant Mixed-Signal SoC Design Incorporating RISC-V Processor and Dual Analog IPs: CTS Optimization and STA  </h2>


After routing is completed, in icc2_shell, we can extract parasitics information in .SPEF format by using following command :
```
write_parasitics -corner func1 -output /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/standaloneFlow/vsdbabysoc_parasitics
```

SPEF File:

<img width="1063" alt="Screenshot 2024-10-14 at 8 19 31 PM" src="https://github.com/user-attachments/assets/d94cb86b-d532-43b5-ba30-fce879402bac">

We now write out the post_route netlist :

```
 write_verilog /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/standaloneFlow/vsdbabysoc_post_route_net.v
```

We can find Prime Time analysis reports in the reports directory.


```

****************************************
Report : analysis_coverage
Design : vsdbabysoc
Version: T-2022.03-SP5-4
Date   : Fri Oct 18 07:26:37 2024
****************************************

Type of Check         Total              Met         Violated         Untested
--------------------------------------------------------------------------------
setup                   676       580 ( 86%)        95 ( 14%)         1 (  0%)
hold                    676       328 ( 49%)       347 ( 51%)         1 (  0%)
min_pulse_width        1352      1352 (100%)         0 (  0%)         0 (  0%)
--------------------------------------------------------------------------------
All Checks             2704      2260 ( 84%)       442 ( 16%)         2 (  0%)

```


```

pt_shell> report_timing -path_type full -delay_type max -input_pins -nets -max_paths 1 -transition_time -capacitance -sort_by slack
****************************************
Report : timing
	-path_type full
	-delay_type max
	-input_pins
	-nets
	-max_paths 1
	-transition_time
	-capacitance
	-sort_by slack
Design : vsdbabysoc
Version: T-2022.03-SP5-4
Date   : Fri Oct 18 09:11:27 2024
****************************************


  Startpoint: core/CPU_is_addi_a3_reg
               (rising edge-triggered flip-flop clocked by clk)
  Endpoint: core/CPU_Xreg_value_a4_reg[26][31]
               (rising edge-triggered flip-flop clocked by clk)
  Path Group: clk
  Path Type: max

  Point                       Fanout    Cap      Trans       Incr       Path
  -----------------------------------------------------------------------------
  clock clk (rise edge)                           0.00       0.00       0.00
  clock network delay (ideal)                                3.00       3.00
  core/CPU_is_addi_a3_reg/CLK (sky130_fd_sc_hd__dfxtp_1)
                                                  0.00       0.00       3.00 r
  core/CPU_is_addi_a3_reg/Q (sky130_fd_sc_hd__dfxtp_1)
                                                  0.05       0.30 &     3.30 f
  core/CPU_is_addi_a3 (net)      2     0.01 
  core/U474/A (sky130_fd_sc_hd__nor2_1)           0.05       0.00 &     3.30 f
  core/U474/Y (sky130_fd_sc_hd__nor2_1)           0.16       0.16 &     3.46 r
  core/n144 (net)                2     0.01 
  core/U476/A (sky130_fd_sc_hd__nand2_1)          0.16       0.00 &     3.46 r
  core/U476/Y (sky130_fd_sc_hd__nand2_1)          0.11       0.13 &     3.59 f
  core/n147 (net)                2     0.01 
  core/U9/A (sky130_fd_sc_hd__inv_2)              0.11       0.00 &     3.59 f
  core/U9/Y (sky130_fd_sc_hd__inv_2)              0.96       0.67 &     4.26 r
  core/n150 (net)               34     0.20 
  core/U479/B (sky130_fd_sc_hd__xor2_1)           0.96       0.04 &     4.30 r
  core/U479/X (sky130_fd_sc_hd__xor2_1)           0.25       0.25 &     4.54 f
  core/n210 (net)                2     0.01 
  core/U569/A2 (sky130_fd_sc_hd__a21oi_1)         0.25       0.00 &     4.55 f
  core/U569/Y (sky130_fd_sc_hd__a21oi_1)          0.26       0.32 &     4.87 r
  core/n809 (net)                2     0.01 
  core/U571/A2 (sky130_fd_sc_hd__o21ai_1)         0.26       0.00 &     4.87 r
  core/U571/Y (sky130_fd_sc_hd__o21ai_1)          0.10       0.14 &     5.01 f
  core/n791 (net)                2     0.01 
  core/U574/A1 (sky130_fd_sc_hd__a21oi_1)         0.10       0.00 &     5.01 f
  core/U574/Y (sky130_fd_sc_hd__a21oi_1)          0.25       0.25 &     5.25 r
  core/n774 (net)                2     0.01 
  core/U576/A2 (sky130_fd_sc_hd__o21ai_1)         0.26       0.00 &     5.26 r
  core/U576/Y (sky130_fd_sc_hd__o21ai_1)          0.11       0.15 &     5.40 f
  core/n755 (net)                2     0.01 
  core/U581/A1 (sky130_fd_sc_hd__a21oi_1)         0.11       0.00 &     5.40 f
  core/U581/Y (sky130_fd_sc_hd__a21oi_1)          0.22       0.23 &     5.63 r
  core/n740 (net)                2     0.01 
  core/U583/A2 (sky130_fd_sc_hd__o21ai_1)         0.22       0.00 &     5.63 r
  core/U583/Y (sky130_fd_sc_hd__o21ai_1)          0.20       0.21 &     5.84 f
  core/n722 (net)                2     0.02 
  core/U587/A1 (sky130_fd_sc_hd__a21oi_1)         0.20       0.01 &     5.84 f
  core/U587/Y (sky130_fd_sc_hd__a21oi_1)          0.24       0.27 &     6.11 r
  core/n707 (net)                2     0.01 
  core/U589/A2 (sky130_fd_sc_hd__o21ai_1)         0.24       0.00 &     6.12 r
  core/U589/Y (sky130_fd_sc_hd__o21ai_1)          0.10       0.13 &     6.25 f
  core/n689 (net)                2     0.01 
  core/U344/A1 (sky130_fd_sc_hd__a21oi_1)         0.10       0.00 &     6.25 f
  core/U344/Y (sky130_fd_sc_hd__a21oi_1)          0.23       0.23 &     6.48 r
  core/n674 (net)                2     0.01 
  core/U213/A2 (sky130_fd_sc_hd__o21ai_1)         0.23       0.00 &     6.48 r
  core/U213/Y (sky130_fd_sc_hd__o21ai_1)          0.10       0.13 &     6.61 f
  core/n656 (net)                2     0.01 
  core/U343/A1 (sky130_fd_sc_hd__a21oi_1)         0.10       0.00 &     6.62 f
  core/U343/Y (sky130_fd_sc_hd__a21oi_1)          0.24       0.23 &     6.85 r
  core/n641 (net)                2     0.01 
  core/U210/A2 (sky130_fd_sc_hd__o21ai_1)         0.24       0.00 &     6.85 r
  core/U210/Y (sky130_fd_sc_hd__o21ai_1)          0.10       0.14 &     6.99 f
  core/n623 (net)                2     0.01 
  core/U342/A1 (sky130_fd_sc_hd__a21oi_1)         0.10       0.00 &     6.99 f
  core/U342/Y (sky130_fd_sc_hd__a21oi_1)          0.23       0.23 &     7.22 r
  core/n608 (net)                2     0.01 
  core/U209/A2 (sky130_fd_sc_hd__o21ai_1)         0.23       0.00 &     7.22 r
  core/U209/Y (sky130_fd_sc_hd__o21ai_1)          0.10       0.13 &     7.35 f
  core/n590 (net)                2     0.01 
  core/U341/A1 (sky130_fd_sc_hd__a21oi_1)         0.10       0.00 &     7.35 f
  core/U341/Y (sky130_fd_sc_hd__a21oi_1)          0.23       0.23 &     7.58 r
  core/n575 (net)                2     0.01 
  core/U215/A2 (sky130_fd_sc_hd__o21ai_1)         0.23       0.00 &     7.58 r
  core/U215/Y (sky130_fd_sc_hd__o21ai_1)          0.09       0.13 &     7.71 f
  core/n557 (net)                2     0.01 
  core/U96/A1 (sky130_fd_sc_hd__a21o_1)           0.09       0.00 &     7.71 f
  core/U96/X (sky130_fd_sc_hd__a21o_1)            0.05       0.18 &     7.89 f
  core/n541 (net)                1     0.01 
  core/U942/CIN (sky130_fd_sc_hd__fa_1)           0.05       0.00 &     7.89 f
  core/U942/COUT (sky130_fd_sc_hd__fa_1)          0.11       0.41 &     8.31 f
  core/n527 (net)                2     0.01 
  core/U94/A1 (sky130_fd_sc_hd__a21o_1)           0.11       0.00 &     8.31 f
  core/U94/X (sky130_fd_sc_hd__a21o_1)            0.05       0.19 &     8.50 f
  core/n511 (net)                1     0.01 
  core/U905/CIN (sky130_fd_sc_hd__fa_1)           0.05       0.00 &     8.50 f
  core/U905/COUT (sky130_fd_sc_hd__fa_1)          0.09       0.38 &     8.88 f
  core/n497 (net)                1     0.01 
  core/U887/CIN (sky130_fd_sc_hd__fa_1)           0.09       0.00 &     8.88 f
  core/U887/COUT (sky130_fd_sc_hd__fa_1)          0.09       0.40 &     9.27 f
  core/n965 (net)                1     0.01 
  core/U1370/CIN (sky130_fd_sc_hd__fa_1)          0.09       0.00 &     9.28 f
  core/U1370/COUT (sky130_fd_sc_hd__fa_1)         0.09       0.39 &     9.67 f
  core/n483 (net)                1     0.01 
  core/U36/CIN (sky130_fd_sc_hd__fa_2)            0.09       0.00 &     9.67 f
  core/U36/COUT (sky130_fd_sc_hd__fa_2)           0.08       0.36 &    10.03 f
  core/n469 (net)                2     0.01 
  core/U87/A (sky130_fd_sc_hd__clkinv_1)          0.08       0.00 &    10.04 f
  core/U87/Y (sky130_fd_sc_hd__clkinv_1)          0.04       0.06 &    10.09 r
  core/n257 (net)                1     0.00 
  core/U613/A2 (sky130_fd_sc_hd__o21ai_1)         0.04       0.00 &    10.09 r
  core/U613/Y (sky130_fd_sc_hd__o21ai_1)          0.10       0.08 &    10.17 f
  core/n452 (net)                1     0.01 
  core/U352/CIN (sky130_fd_sc_hd__fa_1)           0.10       0.00 &    10.17 f
  core/U352/COUT (sky130_fd_sc_hd__fa_1)          0.09       0.40 &    10.57 f
  core/n438 (net)                1     0.01 
  core/U348/CIN (sky130_fd_sc_hd__fa_1)           0.09       0.00 &    10.57 f
  core/U348/COUT (sky130_fd_sc_hd__fa_1)          0.10       0.41 &    10.98 f
  core/n407 (net)                1     0.01 
  core/U35/CIN (sky130_fd_sc_hd__fa_1)            0.10       0.00 &    10.98 f
  core/U35/COUT (sky130_fd_sc_hd__fa_1)           0.09       0.40 &    11.38 f
  core/n382 (net)                1     0.01 
  core/U33/CIN (sky130_fd_sc_hd__fa_1)            0.09       0.00 &    11.38 f
  core/U33/COUT (sky130_fd_sc_hd__fa_1)           0.12       0.43 &    11.81 f
  core/n357 (net)                2     0.01 
  core/U81/A1 (sky130_fd_sc_hd__a21o_1)           0.12       0.00 &    11.81 f
  core/U81/X (sky130_fd_sc_hd__a21o_1)            0.05       0.19 &    12.01 f
  core/n330 (net)                1     0.01 
  core/U347/CIN (sky130_fd_sc_hd__fa_1)           0.05       0.00 &    12.01 f
  core/U347/COUT (sky130_fd_sc_hd__fa_1)          0.10       0.40 &    12.40 f
  core/n305 (net)                1     0.01 
  core/U351/CIN (sky130_fd_sc_hd__fa_1)           0.10       0.00 &    12.40 f
  core/U351/COUT (sky130_fd_sc_hd__fa_1)          0.08       0.39 &    12.79 f
  core/n262 (net)                1     0.00 
  core/U617/B (sky130_fd_sc_hd__xor2_1)           0.08       0.00 &    12.79 f
  core/U617/X (sky130_fd_sc_hd__xor2_1)           0.34       0.30 &    13.09 r
  core/n286 (net)                2     0.01 
  core/U618/A (sky130_fd_sc_hd__nand2_2)          0.34       0.00 &    13.10 r
  core/U618/Y (sky130_fd_sc_hd__nand2_2)          0.43       0.29 &    13.39 f
  core/n284 (net)               15     0.06 
  core/U623/B2 (sky130_fd_sc_hd__o22ai_1)         0.43       0.01 &    13.40 f
  core/U623/Y (sky130_fd_sc_hd__o22ai_1)          0.37       0.30 &    13.70 r
  core/n3135 (net)               1     0.01 
  core/CPU_Xreg_value_a4_reg[26][31]/D (sky130_fd_sc_hd__dfxtp_1)
                                                  0.37       0.00 &    13.70 r
  data arrival time                                                    13.70

  clock clk (rise edge)                           0.00      10.00      10.00
  clock network delay (ideal)                                3.00      13.00
  clock reconvergence pessimism                              0.00      13.00
  clock uncertainty                                         -0.50      12.50
  core/CPU_Xreg_value_a4_reg[26][31]/CLK (sky130_fd_sc_hd__dfxtp_1)    12.50 r
  library setup time                                        -0.14      12.36
  data required time                                                   12.36
  -----------------------------------------------------------------------------
  data required time                                                   12.36
  data arrival time                                                   -13.70
  -----------------------------------------------------------------------------
  slack (VIOLATED)                                                     -1.34

```

<h3> Key Learning : CTS Optimization  </h3>
We Changed the clocks in sdc constraint files with Propogated Clocks and expected the issue to resolve itself But lo and behold, once we did that we still kept on facing the same issue. 

![WhatsApp Image 2024-10-22 at 2 59 02 PM](https://github.com/user-attachments/assets/dc5a8d58-fbf9-45c2-b4e0-e4378c440f11)

The clock despite being constrained in the sdc file to be propogated were behaving in an ideal manner. This was very peculiar behaviour and we then set to investigate what could be the reason for this. So we set out to investigate.  

We decided to run the flow by manually entering parts of script one by one Upon and observing the output. We suspected that there might be some issues with CTS Further investigation 

![WhatsApp Image 2024-11-01 at 3 54 10 PM](https://github.com/user-attachments/assets/528c7a3a-4703-47dc-baff-b5cbce69a960)


```

****************************************
Report : analysis_coverage
Design : vsdbabysoc
Version: T-2022.03-SP5-4
Date   : Fri Nov  8 10:39:45 2024
****************************************

Type of Check         Total              Met         Violated         Untested
--------------------------------------------------------------------------------
setup                   676       675 (100%)         0 (  0%)         1 (  0%)
hold                    676       620 ( 92%)        55 (  8%)         1 (  0%)
min_pulse_width        1352      1352 (100%)         0 (  0%)         0 (  0%)
--------------------------------------------------------------------------------
All Checks             2704      2647 ( 98%)        55 (  2%)         2 (  0%)


pt_shell> report_timing -path_type full -delay_type max -input_pins -nets -max_paths 1 -transition_time -capacitance -sort_by slack
****************************************
Report : timing
	-path_type full
	-delay_type max
	-input_pins
	-nets
	-max_paths 1
	-transition_time
	-capacitance
	-sort_by slack
Design : vsdbabysoc
Version: T-2022.03-SP5-4
Date   : Fri Nov  8 10:41:11 2024
****************************************


  Startpoint: core/CPU_is_add_a3_reg
               (rising edge-triggered flip-flop clocked by clk)
  Endpoint: core/CPU_Xreg_value_a4_reg[3][31]
               (rising edge-triggered flip-flop clocked by clk)
  Last common pin: pll/CLK
  Path Group: clk
  Path Type: max

  Point                       Fanout    Cap      Trans       Incr       Path
  -----------------------------------------------------------------------------
  clock clk (rise edge)                           0.00       0.00       0.00
  clock network delay (propagated)                           0.40       0.40
  core/CPU_is_add_a3_reg/CLK (sky130_fd_sc_hd__dfxtp_1)
                                                  0.11       0.00       0.40 r
  core/CPU_is_add_a3_reg/Q (sky130_fd_sc_hd__dfxtp_1)
                                                  0.04       0.33       0.73 f
  core/CPU_is_add_a3 (net)       2     0.00 
  core/U474/A (sky130_fd_sc_hd__nor2_1)           0.04       0.00       0.73 f
  core/U474/Y (sky130_fd_sc_hd__nor2_1)           0.12       0.12       0.85 r
  core/n144 (net)                2     0.01 
  core/U476/A (sky130_fd_sc_hd__nand2_1)          0.12       0.00       0.86 r
  core/U476/Y (sky130_fd_sc_hd__nand2_1)          0.09       0.11       0.97 f
  core/n147 (net)                2     0.01 
  core/U9/A (sky130_fd_sc_hd__inv_1)              0.09       0.00       0.97 f
  core/U9/Y (sky130_fd_sc_hd__inv_1)              0.30       0.25       1.23 r
  core/n150 (net)                9     0.04 
  core/ZBUF_2370_inst_40/A (sky130_fd_sc_hd__buf_2)
                                                  0.30       0.00       1.23 r
  core/ZBUF_2370_inst_40/X (sky130_fd_sc_hd__buf_2)
                                                  0.99       0.78 &     2.01 r
  core/ZBUF_2370_0 (net)        52     0.20 
  core/ctmTdsLR_2_106/B2 (sky130_fd_sc_hd__o2bb2ai_1)
                                                  0.99       0.04 &     2.05 r
  core/ctmTdsLR_2_106/Y (sky130_fd_sc_hd__o2bb2ai_1)
                                                  0.16       0.15 &     2.20 f
  core/n227 (net)                2     0.01 
  core/U44/B (sky130_fd_sc_hd__or2_0)             0.16       0.00 &     2.20 f
  core/U44/X (sky130_fd_sc_hd__or2_0)             0.09       0.27       2.48 f
  core/n721 (net)                2     0.01 
  core/ctmTdsLR_1_141/A2 (sky130_fd_sc_hd__a21boi_2)
                                                  0.09       0.01       2.48 f
  core/ctmTdsLR_1_141/Y (sky130_fd_sc_hd__a21boi_2)
                                                  0.13       0.18       2.66 r
  core/n707 (net)                2     0.01 
  core/U589/A2 (sky130_fd_sc_hd__o21ai_1)         0.13       0.00       2.66 r
  core/U589/Y (sky130_fd_sc_hd__o21ai_1)          0.09       0.11       2.77 f
  core/n689 (net)                2     0.01 
  core/ctmTdsLR_1_142/A1 (sky130_fd_sc_hd__a21boi_2)
                                                  0.09       0.01       2.78 f
  core/ctmTdsLR_1_142/Y (sky130_fd_sc_hd__a21boi_2)
                                                  0.13       0.17       2.94 r
  core/n674 (net)                2     0.01 
  core/U213/A2 (sky130_fd_sc_hd__o21ai_1)         0.13       0.00       2.95 r
  core/U213/Y (sky130_fd_sc_hd__o21ai_1)          0.09       0.11       3.06 f
  core/n656 (net)                2     0.01 
  core/ctmTdsLR_1_143/A1 (sky130_fd_sc_hd__a21boi_2)
                                                  0.09       0.01       3.06 f
  core/ctmTdsLR_1_143/Y (sky130_fd_sc_hd__a21boi_2)
                                                  0.13       0.17       3.23 r
  core/n641 (net)                2     0.01 
  core/U210/A2 (sky130_fd_sc_hd__o21ai_1)         0.13       0.00       3.23 r
  core/U210/Y (sky130_fd_sc_hd__o21ai_1)          0.08       0.10       3.33 f
  core/n623 (net)                2     0.01 
  core/ctmTdsLR_1_144/A1 (sky130_fd_sc_hd__a21boi_1)
                                                  0.08       0.00       3.33 f
  core/ctmTdsLR_1_144/Y (sky130_fd_sc_hd__a21boi_1)
                                                  0.20       0.19       3.53 r
  core/n608 (net)                2     0.01 
  core/U209/A2 (sky130_fd_sc_hd__o21ai_1)         0.20       0.00       3.53 r
  core/U209/Y (sky130_fd_sc_hd__o21ai_1)          0.08       0.11       3.65 f
  core/n590 (net)                2     0.01 
  core/ctmTdsLR_1_145/A1 (sky130_fd_sc_hd__a21boi_1)
                                                  0.08       0.00       3.65 f
  core/ctmTdsLR_1_145/Y (sky130_fd_sc_hd__a21boi_1)
                                                  0.21       0.21 &     3.85 r
  core/n575 (net)                2     0.01 
  core/U215/A2 (sky130_fd_sc_hd__o21ai_1)         0.21       0.00 &     3.86 r
  core/U215/Y (sky130_fd_sc_hd__o21ai_1)          0.08       0.12       3.97 f
  core/n557 (net)                2     0.01 
  core/ctmTdsLR_1_146/A (sky130_fd_sc_hd__nand2_1)
                                                  0.08       0.00       3.97 f
  core/ctmTdsLR_1_146/Y (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.07       4.04 r
  core/tmp_net36 (net)           1     0.00 
  core/ctmTdsLR_2_147/A (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.00       4.05 r
  core/ctmTdsLR_2_147/Y (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.06       4.10 f
  core/n541 (net)                1     0.00 
  core/U942/CIN (sky130_fd_sc_hd__fa_1)           0.05       0.01       4.11 f
  core/U942/COUT (sky130_fd_sc_hd__fa_1)          0.10       0.39       4.50 f
  core/n527 (net)                2     0.01 
  core/ctmTdsLR_1_148/A (sky130_fd_sc_hd__nand2_1)
                                                  0.10       0.00       4.50 f
  core/ctmTdsLR_1_148/Y (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.07       4.58 r
  core/tmp_net37 (net)           1     0.00 
  core/ctmTdsLR_2_149/A (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.00       4.58 r
  core/ctmTdsLR_2_149/Y (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.06       4.64 f
  core/n511 (net)                1     0.01 
  core/U905/CIN (sky130_fd_sc_hd__fa_2)           0.05       0.01       4.65 f
  core/U905/COUT (sky130_fd_sc_hd__fa_2)          0.07       0.33       4.98 f
  core/n497 (net)                1     0.00 
  core/U887/CIN (sky130_fd_sc_hd__fa_1)           0.07       0.01       4.99 f
  core/U887/COUT (sky130_fd_sc_hd__fa_1)          0.09       0.38       5.37 f
  core/n965 (net)                1     0.01 
  core/U1370/CIN (sky130_fd_sc_hd__fa_2)          0.09       0.01       5.38 f
  core/U1370/COUT (sky130_fd_sc_hd__fa_2)         0.08       0.36 &     5.74 f
  core/n483 (net)                1     0.01 
  core/U36/CIN (sky130_fd_sc_hd__fa_2)            0.08       0.00 &     5.74 f
  core/U36/COUT (sky130_fd_sc_hd__fa_2)           0.09       0.37 &     6.11 f
  core/n469 (net)                2     0.01 
  core/U87/A (sky130_fd_sc_hd__clkinv_1)          0.09       0.00 &     6.11 f
  core/U87/Y (sky130_fd_sc_hd__clkinv_1)          0.03       0.06       6.17 r
  core/n257 (net)                1     0.00 
  core/U613/A2 (sky130_fd_sc_hd__o21ai_1)         0.03       0.01       6.17 r
  core/U613/Y (sky130_fd_sc_hd__o21ai_1)          0.06       0.06       6.23 f
  core/n452 (net)                1     0.00 
  core/U352/CIN (sky130_fd_sc_hd__fa_1)           0.06       0.01       6.24 f
  core/U352/COUT (sky130_fd_sc_hd__fa_1)          0.07       0.36 &     6.60 f
  core/n438 (net)                1     0.00 
  core/U348/CI (sky130_fd_sc_hd__fah_1)           0.07       0.00 &     6.60 f
  core/U348/COUT (sky130_fd_sc_hd__fah_1)         0.07       0.26       6.87 f
  core/n407 (net)                1     0.00 
  core/U35/CIN (sky130_fd_sc_hd__fa_1)            0.07       0.01       6.87 f
  core/U35/COUT (sky130_fd_sc_hd__fa_1)           0.09       0.38       7.26 f
  core/n382 (net)                1     0.01 
  core/U33/CIN (sky130_fd_sc_hd__fa_2)            0.09       0.01       7.27 f
  core/U33/COUT (sky130_fd_sc_hd__fa_2)           0.07       0.36       7.62 f
  core/n357 (net)                2     0.01 
  core/ctmTdsLR_1_150/A (sky130_fd_sc_hd__nand2_1)
                                                  0.07       0.00       7.63 f
  core/ctmTdsLR_1_150/Y (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.07       7.69 r
  core/tmp_net38 (net)           1     0.00 
  core/ctmTdsLR_2_151/A (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.00       7.70 r
  core/ctmTdsLR_2_151/Y (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.06 &     7.75 f
  core/n330 (net)                1     0.01 
  core/U347/CIN (sky130_fd_sc_hd__fa_1)           0.05       0.00 &     7.76 f
  core/U347/COUT (sky130_fd_sc_hd__fa_1)          0.08       0.37       8.13 f
  core/n305 (net)                1     0.00 
  core/U351/CIN (sky130_fd_sc_hd__fa_1)           0.08       0.01       8.14 f
  core/U351/COUT (sky130_fd_sc_hd__fa_1)          0.08       0.38 &     8.52 f
  core/n262 (net)                1     0.00 
  core/U617/B (sky130_fd_sc_hd__xor2_1)           0.08       0.00 &     8.52 f
  core/U617/X (sky130_fd_sc_hd__xor2_1)           0.16       0.17       8.69 r
  core/n286 (net)                2     0.01 
  core/U618/A (sky130_fd_sc_hd__nand2_1)          0.16       0.00       8.69 r
  core/U618/Y (sky130_fd_sc_hd__nand2_1)          0.32       0.25       8.95 f
  core/n284 (net)               15     0.04 
  core/U653/B2 (sky130_fd_sc_hd__o22ai_1)         0.32       0.00       8.95 f
  core/U653/Y (sky130_fd_sc_hd__o22ai_1)          0.18       0.19       9.13 r
  core/n3328 (net)               1     0.00 
  core/CPU_Xreg_value_a4_reg[3][31]/D (sky130_fd_sc_hd__dfxtp_4)
                                                  0.18       0.00       9.14 r
  data arrival time                                                     9.14

  clock clk (rise edge)                           0.00      10.00      10.00
  clock network delay (propagated)                           0.42      10.42
  clock reconvergence pessimism                              0.00      10.42
  clock uncertainty                                         -0.50       9.92
  core/CPU_Xreg_value_a4_reg[3][31]/CLK (sky130_fd_sc_hd__dfxtp_4)      9.92 r
  library setup time                                        -0.08       9.84
  data required time                                                    9.84
  -----------------------------------------------------------------------------
  data required time                                                    9.84
  data arrival time                                                    -9.14
  -----------------------------------------------------------------------------
  slack (MET)                                                           0.70


```

we use the following command to resolve the issue with excessive fanouts

```
set_max_capacitance 0.015 [get_clocks clk] 
```

```

pt_shell> report_timing -path_type full -delay_type max -input_pins -nets -max_paths 1 -transition_time -capacitance -sort_by slack
****************************************
Report : timing
	-path_type full
	-delay_type max
	-input_pins
	-nets
	-max_paths 1
	-transition_time
	-capacitance
	-sort_by slack
Design : vsdbabysoc
Version: T-2022.03-SP5-4
Date   : Fri Nov  8 12:43:15 2024
****************************************


  Startpoint: core/CPU_is_add_a3_reg
               (rising edge-triggered flip-flop clocked by clk)
  Endpoint: core/CPU_Xreg_value_a4_reg[17][30]
               (rising edge-triggered flip-flop clocked by clk)
  Last common pin: pll/CLK
  Path Group: clk
  Path Type: max

  Point                       Fanout    Cap      Trans       Incr       Path
  -----------------------------------------------------------------------------
  clock clk (rise edge)                           0.00       0.00       0.00
  clock network delay (propagated)                           0.49       0.49
  core/CPU_is_add_a3_reg/CLK (sky130_fd_sc_hd__dfxtp_1)
                                                  0.23       0.00       0.49 r
  core/CPU_is_add_a3_reg/Q (sky130_fd_sc_hd__dfxtp_1)
                                                  0.04       0.36       0.85 f
  core/CPU_is_add_a3 (net)       2     0.00 
  core/U474/B (sky130_fd_sc_hd__nor2_1)           0.04       0.00       0.85 f
  core/U474/Y (sky130_fd_sc_hd__nor2_1)           0.12       0.11       0.96 r
  core/n144 (net)                2     0.01 
  core/U476/A (sky130_fd_sc_hd__nand2_1)          0.12       0.00       0.96 r
  core/U476/Y (sky130_fd_sc_hd__nand2_1)          0.06       0.08       1.05 f
  core/n147 (net)                2     0.01 
  core/HFSINV_2850_169/A (sky130_fd_sc_hd__clkinv_1)
                                                  0.06       0.00       1.05 f
  core/HFSINV_2850_169/Y (sky130_fd_sc_hd__clkinv_1)
                                                  0.05       0.07       1.11 r
  core/HFSNET_146 (net)          3     0.01 
  core/ZBUF_248_inst_8798/A (sky130_fd_sc_hd__clkbuf_1)
                                                  0.05       0.00       1.12 r
  core/ZBUF_248_inst_8798/X (sky130_fd_sc_hd__clkbuf_1)
                                                  0.11       0.13       1.24 r
  core/ZBUF_248_112 (net)        3     0.01 
  core/gre_mt_inst_11448/A (sky130_fd_sc_hd__buf_2)
                                                  0.11       0.00       1.25 r
  core/gre_mt_inst_11448/X (sky130_fd_sc_hd__buf_2)
                                                  0.06       0.14       1.38 r
  core/gre_net_323 (net)         3     0.01 
  core/gre_mt_inst_11943/A (sky130_fd_sc_hd__clkbuf_1)
                                                  0.06       0.00       1.39 r
  core/gre_mt_inst_11943/X (sky130_fd_sc_hd__clkbuf_1)
                                                  0.15       0.16       1.55 r
  core/gre_net_818 (net)         3     0.01 
  core/gre_mt_inst_11447/A (sky130_fd_sc_hd__clkbuf_1)
                                                  0.15       0.00       1.55 r
  core/gre_mt_inst_11447/X (sky130_fd_sc_hd__clkbuf_1)
                                                  0.16       0.18       1.73 r
  core/gre_net_322 (net)         3     0.01 
  core/ctmTdsLR_2_216/A (sky130_fd_sc_hd__xnor2_1)
                                                  0.16       0.01       1.74 r
  core/ctmTdsLR_2_216/Y (sky130_fd_sc_hd__xnor2_1)
                                                  0.09       0.13       1.87 f
  core/n210 (net)                2     0.01 
  core/ctmTdsLR_1_276/A1 (sky130_fd_sc_hd__a21boi_2)
                                                  0.09       0.01       1.87 f
  core/ctmTdsLR_1_276/Y (sky130_fd_sc_hd__a21boi_2)
                                                  0.13       0.17       2.04 r
  core/n809 (net)                2     0.01 
  core/U571/A2 (sky130_fd_sc_hd__o21ai_1)         0.13       0.00       2.04 r
  core/U571/Y (sky130_fd_sc_hd__o21ai_1)          0.08       0.10       2.14 f
  core/n791 (net)                2     0.01 
  core/ctmTdsLR_1_283/A1 (sky130_fd_sc_hd__a21boi_1)
                                                  0.08       0.00       2.15 f
  core/ctmTdsLR_1_283/Y (sky130_fd_sc_hd__a21boi_1)
                                                  0.20       0.19       2.34 r
  core/n774 (net)                2     0.01 
  core/U576/A2 (sky130_fd_sc_hd__o21ai_1)         0.20       0.00       2.34 r
  core/U576/Y (sky130_fd_sc_hd__o21ai_1)          0.08       0.11       2.46 f
  core/n755 (net)                2     0.01 
  core/ctmTdsLR_1_295/A1 (sky130_fd_sc_hd__a21boi_1)
                                                  0.08       0.00       2.46 f
  core/ctmTdsLR_1_295/Y (sky130_fd_sc_hd__a21boi_1)
                                                  0.18       0.18       2.64 r
  core/n740 (net)                2     0.01 
  core/U583/A2 (sky130_fd_sc_hd__o21ai_0)         0.18       0.00       2.65 r
  core/U583/Y (sky130_fd_sc_hd__o21ai_0)          0.05       0.09       2.74 f
  core/n722 (net)                1     0.00 
  core/gre_mt_inst_11828/A (sky130_fd_sc_hd__buf_2)
                                                  0.05       0.00       2.74 f
  core/gre_mt_inst_11828/X (sky130_fd_sc_hd__buf_2)
                                                  0.03       0.13       2.87 f
  core/gre_net_703 (net)         2     0.01 
  core/ctmTdsLR_1_300/A1 (sky130_fd_sc_hd__a21boi_2)
                                                  0.03       0.01       2.87 f
  core/ctmTdsLR_1_300/Y (sky130_fd_sc_hd__a21boi_2)
                                                  0.13       0.14       3.02 r
  core/n707 (net)                2     0.01 
  core/U589/A2 (sky130_fd_sc_hd__o21ai_1)         0.13       0.00       3.02 r
  core/U589/Y (sky130_fd_sc_hd__o21ai_1)          0.09       0.11       3.13 f
  core/n689 (net)                2     0.01 
  core/ctmTdsLR_1_301/A1 (sky130_fd_sc_hd__a21boi_2)
                                                  0.09       0.01       3.14 f
  core/ctmTdsLR_1_301/Y (sky130_fd_sc_hd__a21boi_2)
                                                  0.13       0.17       3.30 r
  core/n674 (net)                2     0.01 
  core/U213/A2 (sky130_fd_sc_hd__o21ai_1)         0.13       0.00       3.30 r
  core/U213/Y (sky130_fd_sc_hd__o21ai_1)          0.09       0.11       3.41 f
  core/n656 (net)                2     0.01 
  core/ctmTdsLR_1_302/A1 (sky130_fd_sc_hd__a21boi_2)
                                                  0.09       0.01       3.42 f
  core/ctmTdsLR_1_302/Y (sky130_fd_sc_hd__a21boi_2)
                                                  0.13       0.17       3.58 r
  core/n641 (net)                2     0.01 
  core/U210/A2 (sky130_fd_sc_hd__o21ai_1)         0.13       0.00       3.59 r
  core/U210/Y (sky130_fd_sc_hd__o21ai_1)          0.08       0.10       3.69 f
  core/n623 (net)                2     0.01 
  core/ctmTdsLR_1_303/A1 (sky130_fd_sc_hd__a21boi_1)
                                                  0.08       0.00       3.69 f
  core/ctmTdsLR_1_303/Y (sky130_fd_sc_hd__a21boi_1)
                                                  0.10       0.12       3.82 r
  core/n608 (net)                1     0.00 
  core/gre_mt_inst_11479/A (sky130_fd_sc_hd__clkbuf_1)
                                                  0.10       0.00       3.82 r
  core/gre_mt_inst_11479/X (sky130_fd_sc_hd__clkbuf_1)
                                                  0.10       0.13       3.95 r
  core/gre_net_354 (net)         2     0.01 
  core/U209/A2 (sky130_fd_sc_hd__o21ai_1)         0.10       0.00       3.96 r
  core/U209/Y (sky130_fd_sc_hd__o21ai_1)          0.09       0.10       4.06 f
  core/n590 (net)                2     0.01 
  core/ctmTdsLR_1_304/A1 (sky130_fd_sc_hd__a21boi_2)
                                                  0.09       0.01       4.07 f
  core/ctmTdsLR_1_304/Y (sky130_fd_sc_hd__a21boi_2)
                                                  0.13       0.17       4.23 r
  core/n575 (net)                2     0.01 
  core/U215/A2 (sky130_fd_sc_hd__o21ai_1)         0.13       0.00       4.23 r
  core/U215/Y (sky130_fd_sc_hd__o21ai_1)          0.08       0.10       4.33 f
  core/n557 (net)                2     0.01 
  core/ctmTdsLR_1_305/A (sky130_fd_sc_hd__nand2_1)
                                                  0.08       0.00       4.34 f
  core/ctmTdsLR_1_305/Y (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.07       4.40 r
  core/tmp_net37 (net)           1     0.00 
  core/ctmTdsLR_2_306/A (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.00       4.41 r
  core/ctmTdsLR_2_306/Y (sky130_fd_sc_hd__nand2_1)
                                                  0.03       0.04       4.45 f
  core/n541 (net)                1     0.00 
  core/U942/CI (sky130_fd_sc_hd__fah_1)           0.03       0.00       4.46 f
  core/U942/COUT (sky130_fd_sc_hd__fah_1)         0.08       0.26       4.71 f
  core/n527 (net)                2     0.01 
  core/ctmTdsLR_1_307/A (sky130_fd_sc_hd__nand2_1)
                                                  0.08       0.00       4.72 f
  core/ctmTdsLR_1_307/Y (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.07       4.78 r
  core/tmp_net38 (net)           1     0.00 
  core/ctmTdsLR_2_308/A (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.00       4.79 r
  core/ctmTdsLR_2_308/Y (sky130_fd_sc_hd__nand2_1)
                                                  0.03       0.04       4.83 f
  core/n511 (net)                1     0.00 
  core/U905/CI (sky130_fd_sc_hd__fah_1)           0.03       0.00       4.84 f
  core/U905/COUT (sky130_fd_sc_hd__fah_1)         0.07       0.24       5.08 f
  core/n497 (net)                1     0.00 
  core/U887/CIN (sky130_fd_sc_hd__fa_1)           0.07       0.01       5.09 f
  core/U887/COUT (sky130_fd_sc_hd__fa_1)          0.08       0.38 &     5.47 f
  core/n965 (net)                1     0.00 
  core/U1370/CI (sky130_fd_sc_hd__fah_1)          0.08       0.00 &     5.47 f
  core/U1370/COUT (sky130_fd_sc_hd__fah_1)        0.07       0.27       5.73 f
  core/n483 (net)                1     0.00 
  core/U36/CIN (sky130_fd_sc_hd__fa_1)            0.07       0.01       5.74 f
  core/U36/COUT (sky130_fd_sc_hd__fa_1)           0.10       0.40       6.14 f
  core/n469 (net)                2     0.01 
  core/U87/A (sky130_fd_sc_hd__clkinv_1)          0.10       0.00       6.15 f
  core/U87/Y (sky130_fd_sc_hd__clkinv_1)          0.04       0.06       6.21 r
  core/n257 (net)                1     0.00 
  core/U613/A2 (sky130_fd_sc_hd__o21ai_1)         0.04       0.01       6.21 r
  core/U613/Y (sky130_fd_sc_hd__o21ai_1)          0.06       0.06       6.27 f
  core/n452 (net)                1     0.00 
  core/U352/CIN (sky130_fd_sc_hd__fa_1)           0.06       0.01       6.28 f
  core/U352/COUT (sky130_fd_sc_hd__fa_1)          0.08       0.38       6.66 f
  core/n438 (net)                1     0.00 
  core/U348/CIN (sky130_fd_sc_hd__fa_1)           0.08       0.01       6.66 f
  core/U348/COUT (sky130_fd_sc_hd__fa_1)          0.07       0.36       7.03 f
  core/n407 (net)                1     0.00 
  core/U35/CI (sky130_fd_sc_hd__fah_1)            0.07       0.00       7.03 f
  core/U35/COUT (sky130_fd_sc_hd__fah_1)          0.07       0.26       7.29 f
  core/n382 (net)                1     0.00 
  core/U33/CIN (sky130_fd_sc_hd__fa_1)            0.07       0.01       7.30 f
  core/U33/COUT (sky130_fd_sc_hd__fa_1)           0.10       0.40       7.70 f
  core/n357 (net)                2     0.01 
  core/ctmTdsLR_1_309/A (sky130_fd_sc_hd__nand2_1)
                                                  0.10       0.00       7.70 f
  core/ctmTdsLR_1_309/Y (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.07       7.77 r
  core/tmp_net39 (net)           1     0.00 
  core/ctmTdsLR_2_310/A (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.00       7.78 r
  core/ctmTdsLR_2_310/Y (sky130_fd_sc_hd__nand2_1)
                                                  0.05       0.06       7.83 f
  core/n330 (net)                1     0.00 
  core/U347/CIN (sky130_fd_sc_hd__fa_1)           0.05       0.01       7.84 f
  core/U347/COUT (sky130_fd_sc_hd__fa_1)          0.08       0.37       8.21 f
  core/n305 (net)                1     0.00 
  core/U351/CIN (sky130_fd_sc_hd__fa_1)           0.08       0.01       8.22 f
  core/U351/SUM (sky130_fd_sc_hd__fa_1)           0.09       0.45       8.67 f
  core/n312 (net)                2     0.00 
  core/U3/A (sky130_fd_sc_hd__nand2_1)            0.09       0.00       8.68 f
  core/U3/Y (sky130_fd_sc_hd__nand2_1)            0.09       0.10       8.78 r
  core/n310 (net)                3     0.01 
  core/ZBUF_629_inst_5454/A (sky130_fd_sc_hd__clkbuf_1)
                                                  0.09       0.00       8.78 r
  core/ZBUF_629_inst_5454/X (sky130_fd_sc_hd__clkbuf_1)
                                                  0.15       0.16 &     8.95 r
  core/ZBUF_629_687 (net)        3     0.01 
  core/gre_mt_inst_11684/A (sky130_fd_sc_hd__buf_2)
                                                  0.15       0.00 &     8.95 r
  core/gre_mt_inst_11684/X (sky130_fd_sc_hd__buf_2)
                                                  0.06       0.15       9.10 r
  core/gre_net_559 (net)         4     0.01 
  core/ZBUF_187_inst_7657/A (sky130_fd_sc_hd__clkbuf_1)
                                                  0.06       0.00       9.11 r
  core/ZBUF_187_inst_7657/X (sky130_fd_sc_hd__clkbuf_1)
                                                  0.08       0.11 &     9.22 r
  core/ZBUF_187_19 (net)         2     0.01 
  core/gre_mt_inst_11913/A (sky130_fd_sc_hd__buf_2)
                                                  0.08       0.00 &     9.22 r
  core/gre_mt_inst_11913/X (sky130_fd_sc_hd__buf_2)
                                                  0.06       0.13       9.35 r
  core/gre_net_788 (net)         4     0.01 
  core/gre_mt_inst_11912/A (sky130_fd_sc_hd__clkbuf_1)
                                                  0.06       0.00       9.35 r
  core/gre_mt_inst_11912/X (sky130_fd_sc_hd__clkbuf_1)
                                                  0.20       0.19 &     9.54 r
  core/gre_net_787 (net)         4     0.02 
  core/U698/B2 (sky130_fd_sc_hd__o22ai_1)         0.20       0.00 &     9.55 r
  core/U698/Y (sky130_fd_sc_hd__o22ai_1)          0.06       0.09       9.63 f
  core/n2975 (net)               1     0.00 
  core/CPU_Xreg_value_a4_reg[17][30]/D (sky130_fd_sc_hd__dfxtp_4)
                                                  0.06       0.00       9.64 f
  data arrival time                                                     9.64

  clock clk (rise edge)                           0.00      10.00      10.00
  clock network delay (propagated)                           0.74      10.74
  clock reconvergence pessimism                              0.00      10.74
  clock uncertainty                                         -0.50      10.24
  core/CPU_Xreg_value_a4_reg[17][30]/CLK (sky130_fd_sc_hd__dfxtp_4)    10.24 r
  library setup time                                        -0.09      10.15
  data required time                                                   10.15
  -----------------------------------------------------------------------------
  data required time                                                   10.15
  data arrival time                                                    -9.64
  -----------------------------------------------------------------------------
  slack (MET)                                                           0.52


```

![output (7)](https://github.com/user-attachments/assets/a2b2550f-87d5-4506-992b-62772ce86159)


Sources:
https://www.linkedin.com/posts/prince-gupta-8b253987_voltagearea-powerdomain-pgregion-activity-7106881371071004672-55rv/

https://semiengineering.com/upf-power-domains-and-boundaries/

https://semiengineering.com/upf-power-domains-and-boundaries/


<h2> ECO Fixing </h2>

```

set link_path "* /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/sky130_fd_sc_hd__tt_025C_1v80.db /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/avsdpll.db /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/avsddac.db"

read_verilog /home/ganesh/ICC2_VSDBabySoC/runareaPDflow2/vsdbabysoc_post_route_net.v
current_design vsdbabysoc
link_design

set_min_library -min_version /home/ganesh/VSDBabySoC/src/timing_libs/sky130_fd_sc_hd__ff_n40C_1v95.db /home/ganesh/VSDBabySoC/src/timing_libs/sky130_fd_sc_hd__ss_n40C_1v28.db

read_sdc /home/ganesh/ICC2_VSDBabySoC/runareaPDflow2/vsdbabysoc_post_route.sdc

read_parasitics /home/ganesh/ICC2_VSDBabySoC/runareaPDflow2/vsdbabysoc_parasitics.temp1_25.spef

update_timing -full

report_analysis_coverage > prime_time_analysis_coverage.rpt
report_constraint -all_violators > prime_time_constraint.rpt
report_timing -delay_type max -capacitance -input_pins -nets -transition_time -nosplit -significant_digits 4 > prime_time_setup_timing.rpt
report_timing -delay_type min -capacitance -input_pins -nets -transition_time -nosplit -significant_digits 4 > prime_time_hold_timing.rpt


```


```
****************************************
Report : analysis_coverage
Design : vsdbabysoc
Version: T-2022.03-SP5-4
Date   : Sun Nov 10 01:34:32 2024
****************************************

Type of Check         Total              Met         Violated         Untested
--------------------------------------------------------------------------------
setup                   676       675 (100%)         0 (  0%)         1 (  0%)
hold                    676       629 ( 93%)        46 (  7%)         1 (  0%)
min_pulse_width        1352      1352 (100%)         0 (  0%)         0 (  0%)
--------------------------------------------------------------------------------
All Checks             2704      2656 ( 98%)        46 (  2%)         2 (  0%)

1


```
after running fix_eco_timing -type setup in the pt shell

```

Final ECO Summary:
--------------------------------------------------------
Total number of commands                               0
Total area increased                                0.00

Fixing Summary:
--------------------------------------------------------
Total violating endpoints found                        0
Total violating endpoints fixed                        0
Total violating endpoints remaining                    0
Total percentage of violations fixed                 0.0%

Information: Elapsed time [                1 seconds ]
Information: Completed at [ Sun Nov 10 01:36:33 2024 ]


```

The fix_eco_timing command is used to correct hold timing violations in the design by inserting buffers. By specifying the -type hold option, the command focuses exclusively on addressing hold violations. The -methods insert_buffer option directs the tool to insert buffers as the method of correction. Additionally, the -buffer_list option provides a list of specific buffer cells {sky130_fd_sc_hd__buf_1 sky130_fd_sc_hd__buf_2 sky130_fd_sc_hd__buf_4 sky130_fd_sc_hd__buf_8}, which are used for buffer insertion during this process. This approach helps achieve timing closure for hold requirements by adjusting signal delays at specific points in the design.

```
Inserted buffers:
   Count Lib_cell               Area          Total_area
--------------------------------------------------------
      46 sky130_fd_sc_hd__buf_1   3.75              172.67
--------------------------------------------------------
      46 TOTAL                                    172.67

Final ECO Summary:
--------------------------------------------------------
Number of insert_buffer commands                      46
Total number of commands                              46
Area increased by buffer insertion                172.67
Total area increased                              172.67

Fixing Summary:
--------------------------------------------------------
Total violating endpoints found                       46
Total violating endpoints fixed                       46
Total violating endpoints remaining                    0
Total percentage of violations fixed               100.0%

Information: Elapsed time [                0 seconds ]
Information: Completed at [ Sun Nov 10 01:39:30 2024 ]


```


```
****************************************
Report : analysis_coverage
Design : vsdbabysoc
Version: T-2022.03-SP5-4
Date   : Sun Nov 10 01:42:51 2024
****************************************

Type of Check         Total              Met         Violated         Untested
--------------------------------------------------------------------------------
setup                   676       675 (100%)         0 (  0%)         1 (  0%)
hold                    676       675 (100%)         0 (  0%)         1 (  0%)
min_pulse_width        1352      1352 (100%)         0 (  0%)         0 (  0%)
--------------------------------------------------------------------------------
All Checks             2704      2702 (100%)         0 (  0%)         2 (  0%)

1

```

<img width="1285" alt="Screenshot 2024-11-09 at 3 22 10 PM" src="https://github.com/user-attachments/assets/f6d0a349-a081-45bb-9d7d-6e8a3a376e24">


We now observe that check_legality fails after sourcing vsdbabysoc_eco.tcl in ICC2 Compiler to perform ECO.  

<img width="1268" alt="Screenshot 2024-11-10 at 7 27 04 AM" src="https://github.com/user-attachments/assets/221b6ef2-9f28-43c3-a310-171b16d8826d">

We now use use legalize_placement command to resolve placement legalization issues.

<img width="1268" alt="Screenshot 2024-11-10 at 7 27 43 AM" src="https://github.com/user-attachments/assets/605c93e7-7b62-44ab-9fae-b369c86826ed">

We now use the route_eco command to perform ECO (Engineering Change Order) routing. It connects open nets first and then addresses any DRC (Design Rule Check) violations. The command options allow control over which nets are connected and specify the areas of the chip where DRC violations should be corrected.

<img width="1268" alt="Screenshot 2024-11-10 at 7 31 28 AM" src="https://github.com/user-attachments/assets/39469ba8-7146-47f8-a7d0-2a7fd975ff9d">


```


```
<h2>  Acknowledgements  </h2>

Firstly, I would like to extend my heartfelt gratitude to VSD and SFAL, for their invaluable guidance and support throughout the VSD SoC Design and Planning training. Huge shoutout to Mr. Kunal Ghosh, founder of VSD for his invaluable guidance and support throughout the training. A particular highlight of the program is Kunal’s uncanny ability to elucidate even the most recondite terms in simple, understandable language.

I would also like to extend my thanks to Subhasis Sahu for his invaulable hints while performing the labs. 
https://github.com/Subhasis-Sahu/SFAL-VSD?tab=readme-ov-file 

Also one of the Key Acknowledgements to Devipriya A. Her Repo proved to be a invaluable reference. 
https://github.com/Devipriya1921/VSDBabySoC_ICC2

