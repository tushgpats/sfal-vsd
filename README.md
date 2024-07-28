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

<h1> Pre-requisites for Floorplanning, P&R : PD Basic concepts </h1>

<h2> SOC Design Flow <>
