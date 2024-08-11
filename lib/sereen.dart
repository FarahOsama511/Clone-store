import 'package:flutter/material.dart';
import 'package:rate/rate.dart';

class Screen extends StatefulWidget {
  @override
  store createState() => store();
}

class store extends State<Screen> {
  bool ispressed = false;
  int selectedSizeIndex = -1;
  int selectindex = 0;
  double currentvalue = 4.0;
  int piece = 0;
  int price() {
    int price = 89 * piece;
    return price;
  }

  @override
  Widget build(BuildContext context) {
    List<String> sizes = ['S', 'M', 'L', 'XL', '2XL'];
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          ispressed = !ispressed;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: ispressed ? Colors.red : Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 270,
                    height: 400,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: Colors.black,
                    ),
                    child: PageView(
                      children: [
                        Image.asset(
                          "assets/images/T-shirt.png",
                        ),
                        Image.asset("assets/images/shirt.png"),
                        Image.asset("assets/images/back's t-shirt.png"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: List.generate(sizes.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {
                            setState(() {
                              selectedSizeIndex = index;
                            });
                          },
                          child: Text(
                            sizes[index],
                            style: TextStyle(
                              color: selectedSizeIndex == index
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          color: selectedSizeIndex == index
                              ? Colors.red
                              : Colors.grey.shade600,
                          height: 40,
                          minWidth: 40,
                        ),
                      );
                    }),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, top: 10),
                child: Text(
                  "Belgium EURO",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Text(
                  "20/21 Away by Adidas",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Rate(
                      allowHalf: true,
                      allowClear: true,
                      readOnly: false,
                      initialValue: 4.0,
                      color: Colors.red,
                      iconSize: 30,
                      onChange: (value) {
                        setState(() {
                          currentvalue = value;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$currentvalue',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade600,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                                color: Colors.red,
                                height: 5,
                                minWidth: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                onPressed: () {
                                  setState(() {
                                    if (piece > 0) piece--;
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                )),
                            Text(
                              "$piece",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            MaterialButton(
                                height: 5,
                                minWidth: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                color: Colors.red,
                                onPressed: () {
                                  setState(() {
                                    piece++;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Details',
                            style: TextStyle(color: Colors.grey, fontSize: 20)),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Text('Material:',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)),
                            Text('Polyester',
                                style: TextStyle(
                                    color: Colors.grey.shade400, fontSize: 15)),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Shipping:',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)),
                            Text('In 5 to 6 Days',
                                style: TextStyle(
                                    color: Colors.grey.shade400, fontSize: 15)),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Returns:',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)),
                            Text('Within 20 Days',
                                style: TextStyle(
                                    color: Colors.grey.shade400, fontSize: 15)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Container(
                    height: 120,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "\$" + price().toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              )
            ]))));
  }
}
